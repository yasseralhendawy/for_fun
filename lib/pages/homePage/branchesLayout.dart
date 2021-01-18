import 'package:flutter/material.dart';
import 'package:for_fun/values/clippers.dart';
import 'package:for_fun/values/colors.dart';

class BranchesLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        itemCount: 7,
        padding: EdgeInsets.only(bottom: 10),
        itemBuilder: (BuildContext context, int index) {
          return branchCard(context);
        },
      ),
    );
  }

  Widget branchCard(BuildContext context) {
    return ClipPath(
      clipper: CompanyProfileClip(),
      child: Card(
        child: Container(
          alignment: Alignment.topCenter,
          height: 300,
          margin: EdgeInsets.only(bottom: 10,left: 5,right: 5),
     //   color: AppColors.SecondaryElement,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                  child: Container(
                    color: AppColors.PrimaryPlaceHolder,
                    child: FadeInImage(
                placeholder: AssetImage("assets/images/placeholder.png"),
                image: NetworkImage("https://media.stylus.com/global/processedimages/2013/january/egs_threads_0113/pariskids_008_--__w_760_.jpg"),
                fit: BoxFit.fill,alignment: Alignment.topCenter,
              ),
                  )),
              Expanded(child: Container(
                color: AppColors.SecondaryBackGround,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(child: Text("Branch Name",style: TextStyle(fontWeight: FontWeight.w500,color: AppColors.SecondaryText,fontSize: 18),)),
                    Expanded(child: Text("Address details")),
                    Expanded(
                      flex: 2,
                        child: Row(
                      children: <Widget>[
                        Expanded(child: Text("Phone :010xxxxxxxx")),
                        Expanded(child: Image(image: AssetImage("assets/images/googlemap.jpeg")))
                      ],
                    ))
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
