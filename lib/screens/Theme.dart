import 'package:flutter/material.dart';
import 'package:flutter_ui/components/SpaceItemsList.dart';
// Include the Google Fonts package to provide more text format options
// https://pub.dev/packages/google_fonts
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const Themer());
}

class Themer extends StatelessWidget {
  const Themer({super.key});

  @override
  Widget build(BuildContext context) {
    const appName = 'Custom Themes';

    return MaterialApp(
      title: appName,
      theme: ThemeData(
        useMaterial3: true,
        unselectedWidgetColor: Colors.red,
        textSelectionTheme: TextSelectionThemeData(
            selectionColor: Colors.black, cursorColor: Colors.yellow),

        // Define the default brightness and colors.
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
          // TRY THIS: Change to "Brightness.light"
          //           and see that all colors change
          //           to better contrast a light background.
          brightness: Brightness.dark,
        ),

        // Define the default `TextTheme`. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
          displayLarge: const TextStyle(
            fontSize: 72,
            fontWeight: FontWeight.bold,
          ),
          // TRY THIS: Change one of the GoogleFonts
          //           to "lato", "poppins", or "lora".
          //           The title uses "titleLarge"
          //           and the middle text uses "bodyMedium".
          titleLarge: GoogleFonts.alkalami(
            fontSize: 30,
            fontStyle: FontStyle.italic,
          ),
          bodyMedium: GoogleFonts.merriweather(),
          displaySmall: GoogleFonts.pacifico(),
        ),
      ),
      home: const MyHomePage(
        title: appName,
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onTertiary,
                )),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      body: SpacedItemsList(items: 120),
    );
  }
}
