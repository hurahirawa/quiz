import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Choose Theme:'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(themeProvider.themes.length, (index) {
                    return ElevatedButton(
                      onPressed: () {
                        themeProvider.updateTheme(index);
                      },
                      child: Text('Theme ${index + 1}'),
                    );
                  }),
                ),
                const SizedBox(height: 20),
                const Text('Choose Font:'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(themeProvider.fonts.length, (index) {
                    return ElevatedButton(
                      onPressed: () {
                        themeProvider.updateFont(index);
                      },
                      child: Text(themeProvider.fontNames[index]),
                    );
                  }),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}