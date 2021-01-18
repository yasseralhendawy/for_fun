import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:for_fun/controllers/characterNavigationController.dart';
import 'package:for_fun/controllers/homePageController.dart';
import 'package:for_fun/controllers/welcomePageController.dart';
import 'package:for_fun/values/clippers.dart';
import 'package:for_fun/values/colors.dart';
import 'package:provider/provider.dart';

class NavigationBar extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar>
    with TickerProviderStateMixin {
  AppController _controller;
  NavigationAnimationController _navigationAnimationController;
  AnimationController _iconAnimationController;
  AnimationController _scaleNavigationAnimation;

  @override
  void initState() {
    _iconAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
      reverseDuration: Duration(milliseconds: 500),
    );
    _scaleNavigationAnimation= AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
      reverseDuration: Duration(milliseconds: 400),
    );
    super.initState();
  }

  @override
  void dispose() {
    _iconAnimationController.dispose();
    _scaleNavigationAnimation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    _controller = Provider.of<AppController>(context);
    _navigationAnimationController = NavigationAnimationController(
        _iconAnimationController,
        _scaleNavigationAnimation,
        _controller);
    return ChangeNotifierProvider<NavigationAnimationController>(
      create: (_)=>_navigationAnimationController,
      child: Consumer<NavigationAnimationController>(
          builder: (_,snapshot,__){
        return Stack(
          alignment: Alignment.centerRight,
          children: <Widget>[
            Positioned(top: 0, right: 0, child: navIcon()),
            AnimatedCrossFade(
              duration: Duration(milliseconds: 100),
                firstChild: Container(),
                crossFadeState: snapshot.fadeToNavigation?CrossFadeState.showSecond:CrossFadeState.showFirst,
                secondChild: expandedNavigation())
          ],
        );
      }),
    );
  }

  Widget navIcon() {
    return IntrinsicWidth(
      child: Container(
        height: 150,
        alignment: Alignment.topRight,
        child: Container(
          width: MediaQuery.of(context).size.width * .3,
          alignment: Alignment.center,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: AppColors.PrimaryBackground),
          child: InkWell(
            onTap: () {
              _navigationAnimationController.openOrCloseNavigation();
            },
            child: Consumer<NavigationAnimationController>(
              builder: (_,snapshot,__){
                return Stack(
                  children: <Widget>[
                    Image(
                      image: AssetImage("assets/images/character.png"),
                      fit: BoxFit.fill,
                      color: AppColors.PrimaryPlaceHolder,
                    ),
                    AnimatedBuilder(
                      animation: snapshot.translateIcon,
                      builder: (context, child) {
                        return Transform.translate(
                          offset: Offset(
                              0,
                              snapshot.translateIcon.value *
                                  MediaQuery.of(context).size.height
                                  ),
                          child: child,
                        );
                      },
                      child: Container(
                        child: Image(
                          image: AssetImage("assets/images/character.png"),
                          fit: BoxFit.fill,
                        //  color: AppColors.SecondaryElement,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget expandedNavigation() {
    return ScaleTransition(
      alignment: Alignment.bottomRight,
      scale: _navigationAnimationController.scaleNavigation,
      child: ClipPath(
        clipper: CharacterClipper(),
        child: Container(
          color: AppColors.PrimaryBackground,
          alignment: Alignment(.5, 0),
          //  padding: EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[navHeader(), navItems(), Flexible(child: navFooter())],
          ),
        ),
      ),
    );
  }

  Widget navHeader() {
    return Container(
        color: AppColors.SecondaryElement,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * .42,
        alignment: Alignment(.2, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Spacer(
              flex: 4,
            ),
            Flexible(
              fit: FlexFit.loose,
              flex: 2,
              child: InkWell(
                onTap: (){
                  _controller.openLayout(PageName.Profile);
                  _navigationAnimationController.openOrCloseNavigation();
                },
                child: Container(
                    width: MediaQuery.of(context).size.width * .4,
                    alignment: Alignment.center,
                    //padding: EdgeInsets.all(20),
                    child: Text(
                      "User Name",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: AppColors.PrimaryBackground,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    )),
              ),
            ),
            Flexible(
              flex: 5,
              fit: FlexFit.loose,
              child: Container(
                  width: 150,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(20),
                  child: Placeholder()),
            ),

            Flexible(
              fit: FlexFit.loose,
              flex: 3,
              child: Container(
                  color: AppColors.PrimaryBackground,
                  child: InkWell(
                    onTap: (){
                      _navigationAnimationController.openOrCloseNavigation();
                      _controller.openLayout(PageName.Cart);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Spacer(flex: 2,),
                        Icon(
                          Icons.shopping_basket,
                          size: 40,
                          color: AppColors.SecondaryElement,
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Cart",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppColors.SecondaryElement,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                        ),Spacer()
                      ],
                    ),
                  )),
            ),
          ],
        ));
  }

  Widget navItems() {
    return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(top: 5),
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.PrimaryBackground, width: 5)),
        child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(top: 20,bottom: 20),
            color: AppColors.SecondaryElement,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    _navigationAnimationController.openOrCloseNavigation();
                    _controller.openLayout(PageName.HomePage);
                  },
                  child: Container(
                      height: MediaQuery.of(context).size.height * .05,
                      padding: EdgeInsets.only(right: 10),
                      alignment: Alignment(.9, 0),
                      child: Text(
                        "Home Page",
                        style: TextStyle(
                            color: AppColors.SecondaryBackGround,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      )),
                ),
                InkWell(
                  onTap: () {
                    _navigationAnimationController.openOrCloseNavigation();
                    _controller.openLayout(PageName.Branches);
                  },
                  child: Container(
                      height: MediaQuery.of(context).size.height * .05,
                      padding: EdgeInsets.only(right: 10),
                      alignment: Alignment(.9, 0),
                      child: Text("Branches",
                          style: TextStyle(
                              color: AppColors.SecondaryBackGround,
                              fontSize: 15,
                              fontWeight: FontWeight.w500))),
                ),
                InkWell(
                  onTap: () {
                    _navigationAnimationController.openOrCloseNavigation();
                    _controller.openLayout(PageName.Chatting);
                  },
                  child: Container(
                      height: MediaQuery.of(context).size.height * .05,
                      padding: EdgeInsets.only(right: 10),
                      alignment: Alignment(.9, 0),
                      child: Text("Contact Us ",
                          style: TextStyle(
                              color: AppColors.SecondaryBackGround,
                              fontSize: 15,
                              fontWeight: FontWeight.w500))),
                ),
                InkWell(
                  onTap: () {
                    _navigationAnimationController.openOrCloseNavigation();
                    _controller.openLayout(PageName.PointsClub);
                  },
                  child: Container(
                      height: MediaQuery.of(context).size.height * .05,
                      padding: EdgeInsets.only(right: 10),
                      alignment: Alignment(.9, 0),
                      child: Text("Points Club",
                          style: TextStyle(
                              color: AppColors.SecondaryBackGround,
                              fontSize: 15,
                              fontWeight: FontWeight.w500))),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * .03,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * .05,
                  // alignment: Alignment(.6, 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(right: 8),
                          child: Icon(Icons.lock_outline)),
                      InkWell(
                        onTap: () {
                          InitialController _init = Provider.of<InitialController>(context);
                          _navigationAnimationController.openOrCloseNavigation();
                          _init.onPageChange(AppPage.LoginPage);
                        },
                        child: Text("Log out",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppColors.SecondaryBackGround,
                                fontSize: 15,
                                fontWeight: FontWeight.w500)),
                      )
                    ],
                  ),
                )
              ],
            )));
  }

  Widget navFooter() {
    return Container(
      width: MediaQuery.of(context).size.width,
      //height: MediaQuery.of(context).size.height * .23,
      padding: EdgeInsets.only(top: 5),
      alignment: Alignment(-.5, 0),
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: AppColors.SecondaryElement,
      ),
    );
  }
}
