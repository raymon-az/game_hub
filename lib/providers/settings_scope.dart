import 'package:flutter/material.dart';

import 'settings_provider.dart';

class SettingsScope extends InheritedNotifier<SettingsProvider> {
  const SettingsScope({
    super.key,
    required SettingsProvider super.notifier,
    required super.child,
  });

  static SettingsProvider of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<SettingsScope>();

    if (scope == null || scope.notifier == null) {
      throw FlutterError('SettingsScope not found in the widget tree.');
    }

    return scope.notifier!;
  }
}
