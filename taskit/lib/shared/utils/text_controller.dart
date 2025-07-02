import 'package:flutter/material.dart';

class ListTextControllerManager {
  final _map = <int, TextEditingController>{};

  TextEditingController getOrCreateController(int id, String initial) {
    return _map.putIfAbsent(id, () => TextEditingController(text: initial));
  }

  void removeController(int id) {
    _map[id]?.dispose();
    _map.remove(id);
  }

  void clearAll() {
    for (final controller in _map.values) {
      controller.dispose();
    }
    _map.clear();
  }
}

class TextControllerManager {
  final TextEditingController _controller = TextEditingController();

  TextEditingController getOrCreateController({String? initial}) {
    if (initial != null && _controller.text != initial) {
      _controller.text = initial;
    }
    return _controller;
  }

  void clear() {
    _controller.text = '';
  }
}
