import 'package:flutter/material.dart';
import 'package:for_fun/values/colors.dart';

class ChattingLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
        color: AppColors.SecondaryBackGround,
        border: Border.fromBorderSide(BorderSide(color: AppColors.SecondaryElement,width: 2))
      ),
      child: Column(
        children: <Widget>[
          Expanded(child: Container(

          ),),
          TextField(
            decoration: InputDecoration(
              suffixIcon: FlatButton(onPressed: (){},child: Icon(Icons.send,color: AppColors.SecondaryElement,)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),),
          )
        ],
      ),
    );
  }
}
