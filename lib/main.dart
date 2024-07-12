import 'package:flutter/material.dart';
import 'package:app_api/app/page/auth/login.dart';

import 'package:dio/dio.dart';
import 'dart:io';

void main() {
  HttpOverrides.global = MyHttpOverrides();

  // Tiếp tục với các API calls như bình thường
  // Ví dụ:
  final dio = Dio();
  dio
      .get('https://your-api-endpoint.com')
      .then((response) => print(response.data))
      .catchError((error) => print(error));
  runApp(const MainApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      // initialRoute: "/",
      // onGenerateRoute: AppRoute.onGenerateRoute,  -> su dung auto route (pushName)
    );
  }
}
