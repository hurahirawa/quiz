import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeProvider with ChangeNotifier {
  // List of themes
  List<ThemeData> themes = [
    ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.white,
    ),
    ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.teal,
      scaffoldBackgroundColor: Colors.black,
    ),
    ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.orange,
      scaffoldBackgroundColor: Colors.yellow[100],
    ),
  ];

  // Current theme index
  int _currentThemeIndex = 0;

  ThemeData get currentTheme => themes[_currentThemeIndex];

  void updateTheme(int index) {
    _currentThemeIndex = index;
    notifyListeners();
  }

  // List of font styles
  List<TextStyle> fonts = [
    GoogleFonts.roboto(),
    GoogleFonts.lobster(),
    GoogleFonts.montserrat(),
  ];

  // List of font names for display purposes
  List<String> fontNames = ['Roboto', 'Lobster', 'Montserrat'];

  // Current font index
  int _currentFontIndex = 0;

  TextStyle get currentFont => fonts[_currentFontIndex];

  void updateFont(int index) {
    _currentFontIndex = index;
    notifyListeners();
  }
}