import 'package:flutter/material.dart';
import 'package:for_fun/controllers/HomeLayoutController.dart';
import 'package:for_fun/models/product.dart';
import 'package:for_fun/values/colors.dart';
import 'package:for_fun/widgets/productCard.dart';
import 'package:provider/provider.dart';


/// this code inspired from  (Shrine) app which belong to material labs cases studies
class HomePageLayout extends StatefulWidget {

  @override
  _HomePageLayoutState createState() => _HomePageLayoutState();
}

class _HomePageLayoutState extends State<HomePageLayout> {
  HomeLayoutController _controller;

  @override
  void initState() {
    _controller = new HomeLayoutController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_)=> _controller,
      child: Consumer<HomeLayoutController>(
        builder: (_,snapshot,__){
          int _itemCount= _listItemCount(snapshot.juniorProducts.length);
          double layoutHeight=MediaQuery.of(context).size.height*.83;
          switch (snapshot.menu) {
            case Filter.open:
              layoutHeight+=MediaQuery.of(context).size.height*.4;
              break;
            case Filter.empty:
              break;
            case Filter.filter:
              layoutHeight+=MediaQuery.of(context).size.height*.19;
              break;
            default:
          }

          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: FlatButton.icon(
                    label: Text("Filter"),
                    icon: Icon(
                      Icons.filter_list,
                      size: 40,
                      color: AppColors.PrimaryElement,
                    ),
                    onPressed: () {
                      _controller.openCloseMenu();
                    },
                  ),
                ),
                Container(
                  height: layoutHeight,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        IntrinsicHeight(
                            child: snapshot.getMenu()
                          //child: FiltersByWidget(),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 600,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: _itemCount,
                            itemBuilder: (BuildContext context, int index){
                              double width;
                              Widget _evenOrOdd;

                              if(index%2==0){
                                width=MediaQuery.of(context).size.width*.6;
                                int bottom = _evenCasesIndex(index);
                                _evenOrOdd=twoProducts(snapshot.juniorProducts.length - 1 >= bottom + 1
                                    ?snapshot.juniorProducts[bottom+1]:null, snapshot.juniorProducts[bottom]);
                              }else{
                                width=MediaQuery.of(context).size.width*.7;
                                _evenOrOdd=oneProduct(snapshot.juniorProducts[_oddCasesIndex(index)]);
                              }


                              return Container(
                                width: width,
                                  margin: EdgeInsets.all(10),
                                  child: _evenOrOdd);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget twoProducts(Product bottom,Product top){
    return Column(
      children: <Widget>[
        Expanded(
          flex: 4,
        child: ProductCard(product: top,)),
        Spacer(),
        Expanded(
          flex: 4,
            child: bottom!=null?ProductCard(product: bottom,):Container()),
        Spacer()
      ],
    );
  }

  Widget oneProduct(Product product){
    return Column(
      children: <Widget>[
        Spacer(flex: 2,),
        Expanded(
          flex: 5,
            child: ProductCard(product: product,)),
        Spacer(flex: 3,),
      ],
    );
  }

  int _evenCasesIndex(int input) {
    /// The operator ~/ is a cool one. It's the truncating division operator. It
    /// divides the number and if there's a remainder / decimal, it cuts it off.
    /// This is like dividing and then casting the result to int. Also, it's
    /// functionally equivalent to floor() in this case.
    return input ~/ 2 * 3;
  }

  int _oddCasesIndex(int input) {
    assert(input > 0);
    return (input / 2).ceil() * 3 - 1;
  }

  int _listItemCount(int totalItems) {
    if (totalItems % 3 == 0) {
      return totalItems ~/ 3 * 2;
    } else {
      return (totalItems / 3).ceil() * 2 - 1;
    }
  }
}
