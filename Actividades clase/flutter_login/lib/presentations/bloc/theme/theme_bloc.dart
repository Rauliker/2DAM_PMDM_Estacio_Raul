import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_listado/config/theme/counter_theme.dart';
import 'theme_events.dart';
import 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  late AppTheme
      _originalTheme; // Guardamos el tema que este seleccionado en ese momento para restaurarlo si es necesario

  ThemeBloc()
      : super(ThemeState(
            currentTheme:
                AppTheme(selectedColor: 0, isDarkmode: false, sizeText: 18))) {
    _originalTheme =
        state.currentTheme; // Almacena el tema actual como seleccionado
    on<ThemeSelected>(_onThemeSelected);
    on<ApplyTheme>(_onApplyTheme);
    on<CancelTheme>(_onCancelTheme);
  }

  void _onThemeSelected(ThemeSelected event, Emitter<ThemeState> emit) {
    // Aplicamos el tema temporalmente sin hacerlo permanente
    final temporalyTheme = AppTheme(
        selectedColor: event.selectedColor,
        isDarkmode: event.isDarkMode,
        sizeText: event.sizeText);
    emit(ThemeState(
      currentTheme: temporalyTheme, // Aplicamos temporalmente el tema
      temporalTheme: temporalyTheme,
    ));
  }

  void _onApplyTheme(ApplyTheme event, Emitter<ThemeState> emit) {
    // Hace que el tema temporal sea definitivo y guarda los datos del tema temporal como el tema seleccionado
    if (state.temporalTheme != null) {
      _originalTheme = state.temporalTheme!;
      emit(ThemeState(currentTheme: state.temporalTheme!));
    } else {
      emit(ThemeState(currentTheme: _originalTheme));
    }
  }

  void _onCancelTheme(CancelTheme event, Emitter<ThemeState> emit) {
    // Restaura el tema que estaba aplicado
    emit(ThemeState(
        currentTheme: _originalTheme)); // Volvemos al tema que ya seleccionado
  }
}
