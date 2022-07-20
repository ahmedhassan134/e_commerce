import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/utils/constants.dart';
import 'package:ecommerce/view/screens/cart_screen.dart';
import 'package:ecommerce/view/widgets/product_details/color_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailsWidget extends StatefulWidget {
  final String img;

  ProductDetailsWidget({Key? key, required this.img}) : super(key: key);

  @override
  _ProductDetailsWidgetState createState() => _ProductDetailsWidgetState();
}

class _ProductDetailsWidgetState extends State<ProductDetailsWidget> {
  CarouselController controller = CarouselController();
  int currentPage = 0;
   List<Color>colorList=[
     Colors.white,
    mainColor,
    darkGreyClr,
    pinkClr,
    kCOlor1,
    kCOlor2,
    kCOlor3,
    kCOlor4

  ];
int selectClr=0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          carouselController: controller,
          itemCount: 3,
          options: CarouselOptions(
              onPageChanged: (index, reason) {
                setState(() {
                  currentPage = index;
                });
              },
              height: 400,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              enableInfiniteScroll: false,
              enlargeCenterPage: true,
              viewportFraction: 1),
          itemBuilder: (context, index, i) {
            return Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                        widget.img,
                      ))),
            );
          },
        ),
        Positioned(
          left: 180,
          bottom: 30,
          child: AnimatedSmoothIndicator(
            count: 3,
            activeIndex: currentPage,
            effect: const ExpandingDotsEffect(
                dotHeight: 10,
                dotWidth: 10,
                activeDotColor: mainColor,
                dotColor: Colors.black),
          ),
        ),
        Positioned(
          bottom: 30,
          right: 30,
          child: Container(
            height: 200,
            width: 50,
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(.3), borderRadius: BorderRadius.circular(25)),
            child: ListView.separated(
              itemBuilder: (context,index){
                return GestureDetector(
                  onTap: (){
                    setState(() {
                      selectClr=index;
                    });
                  },
                  child: ColorPicker(
                    clr: colorList[index],
                    outerBorder: selectClr==index,
                  ),
                );
              },
              separatorBuilder: (context,index)=>const SizedBox(height: 3,),
              itemCount: colorList.length,
            ),
          ),
        ),
        Container(

          padding: const EdgeInsets.only(top: 20,left: 25,right: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  width: 60,
                  height: 40,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: mainColor,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Icon(Icons.arrow_back_ios,color: Colors.white,),
                  ),
                ),

              ),
              InkWell(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                        return CartScreen();
                      }));
                },
                child: Container(
                  width: 60,
                  height: 40,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: mainColor,
                  ),
                  child: const Icon(Icons.shopping_cart,color: Colors.white,),
                ),

              ),
            ],
          ),
        ),


        
      ],
    );
  }
}
