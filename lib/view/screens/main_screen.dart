
import 'package:ecommerce/utils/constants.dart';
import 'package:flutter/material.dart';


import 'bottom_navigator_screens/category_screen.dart';
import 'bottom_navigator_screens/favourite_screen.dart';
import 'bottom_navigator_screens/home_screen.dart';
import 'bottom_navigator_screens/setting_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  static String id='mainscreene';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex=0;
  final List <dynamic> screens= [
     const HomeScreen(),
     const CategoryScreen(),
    const FavouriteScreen(),
    const SettingScreen(),


  ];
  List<String> titles=[
    'HomeScreen',
    'CategoryScreen',
    'FavouriteScreen',
    'SettingScreen'
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text(
        //     titles[currentIndex]
        //   ),
        // ),
        body: screens[currentIndex],
        // body: IndexedStack(
        //   index: Provider.of<MainProvider>(context).currentIndex,
        //   children: [Provider.of<MainProvider>(context).screens[Provider.of<MainProvider>(context).currentIndex]],
        // ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex:currentIndex,
            onTap: (index){
            setState(() {
              currentIndex=index;
            });
    },

            items:const [
            BottomNavigationBarItem(
            icon: Icon(
            Icons.home,
            color: mainColor,
            ),
            label: 'Home'),
            BottomNavigationBarItem(
            icon: Icon(
            Icons.category,
            color: mainColor,
            ),
            label: 'category',
            ),
            BottomNavigationBarItem(
            icon: Icon(
            Icons.favorite,
            color: mainColor,
            ),
            label: 'Favourite'),
            BottomNavigationBarItem(
            icon: Icon
          (
                  Icons.settings,
                  color: mainColor,
                ),
                label: 'Setting'),
          ],
          backgroundColor: Colors.deepPurple,

        ),
      ),
    );
  }
}
