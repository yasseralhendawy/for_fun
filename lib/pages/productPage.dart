import 'package:flutter/material.dart';
import 'package:for_fun/controllers/productPageController.dart';
import 'package:for_fun/models/product.dart';
import 'package:for_fun/values/colors.dart';
import 'package:for_fun/values/painters.dart';
import 'package:for_fun/widgets/productCard.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
  final Product item;

  ProductPage({@required this.item});

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  ItemProvider _provider;

  @override
  void initState() {
    _provider = new ItemProvider();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _provider,
      child: Scaffold(
        body: Container(
          child: Stack(
            children: <Widget>[
              _pageBody(context),
              Positioned(top: 0, child: _pageHeader(context)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _pageBody(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * .14,
          ),
          Expanded(
              child: Container(
            height: MediaQuery.of(context).size.height * .86,
            color: AppColors.PrimaryBackground,
            child: _pageContent(context),
          )),
        ],
      ),
    );
  }

  Widget _pageContent(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
      ),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Container(
              height: 300,
              color: AppColors.SecondaryElement,
              padding: const EdgeInsets.only(top: 8.0, right: 8),
              child: ProductCardForPage(
                product: widget.item,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Material(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: dialogs(context),
                )),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                color: AppColors.PrimaryPlaceHolder,
                borderRadius: BorderRadius.all(Radius.circular(16)),
                child: addToCart(),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _pageHeader(BuildContext context) {
    return CustomPaint(
      painter: TopPagePainter(),
      child: Container(
        height: MediaQuery.of(context).size.height * .24,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Align(
                alignment: Alignment(-1, -0.6),
                child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.PrimaryBackground,
                      size: 60,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
              ),
            ),
            Flexible(
              child: Align(
                alignment: Alignment(0, -.3),
                child: Container(
                  height: 50,
                  width: 150,
                  child: Placeholder(),
                ),
              ),
            ),
            Spacer()
          ],
        ),
      ),
    );
  }

  ///
  ///
  ///
  ///

  Widget addToCart() {
    return Consumer<ItemProvider>(builder: (context, data, _) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: 150,
        padding: EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                      flex: 1,
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                            icon: Icon(Icons.add_box),
                            onPressed: () {
                              _provider.incrementCount();
                            }),
                      )),
                  Expanded(
                      flex: 2,
                      child: Text(
                        data.number.toString(),
                        textAlign: TextAlign.center,
                      )),
                  Expanded(
                      flex: 1,
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                            icon: Icon(Icons.indeterminate_check_box),
                            onPressed: () {
                              _provider.decrementCount();
                            }),
                      ))
                ],
              ),
            ),
            Expanded(
                child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Text(
                    _provider.finalPrice().toString(),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                    child: FlatButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: BorderSide(color: AppColors.PrimaryBackground)),
                  color: AppColors.SecondaryElement,
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
                          "Add",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.PrimaryBackground,
                          ),
                        ))
                      ],
                    ),
                  ),
                )),
              ],
            )),
          ],
        ),
      );
    });
  }

  Widget dialogs(BuildContext context) {
    return Consumer<ItemProvider>(
      builder: (context, data, _) {
        return Column(
          children: <Widget>[
            RadioListTile(
              selected: data.size.size == ItemSize.Regular,
              title: Row(
                children: <Widget>[
                  Expanded(child: Text('Regular')),
                  Expanded(
                      child: Text(
                    _provider.options[0].price.toString(),
                    textAlign: TextAlign.center,
                  ))
                ],
              ),
              value: _provider.options[0],
              groupValue: data.size,
              onChanged: (SizePrices value) {
                _provider.setSize(value);
              },
            ),
            RadioListTile(
              selected: data.size.size == ItemSize.Medium,
              title: Row(
                children: <Widget>[
                  Expanded(child: Text('Medium')),
                  Expanded(
                      child: Text(
                    _provider.options[1].price.toString(),
                    textAlign: TextAlign.center,
                  ))
                ],
              ),
              value: _provider.options[1],
              groupValue: data.size,
              onChanged: (SizePrices value) {
                _provider.setSize(value);
              },
            ),
            RadioListTile(
              selected: data.size.size == ItemSize.Large,
              title: Row(
                children: <Widget>[
                  Expanded(child: Text('Large')),
                  Expanded(
                      child: Text(
                    _provider.options[2].price.toString(),
                    textAlign: TextAlign.center,
                  ))
                ],
              ),
              value: _provider.options[2],
              groupValue: data.size,
              onChanged: (SizePrices value) {
                _provider.setSize(value);
              },
            ),
            RadioListTile(
              selected: data.size.size == ItemSize.Extra,
              title: Row(
                children: <Widget>[
                  Expanded(child: Text('Extra Large')),
                  Expanded(
                      child: Text(
                    _provider.options[3].price.toString(),
                    textAlign: TextAlign.center,
                  ))
                ],
              ),
              value: _provider.options[3],
              groupValue: data.size,
              onChanged: (SizePrices value) {
                _provider.setSize(value);
              },
            ),
          ],
        );
      },
    );
  }
}
