import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:taskit/features/main/presentation/main/controller/task_generate_controller.dart';

import '../../../../../../shared/log/logger_provider.dart';
import '../../controller/task_generate_text_controller.dart';

class TaskGenerateBottomSheet extends ConsumerStatefulWidget {
  const TaskGenerateBottomSheet({super.key});

  @override
  ConsumerState<TaskGenerateBottomSheet> createState() =>
      _TaskGenerateBottomSheetState();
}

class _TaskGenerateBottomSheetState
    extends ConsumerState<TaskGenerateBottomSheet> {
  bool isInit = false;
  late SpeechToText _speech;
  double _confidence = 1.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _speech = SpeechToText();
  }

  void _listen() {
    final color = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    ref.listen(taskGenerateControllerProvider.select((value) => value.error),
        (_, next) {
      if (next != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(seconds: 3),
            backgroundColor: color.error,
            content: Text(
              next,
              style: text.titleMedium?.copyWith(color: color.onError),
            ),
          ),
        );
      }
    });
    ref.listen(
        taskGenerateControllerProvider
            .select((value) => value.isGenerateSuccess), (_, next) async {
      if (next != null && next) {
        context.pop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _listen();
    final state = ref.watch(taskGenerateControllerProvider);
    final color = Theme.of(context).colorScheme;
    return SingleChildScrollView(
        padding:
            const EdgeInsets.only(top: 20, bottom: 30, left: 12, right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 30,
          children: [
            SizedBox(
              width: double.infinity,
              height: 200,
              child: Row(
                spacing: 10,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(child: _textField()),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _iconClearText(),
                      _iconEdit(),
                      _iconGenerateTask(),
                    ],
                  )
                ],
              ),
            ),
            Align(
                alignment: Alignment.center,
                child: AvatarGlow(
                    key: ValueKey<bool>(state.isListening),
                    animate: state.isListening,
                    glowColor: color.primary,
                    repeat: true,
                    glowRadiusFactor: 1.25,
                    duration: const Duration(seconds: 2),
                    curve: Curves.easeInOut,
                    child: FloatingActionButton(
                        heroTag: 'FAB Voice',
                        shape: CircleBorder(),
                        foregroundColor: color.onPrimaryContainer,
                        splashColor: color.primary,
                        backgroundColor: color.primaryContainer,
                        onPressed: _listenVoice,
                        child: Icon(
                          state.isListening ? Icons.mic : Icons.mic_none,
                          size: 30,
                        )))),
          ],
        ));
  }

  //region TextField
  Widget _textField() {
    final state = ref.watch(taskGenerateControllerProvider);
    final controller = ref.read(taskGenerateControllerProvider.notifier);
    final color = Theme.of(context).colorScheme;
    final textController = ref.watch(taskGenerateTextController);
    final text = Theme.of(context).textTheme;
    return TextField(
      maxLines: 6,
      maxLength: 60,
      autofocus: true,
      enabled: state.isEditing,
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      controller: textController.getOrCreateController(),
      decoration: InputDecoration(
          counterText: '',
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: color.primary, width: 2),
            borderRadius: BorderRadius.circular(20),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20),
          ),
          fillColor: color.surfaceContainer,
          filled: true),
      style: text.bodyLarge
          ?.copyWith(fontWeight: FontWeight.w500, color: color.onSurface),
      onChanged: (value) {
        logger.i('on title change: $value');
        controller.setText(value);
      },
    );
  }

//endregion

//region IconEdit
  Widget _iconEdit() {
    final state = ref.watch(taskGenerateControllerProvider);
    final controller = ref.read(taskGenerateControllerProvider.notifier);
    final color = Theme.of(context).colorScheme;
    return AnimatedSwitcher(
        duration: Duration(milliseconds: 400),
        child: IconButton.filledTonal(
            key: ValueKey<bool>(state.isEditing),
            iconSize: 30,
            style: IconButton.styleFrom(
                backgroundColor: state.isEditing
                    ? color.primaryContainer
                    : color.surfaceContainerHighest),
            onPressed: () => controller.setIsEditing(!state.isEditing),
            icon: Icon(
                state.isEditing ? Icons.edit_outlined : Icons.edit_rounded)));
  }

