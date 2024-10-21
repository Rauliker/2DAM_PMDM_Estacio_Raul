abstract class ThemeEvent {}

class ThemeSelected extends ThemeEvent {
  final int selectedColor;
  final bool isDarkMode;
  final double sizeText;

  ThemeSelected(
      {required this.selectedColor,
      required this.isDarkMode,
      required this.sizeText});
}

class ApplyTheme extends ThemeEvent {}

class CancelTheme extends ThemeEvent {}
