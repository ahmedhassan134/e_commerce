
import 'package:ecommerce/providers/auth_provider.dart';
import 'package:ecommerce/providers/product_provider.dart';
import 'package:ecommerce/view/screens/auth_screens/forget_password.dart';
import 'package:ecommerce/view/screens/main_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>AuthProvider()),
        ChangeNotifierProvider(create: (context)=>productProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            centerTitle: true
          )
        ),

        home: const MainScreen(),
        routes: {
          ForgetPassword.id:(context)=>ForgetPassword()
        },
      ),
    );
  }
}
