import 'package:exam/views/homePage/HomePage.dart';
import 'package:exam/views/login_logout/login.dart';
import 'package:exam/views/login_logout/logout.dart';
import 'package:exam/provider/PlansModal.dart';
import 'package:exam/provider/CoffeeModal.dart';
import 'package:exam/provider/UserModal.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider<UserModal>(create: (context) => UserModal()),
      ChangeNotifierProvider<PlansModal>(create: (context) => PlansModal()),
      ChangeNotifierProvider<CoffeeModal>(create: (context) => CoffeeModal()),
    ],
      child:  const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final MaterialColor backgroundColor = const MaterialColor(
    0xFFD8D8C1,
    <int, Color>{
      50: Color(0xFFD8D8C1),
      100: Color(0xFFD8D8C1),
      200: Color(0xFFD8D8C1),
      300: Color(0xFFD8D8C1),
      400: Color(0xFFD8D8C1),
      500: Color(0xFFD8D8C1),
      600: Color(0xFFD8D8C1),
      700: Color(0xFFD8D8C1),
      800: Color(0xFFD8D8C1),
      900: Color(0xFFD8D8C1),
    },
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => const Login(),
        '/HomePage': (context) => const HomePage(),
        '/Logout': (context) => const Logout(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: backgroundColor,
        useMaterial3: true,
      ),
    );
  }
}
