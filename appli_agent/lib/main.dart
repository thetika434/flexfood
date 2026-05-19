import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'theme.dart';
import 'app_state.dart';
import 'login_screen.dart';
import 'home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
  ));

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  final appState = AppState();
  await appState.restaurerSession();

  runApp(
    ChangeNotifierProvider.value(
      value: appState,
      child: const FlexFoodApp(),
    ),
  );
}

class FlexFoodApp extends StatelessWidget {
  const FlexFoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlexFood Agent',
      theme: AppTheme.theme,
      debugShowCheckedModeBanner: false,
      home: Consumer<AppState>(
        builder: (_, state, __) =>
            state.loggedIn ? const HomeScreen() : const LoginScreen(),
      ),
    );
  }
}