//endregion
//region Icon Generate Task
  Widget _iconGenerateTask() {
    final state = ref.watch(taskGenerateControllerProvider);
    final controller = ref.read(taskGenerateControllerProvider.notifier);
    final color = Theme.of(context).colorScheme;
    return AnimatedSwitcher(
        duration: Duration(milliseconds: 400),
        child: IconButton.filledTonal(
            key: ValueKey<bool>(state.isGenerating),
            iconSize: 30,
            style: IconButton.styleFrom(
                backgroundColor: state.isGenerating
                    ? color.primaryContainer
                    : color.surfaceContainerHighest),
            onPressed: controller.generateTask,
            icon: state.isGenerating
                ? CircularProgressIndicator()
                : Icon(Icons.send_outlined)));
  }

//endregion
//region IconClear Text
  Widget _iconClearText() {
    final state = ref.watch(taskGenerateControllerProvider);
    final textController = ref.read(taskGenerateTextController);
    final controller = ref.read(taskGenerateControllerProvider.notifier);
    final color = Theme.of(context).colorScheme;
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 400),
      child: IconButton.filledTonal(
          key: ValueKey<bool>(state.text.isNotEmpty),
          iconSize: 30,
          color: state.text.isNotEmpty
              ? color.onSurface
              : color.onSurfaceVariant.withAlpha(50),
          style: IconButton.styleFrom(
              backgroundColor: state.text.isNotEmpty
                  ? color.surfaceContainerHighest
                  : color.surfaceContainer),
          onPressed: () {
            if (state.text.isNotEmpty) {
              controller.setText('');
              textController.clear();
            }
          },
          icon: Icon(Icons.clear_sharp)),
    );
  }

//endregion
//region FAB VOICE
  Widget _fabVoice() {
    return Consumer(builder: (context, ref, child) {
      final state = ref.watch(taskGenerateControllerProvider);
      final color = Theme.of(context).colorScheme;
      logger.i('reload FAB Voice ${state.isListening}');
      return AvatarGlow(
          animate: _speech.isListening,
          glowColor: color.primary,
          repeat: true,
          glowRadiusFactor: 1.25,
          duration: const Duration(seconds: 2),
          curve: Curves.easeInOut,
          child: FloatingActionButton(
              heroTag: 'FAB Voice',
              shape: CircleBorder(),
              foregroundColor: color.onPrimaryContainer,
              splashColor: color.primary,
              backgroundColor: color.primaryContainer,
              onPressed: _listenVoice,
              child: Icon(
                state.isListening ? Icons.mic : Icons.mic_none,
                size: 30,
              )));
    });
  }

//endregion
//region START VOICE LISTEN
  void _listenVoice() async {
    final controller = ref.read(taskGenerateControllerProvider.notifier);
    final textController = ref.watch(taskGenerateTextController);
    final available = await _speech.initialize(
      onStatus: (status) {
        logger.i('🎙 onStatus: $status');
        if (status == 'listening') {
          controller.setIsListening(true);
        }
        if (status == 'notListening') {
          controller.setIsListening(false);
        }
      },
      onError: (error) {
        logger.e('onError: $error');
        controller.setIsListening(false);
      },
    );
    if (!available) return;
    if (_speech.isListening) {
      await _speech.stop();
      controller.setIsListening(false);
      return;
    }
    _speech.listen(
      onResult: (result) {
        logger.i('Result: ${result.recognizedWords}');
        controller.setText(result.recognizedWords);
        textController.getOrCreateController().text = result.recognizedWords;

        if (result.hasConfidenceRating && result.confidence > 0) {
          _confidence = result.confidence;
        }
      },
    );
  }

//endregion
}
