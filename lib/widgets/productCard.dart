import 'package:flutter/material.dart';
import 'package:for_fun/models/product.dart';
import 'package:for_fun/pages/productPage.dart';
import 'package:for_fun/values/clippers.dart';
import 'package:for_fun/values/colors.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  ProductCard({this.product,Key key}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => ProductPage(item: product,)),
        );
      },
      child: ProductCardForPage(product:product,),
    );
  }
}

class ProductCardForPage extends StatelessWidget {
  final Product product;


  ProductCardForPage({this.product,Key key}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper:  CompanyProfileClip(),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: AppColors.SecondaryBackGround,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
                flex: 7,
                child: FadeInImage(
                  placeholder: AssetImage('assets/images/placeholder.png'),
                  image: NetworkImage(product.imagePath),
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fitWidth,alignment: Alignment.topCenter,
                )),
            Expanded(
                flex: 1,
                child: Text(product.name,
                  style: TextStyle(fontWeight: FontWeight.w500,color: AppColors.SecondaryText,fontSize: 15),)),
            Expanded(
                flex: 1,
                child: Text(product.price.toString()))
          ],
        ),
      ),
    );
  }
}

