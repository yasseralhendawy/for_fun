import 'package:flutter/material.dart';
import 'package:for_fun/controllers/welcomePageController.dart';
import 'package:for_fun/values/clippers.dart';
import 'package:for_fun/values/colors.dart';
import 'package:for_fun/values/painters.dart';
import 'package:provider/provider.dart';

class WelcomePageViewLayout extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: AppColors.PrimaryBackground,
      ),
      //  margin: EdgeInsets.all(10),
      child: welcomeSlider(context),
    );
  }

  Widget welcomeSlider(BuildContext context) {
    InitialController _controller=Provider.of<InitialController>(context);
    return Consumer<InitialController>(
      builder: (_,data,__){
        return CustomPaint(
          painter: RightBorderPainter(),
          child: ClipPath(
            clipper: CompanyProfileClip(),
            child: Stack(
              children: <Widget>[
                PageView.builder(
                  controller: data.welcomeSliderController,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 1,
                  itemBuilder: (BuildContext context , int index){
                    return slideWidget();
                  },
                ),
                Positioned(
                  bottom: 15,
                  right: 5,
                  child: FlatButton.icon(
                      label: Text(""),
                      icon: Icon(Icons.navigate_next,size: 100,color: AppColors.SecondaryBackGround,),
                      onPressed: () {
                        _controller.onPageChange(AppPage.LoginPage);
                        // _controller.onWelcomeSlide();
                      }),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget slideWidget() {
    return Consumer<InitialController>(
      builder: (_,snapshot,__){
        return Container(
          decoration: BoxDecoration(
              color: AppColors.SecondaryElement,
          ),
        );
      },
    );
  }
}
