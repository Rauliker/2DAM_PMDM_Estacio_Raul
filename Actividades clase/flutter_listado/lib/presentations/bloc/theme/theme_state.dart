import 'package:flutter_listado/config/theme/counter_theme.dart';

class ThemeState {
  final AppTheme currentTheme;
  final AppTheme?
      temporalTheme; // Almacenará el tema temporal si se selecciona uno

  ThemeState({
    required this.currentTheme,
    this.temporalTheme,
  });
}
