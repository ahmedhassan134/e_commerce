import 'package:ecommerce/view/screens/auth_screens/forget_password.dart';
import 'package:ecommerce/view/screens/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/auth_provider.dart';
import '../../../service/responsive.dart';
import '../../../utils/constants.dart';
import '../../widgets/auth_widget/auth_Text_form_field.dart';
class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final formkey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log In'),
        centerTitle: true,
      ),
      body: Form(
        key: formkey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: SizeConfig.defaultSize! * 7,
              ),
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsetsDirectional.only( start:20,top: 20),
                    child: Text(
                      'Log In',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: mainColor),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: SizeConfig.defaultSize! * 2,
              ),


              AuthTextForm(
                  controller: emailController,
                  obsecure: false,
                  keyBoard: TextInputType.emailAddress,
                  hintText: 'E-mail',
                  prefixIcon: Image.asset('assets/images/email.png'),
                  suffixIcon: const Text(''),
                  validator: () {}),
              SizedBox(
                height: SizeConfig.defaultSize! * 2,
              ),
              AuthTextForm(
                  controller: passwordController,
                  obsecure: Provider.of<AuthProvider>(context).isVisible?false:true,
                  keyBoard: TextInputType.visiblePassword,
                  hintText: 'passWord',
                  prefixIcon: Image.asset('assets/images/lock.png'),
                  suffixIcon: IconButton(onPressed: (){
                    Provider.of<AuthProvider>(context,listen: false).visibilty();

                  }, icon:Provider.of<AuthProvider>(context).isVisible? const Icon(Icons.visibility_off):const Icon(Icons.visibility)),
                  validator: () {

                  }),
              SizedBox(
                height: SizeConfig.defaultSize! * 2,
              ),
          Align(
           alignment: Alignment.topRight,
           child: TextButton(
             onPressed: (){
               Navigator.pushNamed(context, ForgetPassword.id);
             },
             child: const Text('forget password ?',style: TextStyle(fontSize: 20),),
           ),

         ),

              Container(
                width: double.infinity,
                height: 50,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: ElevatedButton(onPressed: ()async {
                  if (formkey.currentState!.validate()) {
                    try{
                       await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: emailController.text.trim(),
                          password: passwordController.text
                      );
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return const MainScreen();
                          },
                        ),
                      );
                    }on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {

                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('No user found for that email.')));
                      } else if (e.code == 'wrong-password') {

                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Wrong password provided for that user.')));
                      }
                    }


                  } else {
                    print('must no');
                  }

                },
                    style: ElevatedButton.styleFrom(
                      primary: mainColor,
                      shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(8)

                      ),

                    ),
                    child: const Text('Log in',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),
              ),
              SizedBox(
                height: SizeConfig.defaultSize! * 21,
              ),
              Container(
                width: double.infinity,
                height: SizeConfig.defaultSize! * 10.5,
                decoration: const BoxDecoration(
                    color: mainColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8),
                      topLeft: Radius.circular(8),
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don\'t have account? ',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'SignIn',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
