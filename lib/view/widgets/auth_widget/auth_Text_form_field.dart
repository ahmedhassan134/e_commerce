import 'package:flutter/material.dart';

class AuthTextForm extends StatelessWidget {
  const AuthTextForm(
      {required this.controller,
      required this.obsecure,
      required this.keyBoard,
        required this.hintText,
        required this.prefixIcon,
        required this.suffixIcon,
        required this.validator
      });

  final TextEditingController controller;
  final bool obsecure;
  final TextInputType keyBoard;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final String hintText;
  final Function validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        controller: controller,
        obscureText: obsecure,
        cursorColor: Colors.black,
        keyboardType: keyBoard,
        validator:( value) {
          if(value!.isEmpty){
            return 'must be not empty';

          }
          else{
            return null;
          }
        },
        decoration: InputDecoration(
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            labelText: hintText,
           labelStyle: const TextStyle(color: Colors.black, fontSize: 20),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(8)
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.circular(8)
          ),
          fillColor: Colors.grey.withOpacity(.3),
            filled: true
        ),


      ),
    );
  }
}
