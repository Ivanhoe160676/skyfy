import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skyfy/src/domain/repositories/preferences_repository.dart';
import 'package:skyfy/src/ui/utils/colors.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeController extends SimpleNotifier {
  late ThemeMode _mode;

  ThemeController() {
    _mode = _preferences.isDarkMode ? ThemeMode.dark : ThemeMode.light;
  }

  final PreferencesRepository _preferences = Get.find();

  ThemeMode get mode => _mode;
  bool get isDark => _mode == ThemeMode.dark;

  TextTheme get _textTheme {
    return GoogleFonts.nunitoSansTextTheme();
  }

  ThemeData get lightTheme {
    return ThemeData.light().copyWith(
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
          color: primaryLightColor,
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      textTheme: _textTheme,
      primaryColorLight: primaryLightColor,
      colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.light,
        primarySwatch: MaterialColor(primaryLightColor.value, swatch),
      ),
      inputDecorationTheme: InputDecorationTheme(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: primaryLightColor.withOpacity(0.5),
          ),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black12,
          ),
        ),
      ),
    );
  }

  ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryDarkColor,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      textTheme: _textTheme
          .merge(
            ThemeData.dark().textTheme,
          )
          .apply(
            fontFamily: _textTheme.bodyLarge!.fontFamily,
          ),
      scaffoldBackgroundColor: const Color(0xff102027),
      primaryColorDark: primaryDarkColor,
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: primaryDarkColor,
      ),
      colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.dark,
        primarySwatch: MaterialColor(primaryDarkColor.value, swatch),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: primaryDarkColor,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white54,
          ),
        ),
      ),
    );
  }

  void toggle() {
    if (_mode == ThemeMode.light) {
      _mode = ThemeMode.dark;
      _preferences.darkMode(true);
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.light,
      );
    } else {
      _mode = ThemeMode.light;
      _preferences.darkMode(false);
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark,
      );
    }
    notify();
  }
}

final themeProvider = SimpleProvider(
  (_) => ThemeController(),
  autoDispose: false,
);
