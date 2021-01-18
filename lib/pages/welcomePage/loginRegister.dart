import 'package:flutter/material.dart';
import 'package:for_fun/controllers/welcomePageController.dart';
import 'package:for_fun/values/clippers.dart';
import 'package:for_fun/values/colors.dart';
import 'package:for_fun/values/painters.dart';
import 'package:provider/provider.dart';

class LoginRegisterLayout extends StatefulWidget {
  @override
  _LoginRegisterLayoutState createState() => _LoginRegisterLayoutState();
}

class _LoginRegisterLayoutState extends State<LoginRegisterLayout> {
  InitialController _appController;

  PageController _pageController;


  @override
  void initState() {
    _pageController= new PageController();
    super.initState();
  }
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColors.PrimaryBackground),
      child: CustomPaint(
        painter: RightBorderPainter(),
        child: ClipPath(
          clipper: CompanyProfileClip(),
          child: Padding(
            padding: EdgeInsets.only(left: 10, top: 10),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * .1,
                  ),
                  logoWidget(),
                  loginSignUpPageView(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget loginSignUpPageView() {
    return Container(
      height: MediaQuery.of(context).size.height*.6,
      child: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: <Widget>[
          logInPageView(),
          signUpPageView()
        ],
      ),
    );
  }

  Widget signUpPageView() {
    return IntrinsicHeight(
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Card(
          color: AppColors.SecondaryBackGround,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: TextEditingController(),
                    style: TextStyle(color: AppColors.PrimaryText),
                    decoration: InputDecoration(
                        hintText: "Username",
                        icon: Icon(
                          Icons.person_pin,
                        )),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: TextEditingController(),
                    style: TextStyle(color: AppColors.PrimaryText),
                    decoration: InputDecoration(
                        hintText: "Email",
                        icon: Icon(
                          Icons.alternate_email,
                        )),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: TextEditingController(),
                    style: TextStyle(color: AppColors.PrimaryText),
                    decoration: InputDecoration(
                        hintText: "Phone",
                        icon: Icon(
                          Icons.smartphone,
                        )),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: TextEditingController(),
                    style: TextStyle(color: AppColors.PrimaryText),
                    decoration: InputDecoration(
                        hintText: "Password", icon: Icon(Icons.vpn_key)),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: TextEditingController(),
                    style: TextStyle(color: AppColors.PrimaryText),
                    decoration: InputDecoration(
                        hintText: "Confirm Password", icon: Icon(Icons.confirmation_number)),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                    margin: EdgeInsets.all(15),
                    child: FlatButton(
                        onPressed: () {
                          _appController=Provider.of<InitialController>(context);
                          _appController.onPageChange(AppPage.HomePage);
                          //TODO : complete registration info
                        },
                        child: Text(
                          "Register",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: AppColors.SecondaryElement,
                              fontSize: 18),
                        ))),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget logoWidget() {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * .3,
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.only(right: 40),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(bottomRight:Radius.circular(100),topLeft :Radius.circular(100),),
          border: Border.fromBorderSide(BorderSide(color: AppColors.SecondaryBackGround,width: 14))
        ),
        child: Image(image: AssetImage("assets/images/character.png"),));
  }

  Widget logInPageView() {
    return Column(
      children: <Widget>[
        Flexible(
          flex: 2,
          child: IntrinsicHeight(
            child: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Card(
                color: AppColors.SecondaryBackGround,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: TextEditingController(),
                          style: TextStyle(color: AppColors.PrimaryText),
                          decoration: InputDecoration(
                              hintText: "Username",
                              icon: Icon(
                                Icons.person_pin,
                              )),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: TextEditingController(),
                          style: TextStyle(color: AppColors.PrimaryText),
                          decoration: InputDecoration(
                              hintText: "Password", icon: Icon(Icons.vpn_key)),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                          margin: EdgeInsets.all(15),
                          child: FlatButton(
                              onPressed: () {
                                _appController=Provider.of<InitialController>(context);
                                _appController.onPageChange(AppPage.HomePage);
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.SecondaryElement,
                                    fontSize: 18),
                              ))),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
        Flexible(
          child: Container(
           //   margin: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Flexible(child: _socialMedia()),
                  Flexible(
                    child: FlatButton(
                        onPressed: () {
                          _pageController.animateToPage(1, duration: Duration(milliseconds: 500), curve: Curves.ease);
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              color: AppColors.SecondaryElement,
                              fontWeight: FontWeight.w600),
                        )),
                  ),
                ],
              )),
        )
      ],
    );
  }

  Widget _socialMedia() {
    return Container(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: FlatButton(
              onPressed: () {},
              child: Image(
                image: AssetImage("assets/images/googleicon.png"),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Expanded(
              child: FlatButton(
                  onPressed: () {},
                  child: Image(
                    image: AssetImage("assets/images/facebookicon.png"),
                    fit: BoxFit.fitHeight,
                  )))
        ],
      ),
    );
  }
}
