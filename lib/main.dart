import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_app/src/core/config/routes.dart';
import 'package:news_app/src/core/constants_utils.dart';
import 'package:news_app/src/theme/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
   await dotenv.load(fileName: "assets/env/secure_data.env");
  runApp(
    ProviderScope(   
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppConfigurations.AppTitle,
      theme: AppTheme.lightTheme,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}