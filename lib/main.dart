import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:notepad/views/main_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Global System UI Settings (Status Bar + Navigation Bar)
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Transparent to blend with UI
      statusBarIconBrightness: Brightness.light, // White icons
      statusBarBrightness: Brightness.dark, // iOS support
      systemNavigationBarColor: Colors.black, // Navigation bar background
      systemNavigationBarIconBrightness:
          Brightness.light, // Navigation icons white
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        brightness: Brightness.dark, 
        scaffoldBackgroundColor: Colors.black, 
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.dark,
          ),
        ),
      ),

      home: MainScreen(),
    );
  }
}
