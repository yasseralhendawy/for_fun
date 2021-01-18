import 'package:flutter/material.dart';

class InitialController extends ChangeNotifier {
  AppPage _page;
  PageController _pageController;
  PageController _welcomeSliderController;

  PageController get welcomeSliderController => _welcomeSliderController;

  PageController get pageController => _pageController;

  AppPage get page => _page;


  InitialController() {
    this._page =AppPage.WelcomePage;
    this._pageController = new PageController(initialPage: 0);
    this._welcomeSliderController = new PageController();
  }

  InitialController.login() {
    this._page=AppPage.LoginPage;
    this._pageController = new PageController(initialPage: 1);
  }

  InitialController.home() {
    this._page=AppPage.HomePage;
    this._pageController = new PageController(initialPage: 2);
  }

  void onPageChange(AppPage appPage) {
    switch (appPage) {
      case AppPage.WelcomePage:
        _pageController.animateToPage(0,
            duration: Duration(milliseconds: 500), curve: Curves.ease);
        break;
      case AppPage.LoginPage:
        _pageController.animateToPage(1,
            duration: Duration(milliseconds: 500), curve: Curves.ease);
        break;
      case AppPage.HomePage:
        _pageController.animateToPage(2,
            duration: Duration(milliseconds: 500), curve: Curves.ease);
        break;
      default:
        _pageController.animateToPage(1,
            duration: Duration(milliseconds: 500), curve: Curves.ease);
    }
    _page= appPage;
    notifyListeners();

  }



  void onWelcomeSlide(){
    if (_welcomeSliderController.page == 2) {
      onPageChange(AppPage.LoginPage);
    }else{
      _welcomeSliderController.nextPage(
          duration: Duration(milliseconds: 100), curve: Curves.bounceIn);
      int p= _welcomeSliderController.page.toInt()+1;
    }

    /*if (_welcomeSliderController.page == 0) {
      _welcomeSliderController.animateToPage(1,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    }else{
      onPageChange(AppPage.LoginPage);
    }
     */
    notifyListeners();
  }

}

enum AppPage { WelcomePage, LoginPage, HomePage }
