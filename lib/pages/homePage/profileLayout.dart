import 'package:flutter/material.dart';
import 'package:for_fun/controllers/profileController.dart';
import 'package:for_fun/values/colors.dart';
import 'package:for_fun/widgets/addressDetails.dart';
import 'package:provider/provider.dart';

class ProfileLayout extends StatefulWidget {
  @override
  _ProfileLayoutState createState() => _ProfileLayoutState();
}

class _ProfileLayoutState extends State<ProfileLayout> {
  ProfileController _controller;

  @override
  Widget build(BuildContext context) {
    _controller = Provider.of<ProfileController>(context);
    return Container(
      height: MediaQuery.of(context).size.height * .76,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _basicInfo(context),
            Container(
                height: 600,
                child: _pageBody(context))
          ],
        ),
      ),
    );
  }

  Widget _basicInfo(BuildContext context) {
    return Container(
      height: 200,
      child: Card(
        color: AppColors.SecondaryBackGround,
        child: Row(
          children: <Widget>[
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Placeholder(),
            )),
            Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          "User Name",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: AppColors.SecondaryElement),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "email@domain.com",
                          style: TextStyle(color: AppColors.PrimaryText),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "01xxxxxxxxx",
                          style: TextStyle(color: AppColors.PrimaryText),
                        ),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Widget _pageBody(BuildContext context) {
    return DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(
          appBar: TabBar(
            tabs: <Widget>[
              Text(
                "Address Details",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                "Payments",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ],
            labelColor: AppColors.PrimaryElement,
            unselectedLabelColor: AppColors.PrimaryText,
            indicatorColor: AppColors.SecondaryElement,
            labelPadding: EdgeInsets.all(10),
          ),
          body: TabBarView(children: [
            _addOrEditAddress(context),
            //_payment()
            expandedPayment(),
          ]),
        ));
  }

  Widget _addOrEditAddress(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(flex: 2, child: AddressDetails()),
        Container(
          width: MediaQuery.of(context).size.width * .5,
          child: FlatButton(
            onPressed: (){},
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
                side: BorderSide(color: AppColors.SecondaryText)
            ),
            color: AppColors.PrimaryBackground,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 20.0,
              ),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Expanded(
                      child: Text(
                        "Confirm",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.SecondaryText,
                        ),
                      ))
                ],
              ),
            ),
          ),
        ),
        Spacer()
      ],
    );
  }

  Widget _paymentDetail() {
    return Container(
      height: MediaQuery.of(context).size.height*.3,
      child: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 50,
              color: AppColors.SecondaryBackGround,
              margin: EdgeInsets.all(4),
              child: Row(
                children: <Widget>[
                  Expanded(child: Text("Item"),),
                  Expanded(child: Text("Price"),),
                ],
              ),
            );
          }),
    );
  }

  Widget expandedPayment() {
    return Consumer<ProfileController>(
      builder: (_, snapshot, __) {
        return CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                return Column(
                  children: <Widget>[
                    Container(
                      color:AppColors.PrimaryBackground,
                      margin: EdgeInsets.all(4),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex:2,
                            child: Text(
                              "Receipt ID",
                              style: TextStyle(
                                  color: AppColors.SecondaryText,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18),
                            ),
                          ),
                          Expanded(
                            flex:2,
                            child: Text(
                              "1-1-2020",textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: AppColors.SecondaryText,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14),
                            ),
                          ),
                          Expanded(
                            child: FlatButton(
                              onPressed: () {
                                _controller.setExpandedOrShrink(index);
                              },
                              child: snapshot.bills[index].expanded?Icon(Icons.expand_less):Icon(Icons.expand_more),
                            ),
                          ),
                        ],
                      ),
                    ),
                    snapshot.bills[index].expanded
                        ? _paymentDetail()
                        : Container()
                  ],
                );
              }, childCount: snapshot.bills.length),
            ),
          ],
        );
      },
    );
  }
}
