import 'package:customers_service/ui/addRoom/add_room_screen.dart';
import 'package:customers_service/ui/chat/chat_thread.dart';
import 'package:customers_service/ui/home/home_screen.dart';
import 'package:customers_service/ui/login/login_screen.dart';
import 'package:customers_service/ui/register/register_screen.dart';
import 'package:customers_service/ui/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApplication());
}

class MyApplication extends StatelessWidget {
  const MyApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Customers Service',
      theme: ThemeData(primarySwatch: Colors.blue),
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        RegisterScreen.routeName: (context) => RegisterScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        AddRoomScreen.routeName: (context) => AddRoomScreen(),
        ChatThread.routeName: (context) => ChatThread(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}
