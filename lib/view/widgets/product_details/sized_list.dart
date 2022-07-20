import 'package:ecommerce/utils/constants.dart';
import 'package:flutter/material.dart';

class SizedList extends StatefulWidget {
  const SizedList({Key? key}) : super(key: key);

  @override
  _SizedListState createState() => _SizedListState();
}

class _SizedListState extends State<SizedList> {
  final List<String> sizedList = ['S', 'M', 'L', 'XL', 'XXL'];
  int currentSize = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(
          width: 12,
        ),
        itemCount: sizedList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                currentSize = index;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: currentSize == index ? mainColor : Colors.white),
              child: Text(
                sizedList[index],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
