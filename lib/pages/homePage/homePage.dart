import 'package:flutter/material.dart';
import 'package:for_fun/controllers/cartController.dart';
import 'package:for_fun/controllers/homePageController.dart';
import 'package:for_fun/controllers/profileController.dart';
import 'package:for_fun/pages/homePage/navigationBar.dart';
import 'package:for_fun/pages/homePage/navigationBar2.dart';
import 'package:for_fun/values/colors.dart';
import 'package:for_fun/values/painters.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AppController _controller;
  @override
  void initState() {
    _controller = new AppController();
    super.initState();
  }

  @override
  void dispose() {
    //  _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _controller,
      child: Scaffold(
        body: Stack(
          children: <Widget>[screenContent(), NavigationBar2()],
        ),
      ),
    );
  }

  Widget screenContent() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: AppColors.PrimaryBackground,
      child: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * .24,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Align(
                    alignment: Alignment(-1,-0.4),
                    child: IconButton(
                        icon: Icon(
                          Icons.shopping_basket,
                          color: AppColors.PrimaryElement,
                          size: 60,
                        ),
                        onPressed: () {
                          _controller.openLayout(PageName.Cart);
                        }),
                  ),
                ),
                Flexible(
                  child: InkWell(
                    onTap: (){
                      _controller.openLayout(PageName.HomePage);
                    },
                    child: Align(
                      alignment: Alignment(0,-.2),
                      child: Container(
                        height: 50,
                          width: 150,
                          child: Placeholder(),),
                    ),
                  ),
                ),
                Spacer()
              ],
            ),
          ),
          Expanded(
            child: Consumer<AppController>(
              builder: (_, snapshot, __) {
                return ChangeNotifierProvider(
                  create: (_)=>ProfileController(),
                  child: ChangeNotifierProvider(
                    create: (_)=>new CartController(),
                      child: snapshot.getLayout()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
