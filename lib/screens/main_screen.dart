import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme_provider.dart';
import 'settings_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Screen'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
              if (value.startsWith('Theme')) {
                int themeIndex = int.parse(value.split(' ')[1]) - 1;
                themeProvider.updateTheme(themeIndex);
              } else if (value.startsWith('Font')) {
                int fontIndex = int.parse(value.split(' ')[1]) - 1;
                themeProvider.updateFont(fontIndex);
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'Theme 1',
                child: Text('Theme 1'),
              ),
              const PopupMenuItem(
                value: 'Theme 2',
                child: Text('Theme 2'),
              ),
              const PopupMenuItem(
                value: 'Theme 3',
                child: Text('Theme 3'),
              ),
              const PopupMenuDivider(),
              const PopupMenuItem(
                value: 'Font 1',
                child: Text('Font 1'),
              ),
              const PopupMenuItem(
                value: 'Font 2',
                child: Text('Font 2'),
              ),
              const PopupMenuItem(
                value: 'Font 3',
                child: Text('Font 3'),
              ),
            ],
          ),
        ],
      ),
      body: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Hello, World!',
                  style: themeProvider.currentFont.copyWith(fontSize: 24),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SettingsScreen()),
                    );
                  },
                  child: const Text('Settings'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
