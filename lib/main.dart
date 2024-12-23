import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_app/screens/tabs_screen.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: Colors.black, // Set seedColor to black to influence color scheme
  ),
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: const AppBarTheme(
    backgroundColor:
        Color.fromARGB(255, 20, 20, 20), // Set the app bar color to black
    // titleTextStyle: GoogleFonts.latoTextTheme().headline6?.copyWith(color: Colors.white),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor:
        Color.fromARGB(255, 20, 20, 20), // Set BottomNavigationBar to black
    selectedItemColor: Colors.white, // Color of the selected item
    unselectedItemColor: Colors.grey, // Color of unselected items
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme,
      home: const TabsScreen(),
    );
  }
}
