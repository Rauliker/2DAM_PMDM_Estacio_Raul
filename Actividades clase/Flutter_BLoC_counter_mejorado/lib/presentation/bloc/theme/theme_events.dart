abstract class ThemeEvent {}

class ThemeChanged extends ThemeEvent {
  final int selectedColor;
  final bool isDarkMode;

  ThemeChanged(this.selectedColor, this.isDarkMode);
}
