import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bmi/app.dart';
import 'package:get/get.dart';

import 'app/locale/translations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: AppStarter()));
}

class AppStarter extends StatelessWidget {
  const AppStarter({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ghekko BMI',
      translations: Languages(),
      locale: const Locale('en', 'GB'),
      fallbackLocale: const Locale('nl', 'NL'),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      home: const BMIApp(title: 'Ghekko BMI'),
    );
  }
}
