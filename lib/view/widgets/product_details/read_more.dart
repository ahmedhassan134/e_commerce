import 'package:ecommerce/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class ReadMore extends StatelessWidget {
  final String desc;

  const ReadMore({Key? key, required this.desc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: ReadMoreText(
        desc,
        trimLines: 2,
        colorClickableText: Colors.pink,
        trimMode: TrimMode.Line,
        trimCollapsedText: 'Show more',
        trimExpandedText: 'Show less',
        moreStyle: const TextStyle(
            fontSize: 14,  color: mainColor),
        lessStyle: const TextStyle(
            fontSize: 14, color: mainColor),
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.black,
          height: 1.5
        ),
      ),
    );
  }
}
