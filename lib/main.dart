import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:jm_mock_bank/presentation/core/start_app/start_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'jm mock bank',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.purple,
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
              backgroundColor: Color.fromARGB(255, 24, 24, 24))),
      darkTheme: ThemeData.dark(useMaterial3: true).copyWith(
        switchTheme: SwitchThemeData(
          thumbColor:
              MaterialStateProperty.all(const Color.fromARGB(255, 59, 2, 69)),
          trackColor: MaterialStateProperty.all(
              const Color.fromARGB(255, 229, 135, 244)),
        ),
        appBarTheme: const AppBarTheme(
            centerTitle: true,
            backgroundColor: Color.fromARGB(255, 64, 36, 78),
            shadowColor: Colors.black,
            elevation: 5),
        scaffoldBackgroundColor: const Color.fromARGB(255, 26, 21, 28),
      ),
      themeMode: ThemeMode.dark,
      home: const StartApp(),
    );
  }
}
