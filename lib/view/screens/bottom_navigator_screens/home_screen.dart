import 'package:ecommerce/service/responsive.dart';
import 'package:ecommerce/utils/constants.dart';
import 'package:flutter/material.dart';

import '../../widgets/cart_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor,
          title:  const Text('Home Screen'),
          actions: [
            IconButton(
                onPressed: null, icon: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              
            
                child: Image.asset('assets/images/shop.png')))
          ],
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsetsDirectional.only(start: 10, top: 20,end: 10),
              width: double.infinity,
              height: SizeConfig.defaultSize! * 20,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                  color: mainColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Find your ',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  SizedBox(
                    height: SizeConfig.defaultSize! * 1,
                  ),
                  const Text(
                    'INSPIRITION',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  TextFormField(
                    cursorColor: Colors.black,

                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Search you\'are looking for',
                      hintStyle: const TextStyle(
                        fontSize: 20,
                      ),
                      prefixIcon: const Icon(Icons.search),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(16)
                      ),
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(16)
                      ),
                      errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(16)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(16)
                      ),
                    ),
                    keyboardType: TextInputType.text,

                  )
                ],
              ),
            ),
            const CartItem(),
          ],
        ),
      ),
    );
  }
}
