import 'package:flutter/material.dart';
import 'package:for_fun/controllers/homePageController.dart';
import 'package:for_fun/controllers/welcomePageController.dart';
import 'package:for_fun/values/colors.dart';
import 'package:provider/provider.dart';

class NavigationBar2 extends StatefulWidget {
  @override
  _NavigationBar2State createState() => _NavigationBar2State();
}

class _NavigationBar2State extends State<NavigationBar2>
    with TickerProviderStateMixin {
  AppController _controller;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _controller = Provider.of<AppController>(context);
    return Consumer<AppController>(
      builder: (_, snapshot, __) {
        return Container(
          alignment: Alignment.topRight,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                ),
                IntrinsicWidth(
                  child: AnimatedContainer(
                    height: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(100),
                            topLeft: Radius.circular(100)),
                        //  border: Border.fromBorderSide(BorderSide(color: AppColors.PrimaryBackground,width: 3)),
                        color: AppColors.SecondaryElement),
                    duration: Duration(milliseconds: 200),

                    //  color: AppColors.SecondaryElement,
                    curve: Curves.linearToEaseOut,
                    alignment: Alignment.bottomLeft,
                    child: snapshot.status == NavigationStatus.Open
                        ? navigationHeader()
                        : navIcon(),
                  ),
                ),
                AnimatedCrossFade(
                  secondCurve: Curves.easeInOut,
                  firstCurve: Curves.easeInOutBack,
                  sizeCurve: Curves.easeInOutBack,
                  secondChild: Container(
                    alignment: Alignment.topCenter,
                    width: MediaQuery.of(context).size.width * .65,
                    height: 0,
                  ),
                  firstChild: navigationBody(),
                  duration: Duration(milliseconds: 100),
                  alignment: Alignment.topCenter,
                  reverseDuration: Duration(milliseconds: 500),
                  crossFadeState: snapshot.status == NavigationStatus.Close
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                ),
                //  Spacer()
              ],
            ),
          ),
        );
      },
    );
  }

  Widget navIcon() {
    return Container(
      width: 100,
      alignment: Alignment.center,
      margin: EdgeInsets.all(13),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: AppColors.PrimaryBackground),
      child: InkWell(
        onTap: () {
          if (_controller.status == NavigationStatus.Open) {
            _controller.closeNav();
          } else {
            _controller.openNav();
          }
        },
        child: Image(
          image: AssetImage("assets/images/character.png"),
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget navigationHeader() {
    return Container(
      width: MediaQuery.of(context).size.width * .9,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          navIcon(),
          Container(
            width: MediaQuery.of(context).size.width * .5,
            alignment: Alignment.center,
            color: AppColors.SecondaryElement,
            child: Column(
              children: <Widget>[
                Spacer(),
                Expanded(
                  flex: 2,
                  child: InkWell(
                    onTap: () {
                      _controller.openLayout(PageName.Profile);
                      _controller.closeNav();
                    },
                    child: Container(
                        width: MediaQuery.of(context).size.width * .34,
                        child: Placeholder()),
                  ),
                ),
                Expanded(
                  child: Container(
                      width: MediaQuery.of(context).size.width * .35,
                      alignment: Alignment.center,
                      child: Text(
                        "User Name",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: AppColors.SecondaryBackGround,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      )),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget navigationBody() {
    return Container(
      width: 300,
      height: 600,
      alignment: Alignment.topCenter,
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          color: AppColors.SecondaryElement,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(130))),
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 7,
            child: Container(
              padding: EdgeInsets.only(top: 20),
              alignment: Alignment.center,
              //color: AppColors.PrimaryPlaceHolder,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: InkWell(
                        onTap: () {
                          _controller.openLayout(PageName.HomePage);
                          _controller.closeNav();
                        },
                        child: Text(
                          "Home ",
                          style: TextStyle(
                              color: AppColors.SecondaryBackGround,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        )),
                  ),
                  Expanded(
                      child: InkWell(
                          onTap: () {
                            _controller.openLayout(PageName.Cart);
                            _controller.closeNav();
                          },
                          child: Text("Cart",
                              style: TextStyle(
                                  color: AppColors.SecondaryBackGround,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500)))),
                  Expanded(
                      child: InkWell(
                          onTap: () {
                            _controller.openLayout(PageName.Branches);
                            _controller.closeNav();
                          },
                          child: Text("Branches",
                              style: TextStyle(
                                  color: AppColors.SecondaryBackGround,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500)))),
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      _controller.openLayout(PageName.Chatting);
                      _controller.closeNav();
                    },
                    child: Text("Customer Service",
                        style: TextStyle(
                            color: AppColors.SecondaryBackGround,
                            fontSize: 15,
                            fontWeight: FontWeight.w500)),
                  )),
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      _controller.openLayout(PageName.PointsClub);
                      _controller.closeNav();
                    },
                    child: Text("Points Club",
                        style: TextStyle(
                            color: AppColors.SecondaryBackGround,
                            fontSize: 15,
                            fontWeight: FontWeight.w500)),
                  )),
                ],
              ),
            ),
          ),
      Expanded(
        flex: 2,
        child: Center(
          child:  Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Icon(Icons.lock_outline)),
              InkWell(
                onTap: () {
                  InitialController _init = Provider.of<InitialController>(context);
                  _controller.closeNav();
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
        )),

          Spacer()
        ],
      ),
    );
  }
}
