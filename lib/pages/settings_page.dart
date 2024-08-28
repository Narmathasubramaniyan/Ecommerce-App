import 'package:ecommerce/themes/light_mode.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce/themes/theme_provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        bool isSwitched =
            themeProvider.themedata == darkmode; // Check if dark mode is active

        return Scaffold(
          appBar: AppBar(
            title: const Text('Settings Page'),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          ),
          backgroundColor: Theme.of(context).colorScheme.surface,
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadiusDirectional.circular(12),
                boxShadow: [
                  BoxShadow(
                    // bottom right (+) shadow is darker
                    color: Theme.of(context).colorScheme.tertiary,
                    offset: const Offset(5, 5),
                    blurRadius: 15,
                  ),
                  BoxShadow(
                    // top left (-) shadow is lighter
                    color: Theme.of(context).colorScheme.secondary,
                    offset: const Offset(-4, -4),
                    blurRadius: 15,
                  ),
                ],
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 25.0,
                  vertical: 20.0,
                ), // Increase padding
                title: const Text('Dark Mode'),
                trailing: Switch(
                  activeTrackColor: const Color.fromARGB(214, 255, 255, 255),
                  value: isSwitched,
                  activeColor: Colors.green,
                  onChanged: (value) {
                    themeProvider
                        .toggleTheme(); // Toggle theme on switch change
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
