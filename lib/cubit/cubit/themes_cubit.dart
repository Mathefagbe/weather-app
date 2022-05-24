import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'themes_state.dart';

class ThemesCubit extends Cubit<ThemesState> with HydratedMixin {
  ThemesCubit() : super(const ThemesInitial(switchtheme: false));

  void dark() {
    emit(const DarkThemes(switchtheme: false));
  }

  void light() {
    emit(const LightThemes(switchtheme: true));
  }

  @override
  ThemesState? fromJson(Map<String, dynamic> json) {
    return ThemesState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(ThemesState state) {
    return state.toMap();
  }
}
