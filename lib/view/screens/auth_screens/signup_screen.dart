import 'package:ecommerce/providers/auth_provider.dart';
import 'package:ecommerce/service/responsive.dart';
import 'package:ecommerce/view/screens/auth_screens/login_screen.dart';
import 'package:ecommerce/view/widgets/auth_widget/auth_Text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/constants.dart';
import '../main_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool isVisible = false;
  var  formkey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sign In'),
          centerTitle: true,
        ),
        body: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: SizeConfig.defaultSize! * 7,
                ),
                const Padding(
                  padding: EdgeInsetsDirectional.only(start: 20, top: 20),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: mainColor),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.defaultSize! * 2,
                ),
                AuthTextForm(
                    controller: nameController,
                    obsecure: false,
                    keyBoard: TextInputType.text,
                    hintText: 'userName',
                    prefixIcon: Image.asset('assets/images/user.png'),
                    suffixIcon: const Text(''),
                    validator: () {}),
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
                    obsecure: Provider.of<AuthProvider>(context).isVisible
                        ? false
                        : true,
                    keyBoard: TextInputType.visiblePassword,
                    hintText: 'passWord',
                    prefixIcon: Image.asset('assets/images/lock.png'),
                    suffixIcon: IconButton(
                        onPressed: () {
                          Provider.of<AuthProvider>(context, listen: false)
                              .visibilty();
                        },
                        icon: Provider.of<AuthProvider>(context).isVisible
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility)),
                    validator: () {}),
                SizedBox(
                  height: SizeConfig.defaultSize! * 2,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Provider.of<AuthProvider>(context, listen: false)
                            .checkBox();
                      },
                      child: Container(
                        margin: const EdgeInsetsDirectional.only(start: 10),
                        width: SizeConfig.defaultSize! * 5,
                        height: SizeConfig.defaultSize! * 5,
                        child: Provider.of<AuthProvider>(context).isCheckBox
                            ? Image.asset('assets/images/check.png')
                            : Container(),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade400,
                            borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                    const Text(
                      '  I accept terms and conditions',
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
                SizedBox(
                  height: SizeConfig.defaultSize! * .5,
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: ElevatedButton(onPressed: () async {
                    if (formkey.currentState!.validate()) {
                      try{

                       await FirebaseAuth.instance.createUserWithEmailAndPassword(
                            email: emailController.text.trim(),
                            password: passwordController.text
                        );
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Success',style: TextStyle(fontSize: 20),)));
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return const MainScreen();
                            },
                          ),
                        );
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('This a Weak password')));
                        } else if (e.code == 'email-already-in-use') {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('The account already exists.')));

                        }
                      } catch (e) {
                        print(e);
                      }


                    } else {
                      print('must be noo empty');
                    }


















                  },
                      style: ElevatedButton.styleFrom(
                        primary: mainColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)

                        ),

                      ),
                      child: const Text('Sign in',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),
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
                        'Already have account? ',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),

                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return LoginScreen();
                                },
                              ),
                            );
                          },
                          child: const Text(
                            'LogIn',
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
      ),
    );
  }
}
