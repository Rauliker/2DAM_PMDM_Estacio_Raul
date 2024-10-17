import 'package:flutter_bloc/flutter_bloc.dart';
import 'theme_events.dart';
import 'theme_state.dart';
import 'package:flutter_contador/config/theme/counter_theme.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(ThemeState(AppTheme(selectedColor: 0, isDarkmode: false))) {
    on<ThemeChanged>(_onThemeChanged);
  }

  void _onThemeChanged(ThemeChanged event, Emitter<ThemeState> emit) {
    // Crea una nueva instancia de AppTheme con los nuevos valores
    final newTheme = AppTheme(
        selectedColor: event.selectedColor, isDarkmode: event.isDarkMode);

    // Emite el nuevo estado con el tema actualizado
    emit(ThemeState(newTheme));
  }
}
