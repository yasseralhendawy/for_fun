import 'package:flutter/material.dart';
import 'package:for_fun/pages/homePage/homePage.dart';
import 'package:for_fun/pages/welcomePage/loginRegister.dart';
import 'package:for_fun/pages/welcomePage/welcomepageViewLayout.dart';
import 'package:for_fun/values/colors.dart';
import 'package:provider/provider.dart';

import 'controllers/welcomePageController.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    InitialController _controller = InitialController();
    return ChangeNotifierProvider<InitialController>(
      create: (_) => _controller,
      child: MaterialApp(
        title: 'Junior ',
        theme: ThemeData(
          fontFamily: "Lemonada",
          primarySwatch: Colors.red,
        ),
        home: Scaffold(
          body:  Container(
              color: AppColors.PrimaryBackground,
              child: Consumer<InitialController>(
                builder: (_, snapshot, __) {
                  return PageView(
                    controller: snapshot.pageController,
                    physics: NeverScrollableScrollPhysics(),
                    children: <Widget>[
                      WelcomePageViewLayout(),
                      LoginRegisterLayout(),
                      MyHomePage()
                    ],
                  );
                },
              ),
            ),
          ),
        ),
    );
  }
}