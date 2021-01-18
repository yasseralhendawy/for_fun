
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:for_fun/controllers/homePageController.dart';

class NavigationAnimationController extends ChangeNotifier{
  AppController _controller;
  AnimationController translateIcon;
  AnimationController scaleNavigation;
  bool fadeToNavigation;

  NavigationAnimationController(AnimationController icon,AnimationController nav,AppController controller){
    _controller=controller;
    translateIcon= icon;
    scaleNavigation= nav;
    fadeToNavigation=false;
  }

  void openOrCloseNavigation(){
    if(translateIcon.isCompleted&&scaleNavigation.isCompleted&&_controller.status==NavigationStatus.Open){
      closeNavigation();
      _controller.closeNav();
    }
    if(!translateIcon.isCompleted&&!scaleNavigation.isCompleted&&_controller.status==NavigationStatus.Close){
      openNavigation();
      _controller.openNav();
    }
  }

  void openNavigation(){
    _iconOpen();
    if(!translateIcon.isCompleted){
      Timer(translateIcon.reverseDuration, (){
        _navigationScaleUp();
        _fadeForNavigation();
      });
    }
  }

  void closeNavigation(){
    _navigationScaleDown();
    if(!scaleNavigation.isCompleted){
      Timer(scaleNavigation.reverseDuration, (){
        _iconClose();
        _fadeForLogo();
      });

    }
  }

  void _iconOpen(){
    translateIcon.forward();
    notifyListeners();
  }

  void _iconClose(){
    translateIcon.reverse();
    notifyListeners();
  }

  void _navigationScaleUp(){
    scaleNavigation.forward();
    notifyListeners();
  }

  void _navigationScaleDown(){
    scaleNavigation.reverse();
    notifyListeners();
  }

  void _fadeForLogo(){
    fadeToNavigation=false;
    notifyListeners();
  }

  void _fadeForNavigation(){
    fadeToNavigation=true;
    notifyListeners();
  }
}
