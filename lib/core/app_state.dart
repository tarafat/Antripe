import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_state.g.dart';

// Immutable state class
class AppStateData {
  final ThemeMode themeMode;
  final Locale locale;
  final String timeZone;
  final bool isAuthenticated;

  const AppStateData({this.themeMode = ThemeMode.light, this.locale = const Locale('en'), this.isAuthenticated = false, this.timeZone = 'UTC'});

  AppStateData copyWith({ThemeMode? themeMode, Locale? locale, bool? isAuthenticated, String? timeZone}) {
    return AppStateData(
      themeMode: themeMode ?? this.themeMode,
      locale: locale ?? this.locale,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      timeZone: timeZone ?? this.timeZone,
    );
  }
}

@Riverpod(keepAlive: true)
class AppState extends _$AppState {
  @override
  AppStateData build() => const AppStateData();

  void setThemeMode(ThemeMode mode) {
    state = state.copyWith(themeMode: mode);
  }

  void setLocale(Locale locale) {
    state = state.copyWith(locale: locale);
  }

  void setAuthenticationStatus(bool isAuthenticated) {
    state = state.copyWith(isAuthenticated: isAuthenticated);
  }

  void setTimeZone(String timeZone) {
    state = state.copyWith(timeZone: timeZone);
  }
}
