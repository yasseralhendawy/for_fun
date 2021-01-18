import 'package:flutter/material.dart';
import 'package:for_fun/controllers/cartController.dart';
import 'package:for_fun/models/product.dart';
import 'package:for_fun/values/colors.dart';
import 'package:for_fun/widgets/addressDetails.dart';
import 'package:provider/provider.dart';

class CartLayout extends StatefulWidget {
  @override
  _CartLayoutState createState() => _CartLayoutState();
}

class _CartLayoutState extends State<CartLayout> {
  CartController _controller;

  @override
  Widget build(BuildContext context) {
     _controller = Provider.of<CartController>(context);
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: PageView(
        controller: _controller.pageController,
        physics:  NeverScrollableScrollPhysics(),
        children: <Widget>[
          _itemsPageView(),
          _addressAndFinalizing()
        ],
      ),
    );
  }

  Widget _itemsPageView(){
    return Container(
      alignment: Alignment.topCenter,
      child: Column(
        children: <Widget>[
          Expanded(child: Consumer<CartController>(
            builder: (_, snapshot, __) {
              return ListView.builder(
                  itemCount: snapshot.items.length,
                  padding: EdgeInsets.all(10),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                            border:
                            Border.all(color: AppColors.SecondaryElement)),
                        child: _itemWidget(context, snapshot.items[index]),
                      ),
                    );
                  });
            },
          )),
          IntrinsicHeight(
            child: Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: AppColors.SecondaryBackGround,
                  border: Border.all(color: AppColors.SecondaryElement)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                      child: Text(
                        "Total :",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: AppColors.PrimaryText),
                      )),
                  Expanded(
                    child: Text("0.0",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: AppColors.PrimaryText)),
                  )
                ],
              ),
            ),
          ),
          IntrinsicHeight(
            child: Container(
              padding: EdgeInsets.all(20),
              child: FlatButton(
                onPressed: () {
                  _controller.proceed();
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: AppColors.PrimaryBackground)
                ),
                color: AppColors.PrimaryElement,
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
                            "Proceed",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.PrimaryBackground,
                            ),
                          ))
                    ],
                  ),
                ),
              )
            ),
          ),

        ],
      ),
    );
  }

  Widget _itemWidget(BuildContext context, Product item) {
    return Row(
      children: <Widget>[
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FadeInImage(
            placeholder: AssetImage('assets/images/logo2.png'),
            image: NetworkImage(item.imagePath),
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          ),
        )),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        item.name,
                        style: TextStyle(
                            color: AppColors.PrimaryElement,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    )),
                Expanded(
                  child: Text("Size:   S"),
                ),
                Expanded(
                    child: Row(
                  children: <Widget>[
                    Expanded(child: Text("Count : 1")),
                    Expanded(child: Text("Price : " + item.price.toString()))
                  ],
                )),
                Expanded(child: Text("Total Price : 000")),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _addressAndFinalizing(){
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
                height: 250,child: AddressDetails()),
            _paymentMethod(),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: FlatButton(
                onPressed: () {
                  _controller.proceed();
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: AppColors.PrimaryBackground)
                ),
                color: AppColors.PrimaryElement,
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
                              color: AppColors.PrimaryBackground,
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _paymentMethod(){
    return Consumer<CartController>(
      builder: (_,snapshot,__){
        return Container(
          height: 250,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(color: AppColors.SecondaryBackGround,borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Column(
            children: <Widget>[
              ListTile(
                title: const Text('Payment Method 1'),
                leading: Radio(
                  value: PaymentMethod.Method1,
                  groupValue: snapshot.method,
                  onChanged: (PaymentMethod value) {
                    _controller.setPaymentMethod(value);
                  },
                ),
              ),
              ListTile(
                title: const Text('Payment Method 2'),
                leading: Radio(
                  value: PaymentMethod.Method2,
                  groupValue: snapshot.method,
                  onChanged: (PaymentMethod value) {
                    _controller.setPaymentMethod(value);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

}
