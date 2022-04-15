import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier{

  bool isVisible=false;
  bool isCheckBox=false;
  void visibilty(){
    isVisible= ! isVisible;
    notifyListeners();
  }
  void checkBox(){
    isCheckBox= ! isCheckBox;
    notifyListeners();
  }
  void registerWithFirebase()async{


  }
}