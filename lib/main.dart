import 'package:device_preview_plus/device_preview_plus.dart';
import 'package:flutter/material.dart';
import 'package:my_mentor/app.dart';
import 'package:my_mentor/controllers/login_controller.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(DevicePreview(
    enabled: true,
    builder: (context) => MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginController()),
      ],
      child: MyApp(),
    ),
    ));
}

