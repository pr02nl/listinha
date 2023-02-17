import 'package:flutter/material.dart';
import 'package:listinha/src/configuration/services/configuration_service.dart';

class AppStore {
  final themeMode = ValueNotifier<ThemeMode>(ThemeMode.system);
  final syncDate = ValueNotifier<DateTime?>(null);

  final ConfigurationService _configurationService;

  AppStore(this._configurationService) {
    init();
  }

  void init() {
    final configuration = _configurationService.getConfiguration();
    syncDate.value = configuration.syncDate;
    themeMode.value = _getThemeModeByName(configuration.themeModeName);
  }

  void save() {
    _configurationService.saveConfiguration(
      themeMode.value.name,
      syncDate.value,
    );
  }

  void changeThemeMode(ThemeMode? mode) {
    if (mode != null) {
      themeMode.value = mode;
      save();
    }
  }

  void setSyncDate(DateTime date) {
    syncDate.value = date;
    save();
  }

  void deleteAll() {
    _configurationService.deleteAll();
  }

  ThemeMode _getThemeModeByName(String name) {
    return ThemeMode.values.firstWhere(
      (mode) => mode.name == name,
      orElse: () => ThemeMode.system,
    );
  }
}
