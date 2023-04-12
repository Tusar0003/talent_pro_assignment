import 'package:flutter/material.dart';
import 'package:prefs/prefs.dart';
import 'package:talent_pro_assignment/utils/app_route.dart';
import 'package:talent_pro_assignment/utils/color_helper.dart';
import 'package:talent_pro_assignment/view/signin/sign_in_page.dart';
import 'package:talent_pro_assignment/view/signup/sign_up_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: ColorHelper.primaryColor,
          elevation: 0,
        ),
        scaffoldBackgroundColor: Colors.white
      ),
      initialRoute: AppRoute.signIn,
      routes: {
        AppRoute.signIn: (context) => const SignInPage(),
        AppRoute.signUp: (context) => const SignUpPage(),
        // AppRoute.home: (context) => const HomePage(),
      }
    );
  }
}
