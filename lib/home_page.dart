import 'package:ecommerce/service/responsive.dart';
import 'package:ecommerce/utils/constants.dart';
import 'package:ecommerce/view/screens/auth_screens/login_screen.dart';
import 'package:ecommerce/view/screens/auth_screens/signup_screen.dart';
import 'package:flutter/material.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
   
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset('assets/images/background.png'
              ,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.black26,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: SizeConfig.defaultSize! *20,
                    height: SizeConfig.defaultSize! *6,
             
                    decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.circular(16)
                      
                    ),
                    child: const Center(child: Text('Welcome ',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),)),
                  ),
                  SizedBox(height: SizeConfig.defaultSize! * 5,),
                  Container(
                    width: SizeConfig.defaultSize! *20,
                    height: SizeConfig.defaultSize! *6,

                    decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.circular(16)

                    ),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                    Text('Asroo ',style: TextStyle(color:Colors.red,fontSize: 25,fontWeight: FontWeight.bold),),
                        Text('Shop ',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),


                      ],
                    ) ),
                  SizedBox(height: SizeConfig.defaultSize! * 5,),
                  ElevatedButton(  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return LoginScreen();
                        },
                      ),
                    );
                  },
                      style: ElevatedButton.styleFrom(
                        primary:mainColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)
                        )
                      ),

                      child: const Text('Get Started',style: TextStyle(fontSize: 20),)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Expanded(
                        child: Text
                          ('Don\'t have any account? ',style: TextStyle(fontSize: 25,color: Colors.white),),
                      ),
                      Expanded(
                        child: TextButton( onPressed: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (BuildContext context) {
                                return const SignUp();
                              }));
                        }, child:const Text('Sign up',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w900,),)),
                      )
                    ],
                  )

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
