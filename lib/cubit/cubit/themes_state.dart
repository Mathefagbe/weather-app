// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'themes_cubit.dart';

class ThemesState extends Equatable {
  const ThemesState({
    required this.switchtheme,
  });
  final bool switchtheme;

  @override
  List<Object> get props => [switchtheme];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'switchtheme': switchtheme,
    };
  }

  factory ThemesState.fromMap(Map<String, dynamic> map) {
    return ThemesState(
      switchtheme: map['switchtheme'] as bool,
    );
  }
}

class ThemesInitial extends ThemesState {
  const ThemesInitial({required bool switchtheme})
      : super(switchtheme: switchtheme);
}

class DarkThemes extends ThemesState {
  const DarkThemes({required bool switchtheme})
      : super(switchtheme: switchtheme);
}

class LightThemes extends ThemesState {
  const LightThemes({required bool switchtheme})
      : super(switchtheme: switchtheme);
}
