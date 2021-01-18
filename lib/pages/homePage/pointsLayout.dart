import 'package:flutter/material.dart';
import 'package:for_fun/values/colors.dart';

class PointsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _barcode(context),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: AppColors.SecondaryBackGround,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(child: Text("POINTS",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w500,color: AppColors.SecondaryText,fontSize: 17),)),
                    Expanded(child: Text("60 EGP",textAlign: TextAlign.center,style:TextStyle(fontWeight: FontWeight.w700,color: AppColors.PrimaryText,fontSize: 17),)),
                  ],
                ),
              ),
            ),
          ),
          Spacer()
        ],
      ),
    );
  }

  Widget _barcode(BuildContext context) {
    return Card(
      color: AppColors.SecondaryBackGround,
      margin: EdgeInsets.all(15),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height*.4,
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
            image: DecorationImage(
                image: AssetImage("assets/images/barcodeBackground.jpg"),
                colorFilter: ColorFilter.mode(
                    AppColors.PrimaryPlaceHolder.withOpacity(0.1),
                    BlendMode.dstATop),fit: BoxFit.fill)),
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Expanded(child: Image(image: AssetImage("assets/images/barcode.jpg"),fit: BoxFit.fitWidth,)),
            Text("0000000000000000",style: TextStyle(color: AppColors.PrimaryText,fontSize: 18,fontWeight: FontWeight.w700),)
          ],
        ),
      ),
    );
  }
}
