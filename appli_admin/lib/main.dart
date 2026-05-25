import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const FlexFoodAdminApp());
}

class FlexFoodAdminApp extends StatefulWidget {
  const FlexFoodAdminApp({super.key});
  @override
  State<FlexFoodAdminApp> createState() => _FlexFoodAdminAppState();
}

class _FlexFoodAdminAppState extends State<FlexFoodAdminApp> {
  bool _loggedIn = false;
  void _onLogin() => setState(() => _loggedIn = true);
  void _onLogout() => setState(() => _loggedIn = false);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlexFood Admin',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1B5E20)),
      ),
      home: _loggedIn
          ? HomeScreen(onLogout: _onLogout)
          : LoginScreen(onLogin: _onLogin),
    );
  }
}
