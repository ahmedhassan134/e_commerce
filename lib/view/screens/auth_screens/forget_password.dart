import 'package:ecommerce/service/responsive.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import '../../../utils/constants.dart';
import '../../widgets/auth_widget/auth_Text_form_field.dart';
class ForgetPassword extends StatelessWidget {
static const String id='forget';
TextEditingController emailController = TextEditingController();

  ForgetPassword({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Forget password'),
          centerTitle: true,
        ),
        body: Form(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child: Column(
                children: [
                   Align(
                    alignment: Alignment.topRight,
                    child: CircleAvatar(
                      radius: 25,
                      child: Center(
                        child: IconButton
                          (
                          onPressed:(){
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.close_rounded,color: Colors.black,size: 30,),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height:SizeConfig.defaultSize! * 4 ,),
                  const Text('if you want to recover your account, then please provide your email id below',
                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  SizedBox(height:SizeConfig.defaultSize! * 2 ,),
                  Image.asset('assets/images/forgetpass copy.png'),

                  AuthTextForm(
                      controller: emailController,
                      obsecure: false,
                      keyBoard: TextInputType.emailAddress,
                      hintText: 'E-mail',
                      prefixIcon: Image.asset('assets/images/email.png'),
                      suffixIcon: const Text(''),
                      validator: () {}),
                  SizedBox(height:SizeConfig.defaultSize! * 6,),
                  Container(
                    width: double.infinity,
                    height: 50,
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    child: ElevatedButton(onPressed: ()async{
                      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text.trim());
                      Navigator.pop(context);


                    },
                        style: ElevatedButton.styleFrom(
                          primary:notiSettings ,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)

                          ),

                        ),
                        child: const Text('Send',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

    );
  }
}
