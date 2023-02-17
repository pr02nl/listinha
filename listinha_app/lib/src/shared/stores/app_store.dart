import 'package:flutter/material.dart';

class AppStore {
  final themeMode = ValueNotifier<ThemeMode>(ThemeMode.system);
  void changeThemeMode(ThemeMode? mode) {
    if (mode != null) {
      themeMode.value = mode;
      save();
    }
  }

  void save() {
    //TODO(pr02nl): save theme mode
  }
}
