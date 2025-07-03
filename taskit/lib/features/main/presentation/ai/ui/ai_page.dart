import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:taskit/features/main/domain/entity/message.dart';
import 'package:taskit/features/main/presentation/ai/controller/ai_chat_text_controller.dart';
import 'package:taskit/features/main/presentation/ai/controller/ai_controller.dart';

class AiPage extends ConsumerStatefulWidget {
  const AiPage({super.key});

  @override
  ConsumerState<AiPage> createState() => _AiPageState();
}

class _AiPageState extends ConsumerState<AiPage> {
  final _scrollController = ScrollController();

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _listen() {
    final color = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    ref.listen(aiControllerProvider.select((value) => value.isReceiveAiMessage),
        (_, next) {
      if (next != null && next) {
        _scrollToBottom();
      }
    });
  }

  void _sendMessage() {
    final textController = ref.watch(aiChatTextControllerProvider);
    if (textController.getOrCreateController().text.isEmpty) return;
    final controller = ref.read(aiControllerProvider.notifier);
    final content = textController.getOrCreateController().text.trim();
    controller.addMessage(Message(
        content: content,
        isUser: true,
        timestamp: DateTime.now(),
        id: _generateId()));
    textController.getOrCreateController().clear();
    _scrollToBottom();
    controller.sendMessage(content);
  }

  Widget _avatar(bool isUser) {
    final color = Theme.of(context).colorScheme;
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isUser ? color.tertiaryContainer : color.primaryContainer,
      ),
      child: Icon(
        isUser ? Icons.person : Icons.smart_toy_outlined,
        color: isUser ? color.onTertiaryContainer : color.onPrimaryContainer,
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(aiControllerProvider.notifier).addMessage(Message(
          content:
              "Xin chào, tôi là Ai hỗ trợ công việc của bạn!, tôi có thể giúp gì cho bạn",
          isUser: false,
          timestamp: DateTime.now(),
          id: _generateId()));
    });
  }

  String _generateId() =>
      DateTime.now().millisecondsSinceEpoch.toString() +
      Random().nextInt(1000).toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          top: true,
          child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) =>
                  [_topAppBar()],
              body: Padding(
                padding: const EdgeInsets.only(top: 16),
                child: _body(),
              ))),
    );
  }

  //region Top APPBAR
  Widget _topAppBar() {
    final color = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    return SliverAppBar(
      pinned: true,
      floating: true,
      backgroundColor: color.primary,
      toolbarHeight: 70,
      leading: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Icon(
          Icons.smart_toy_outlined,
          size: 35,
        ),
      ),
      title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Taskit AI',
              style: text.headlineSmall,
            ),
            Text(
              'Ask me anything about your task!',
              style: text.labelLarge?.copyWith(
                  color: color.onPrimary, fontWeight: FontWeight.w500),
            )
          ]),
      actionsPadding: EdgeInsets.symmetric(horizontal: 5),
    );
  }

//endregion
//region body
  Widget _body() {
    final state = ref.watch(aiControllerProvider);
    final color = Theme.of(context).colorScheme;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Expanded(
        child: ListView.builder(
          controller: _scrollController,
          padding: EdgeInsets.symmetric(horizontal: 16),
          itemCount: state.message.length + (state.isLoading ? 1 : 0),
          itemBuilder: (context, index) =>
              (index == state.message.length && state.isLoading)
                  ? Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: _messageLoading())
                  : _messageBubble(state.message[index]),
        ),
      ),
      _textInput(),
    ]);
  }

//endregion
//region Message Loading
  Widget _messageLoading() {
    final color = Theme.of(context).colorScheme;
    return Row(
      spacing: 10,
      children: [
        _avatar(false),
        LoadingAnimationWidget.staggeredDotsWave(
          color: color.primary,
          size: 40,
        ),
      ],
    );
  }

//endregion
//region Message bubble
  Widget _messageBubble(Message message) {
    final color = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment:
            message.isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        spacing: 10,
        children: [
          if (!message.isUser) _avatar(false),
          Flexible(
            child: Container(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.75),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: message.isUser
                    ? color.tertiaryContainer
                    : color.primaryContainer,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                message.content,
                style: text.labelLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: message.isUser
                        ? color.onTertiaryContainer
                        : color.onPrimaryContainer),
              ),
            ),
          ),
          if (message.isUser) _avatar(true)
        ],
      ),
    );
  }

//endregion
//region text input
  Widget _textInput() {
    final color = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    final controller = ref.watch(aiControllerProvider.notifier);
    final textController = ref.watch(aiChatTextControllerProvider);
    final state = ref.watch(aiControllerProvider);
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Row(
        spacing: 8,
        children: [
          Expanded(
              child: Container(
                  decoration: BoxDecoration(
                    color: color.surfaceContainerHigh,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                    maxLines: null,
                    controller: textController.getOrCreateController(),
                    style: text.labelLarge,
                    onSubmitted: (value) => _sendMessage(),
                    onTapOutside: (value) => FocusScope.of(context).unfocus(),
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                        hintText: 'Type your message...',
                        hintStyle: text.labelLarge
                            ?.copyWith(color: color.onSurfaceVariant),
                        border: InputBorder.none),
                  ))),
          IconButton.filled(
              onPressed: _sendMessage,
              style: ButtonStyle(
                backgroundColor:
                    WidgetStatePropertyAll(color.surfaceContainerHighest),
              ),
              padding: EdgeInsets.all(10),
              icon: Icon(
                state.isLoading ? Icons.hourglass_bottom : Icons.send,
                size: 25,
                color: color.primary,
              ))
        ],
      ),
    );
  }
//endregion
}
