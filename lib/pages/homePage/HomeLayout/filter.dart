import 'package:flutter/material.dart';
import 'package:for_fun/controllers/HomeLayoutController.dart';
import 'package:for_fun/values/colors.dart';
import 'package:provider/provider.dart';

class FiltersByWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeLayoutController _controller= Provider.of<HomeLayoutController>(context);
    return Consumer<HomeLayoutController>(builder: (_, snapshot, __) {
      return Container(
        //color: AppColors.SecondaryBackGround,
        padding: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height*.19,
        alignment: Alignment.center,
        child: Wrap(
          alignment: WrapAlignment.center,
          direction: Axis.horizontal,
          crossAxisAlignment: WrapCrossAlignment.center,
          runAlignment: WrapAlignment.center,
          children: <Widget>[
            tagButton((){
              _controller.initCategory();
            }, snapshot.options.category),


            tagButton((){
              _controller.initAge();
            }, snapshot.options.age),


            tagButton((){
              _controller.initGender();
            }, snapshot.options.gender),

            tagButton((){
              _controller.initSeason();
            }, snapshot.options.season),


            tagButton((){
              _controller.initYear();
            }, snapshot.options.year),
          ],
        ),
      );
    });
  }

  Widget tagButton(VoidCallback onPress, text){
    if(text==null ||text==""){
      return Container();
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FlatButton.icon(
          shape: RoundedRectangleBorder(
              side: BorderSide(color: AppColors.PrimaryElement,width: 1)
          ),
          color: AppColors.PrimaryBackground,
          onPressed: onPress,
          icon: Icon(Icons.clear),
          label: Text(text)),
    );
  }
}
