import 'package:flutter/material.dart';
import 'package:for_fun/pages/homePage/HomeLayout/HomePageLayout.dart';
import 'package:for_fun/pages/homePage/branchesLayout.dart';
import 'package:for_fun/pages/homePage/cartLayout.dart';
import 'package:for_fun/pages/homePage/chattingLayout.dart';
import 'package:for_fun/pages/homePage/pointsLayout.dart';
import 'package:for_fun/pages/homePage/profileLayout.dart';

class AppController extends ChangeNotifier{
  NavigationStatus status;
  PageName page;
  AppController({this.status:NavigationStatus.Close,this.page:PageName.HomePage});

  void openNav(){

    this.status=NavigationStatus.Open;
    notifyListeners();
  }

  void closeNav(){
    this.status=NavigationStatus.Close;
    notifyListeners();
  }

  void openLayout(PageName _page){
    page= _page;
    notifyListeners();

  }

  Widget getLayout(){
    switch (page) {
      case PageName.HomePage:
        return HomePageLayout();
        break;
      case PageName.Profile:
        return ProfileLayout();
        break;
      case PageName.Cart:
        return CartLayout();
        break;
      case PageName.Branches:
        return BranchesLayout();
        break;
      case PageName.Chatting:
        return ChattingLayout();
        break;
      case PageName.PointsClub:
        return PointsLayout();
        break;
      default:
        return HomePageLayout();
    }
  }

}

enum NavigationStatus{
  Open,
  Close,
}

enum PageName {
  HomePage,
  Profile,
  Cart,
  Branches,
  Chatting,
  PointsClub
}