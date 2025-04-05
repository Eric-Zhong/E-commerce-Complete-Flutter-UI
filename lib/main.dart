import 'package:dragonai/constants.dart';
import 'package:dragonai/providers/auth_provider.dart';
import 'package:dragonai/route/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dragonai/route/router.dart' as router;
import 'package:dragonai/theme/app_theme.dart';

void main() {
  // 根据启动时的命令行参数，配置 web api 的访问路径
  const defDevelopEnv = String.fromEnvironment('DEF_DEVELOP_ENV', defaultValue: 'MACBOOK');
  switch (defDevelopEnv) {
    case 'MACBOOK':
      apiUrl = 'http://localhost:8080/dragonfly-boot';
      webSocketUrl = 'ws://localhost:8080/dragonfly-boot';
      break;
    case 'WINDOWS':
      apiUrl = 'http://10.0.2.2:8080/dragonfly-boot';
      webSocketUrl = 'ws://10.0.2.2:8080/dragonfly-boot';
      break;
    case 'HUAWEI':
      apiUrl = 'http://192.168.2.25:8080/dragonfly-boot';
      webSocketUrl = 'ws://192.168.2.25:8080/dragonfly-boot';
      break;
    case 'PROD':
      apiUrl = 'http://8.140.48.78/dragonfly-boot';
      webSocketUrl = 'ws://8.140.48.78/dragonfly-boot';
      break;
    default:
      apiUrl = 'http://192.168.2.25:8080/dragonfly-boot';
      webSocketUrl = 'ws://192.168.2.25:8080/dragonfly-boot';
      break;
  }

  runApp(MultiProvider(
    // KB: Provider 的注册方式, 全局状态 - 在 main.dart 中注册
    providers: [
      // Issue: 测试发现，这里不能赋 []，必须有值，否则会报错
      ChangeNotifierProvider(create: (_) => AuthProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '御龙智绘',
      theme: AppTheme.lightTheme(context),
      // Dark theme is inclided in the Full template
      themeMode: ThemeMode.light,
      onGenerateRoute: router.generateRoute,
      initialRoute: onbordingScreenRoute,
    );
  }
}
