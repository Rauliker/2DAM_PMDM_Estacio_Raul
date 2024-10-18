abstract class ThemeEvent {}

class ThemeSelected extends ThemeEvent {
  final int selectedColor;
  final bool isDarkMode;

  ThemeSelected({required this.selectedColor, required this.isDarkMode});
}

class ApplyTheme extends ThemeEvent {}

class CancelTheme extends ThemeEvent {}
