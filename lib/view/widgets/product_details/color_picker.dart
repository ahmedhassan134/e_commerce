import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ColorPicker extends StatelessWidget {
  const ColorPicker({Key? key,required this.clr,required this.outerBorder}) : super(key: key);
  final bool outerBorder;
  final Color clr;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: outerBorder?Border.all(color:clr,width: 2 ):null,
      ),
      child:  Container(
        width: 30,
        height: 30,
        padding: const EdgeInsets.all(3),
        decoration:  BoxDecoration(
          color: clr,
          shape: BoxShape.circle,


        ),
      ),
    );
  }
}
