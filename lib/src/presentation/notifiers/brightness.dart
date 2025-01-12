import 'dart:ui' as ui;

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'brightness.g.dart';

@Riverpod(keepAlive: true)
class Brightness extends _$Brightness {
  @override
  ui.Brightness build() => ui.Brightness.light;

  void toggle() => state =
      state == ui.Brightness.light ? ui.Brightness.dark : ui.Brightness.light;
}
