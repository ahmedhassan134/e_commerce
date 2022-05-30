import 'package:flutter/material.dart';

import '../../../service/responsive.dart';
import '../../../utils/constants.dart';
import '../../screens/main_screen.dart';
class EmptyCart extends StatelessWidget {
  const EmptyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.shopping_cart,
            size: SizeConfig.defaultSize! *25,
            color: mainColor,
          ),
          SizedBox(height:SizeConfig.defaultSize! *2 ,),
          RichText(text: TextSpan(
              children: [
                TextSpan(
                  text: 'Your cart is ',
                  style: TextStyle(color: Colors.black,fontSize: SizeConfig.defaultSize! *2 ,),
                ),
                TextSpan(
                    style: TextStyle(color: mainColor,fontSize: SizeConfig.defaultSize! *2 ,),
                    text: 'empty '

                )
              ]
          )),
          Text('Add item to get started'),
          SizedBox(height:SizeConfig.defaultSize! *2  ,),
          ElevatedButton(onPressed: (){
            Navigator.pushNamed(context, MainScreen.id);
          },
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                primary: mainColor
            ),

            child: Text('go to home'),)

        ],
      ),
    ) ;
  }
}
