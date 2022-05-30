

import 'package:ecommerce/providers/auth_provider.dart';
import 'package:ecommerce/providers/cart_provider.dart';
import 'package:ecommerce/providers/product_provider.dart';

import 'package:ecommerce/view/screens/auth_screens/forget_password.dart';

import 'package:ecommerce/view/screens/bottom_navigator_screens/home_screen.dart';
import 'package:ecommerce/view/screens/cart_screen.dart';
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
    //SizeConfig().init(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>AuthProvider()),
        ChangeNotifierProvider(create: (context)=>ProductProvider()),
        ChangeNotifierProvider(create: (context)=>CartProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            centerTitle: true
          )
        ),

         home:  HomeScreen(),

        routes: {
          CartScreen.id:(context)=>CartScreen(),
          MainScreen.id:(context)=>MainScreen(),
          ForgetPassword.id:(context)=>ForgetPassword()
        },
      ),
    );
  }
}
