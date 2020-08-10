import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_order/models/models.dart';
import 'package:easy_order/shared/shared.dart';
import 'package:easy_order/viewModel/viewModel.dart';
import 'package:easy_order/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:scoped_model/scoped_model.dart';

Widget productTable(context, List<Product> product) {
  var size = MediaQuery.of(context).size;

  /*24 is for notification bar on Android*/
  final double itemHeight = (size.height - kToolbarHeight - 24) / 3;
  final double itemWidth = size.width / 2;
  return new Column(
    children: <Widget>[
      // searchField(productSearch),
      new Expanded(child: productsGrid(product, (itemWidth / itemHeight)))
    ],
  );
}

Widget searchField(Function productSearch) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: TextFormField(
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
                borderSide: BorderSide(color: Constant.getColor("1b4332"))),
            prefixIcon: Icon(Icons.search, color: Constant.getColor("1b4332")),
            labelText: Constant.searchPlaceholder,
            labelStyle: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
                borderSide: BorderSide(color: Constant.getColor("1b4332")))),
        onChanged: (val) => productSearch(val)),
  );
}

Widget productsGrid(List<Product> data, aspectRadtio) {
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: aspectRadtio,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5),
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.all(5.0),
          child: TrendingItem(
            product: data[index],
          ),
        );
      },
      itemCount: data.length,
    ),
  );
}

Column buildTrending(List<Product> data) {
  return Column(
    children: <Widget>[
      Container(
        height: 180,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.all(5.0),
              child: TrendingItem(
                product: data[index],
              ),
            );
          },
          itemCount: data.length,
        ),
      )
    ],
  );
}

Widget buildDot(int index, int num) {
  return Padding(
    padding: EdgeInsets.all(5.0),
    child: Container(
      height: 10.0,
      width: 10.0,
      decoration: BoxDecoration(
          color: (num == index) ? Colors.black38 : Colors.grey[200],
          shape: BoxShape.circle),
    ),
  );
}

Widget generateCart(Product product) {
  return Padding(
    padding: EdgeInsets.all(5.0),
    child: Container(
      decoration: BoxDecoration(
          color: Colors.white12,
          border: Border(
            bottom: BorderSide(color: Colors.grey[100], width: 1.0),
            top: BorderSide(color: Colors.grey[100], width: 1.0),
          )),
      height: 100.0,
      child: Row(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            height: 100.0,
            width: 100.0,
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5.0)],
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0)),
            ),
            child: cacheImage(product.image),
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.only(top: 10.0, left: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        product.title,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15.0,
                            color: Colors.green[900]),
                      ),
                    ),
                    Container(
                        alignment: Alignment.bottomRight,
                        child: ScopedModelDescendant<CartViewModel>(
                          builder: (context, child, model) {
                            return InkResponse(
                                onTap: () {
                                  model.removeCart(product);
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(right: 10.0),
                                  child: Icon(
                                    Icons.remove_circle,
                                    color: Colors.red,
                                  ),
                                ));
                          },
                        ))
                  ],
                ),
                Row(children: <Widget>[
                  Expanded(
                    child: Text(
                        formatMoney(
                            product.price * int.parse(product.quantity)),
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12.0,
                            color: Colors.green[900])),
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    padding: EdgeInsets.only(top: 10),
                    child: ScopedModelDescendant<CartViewModel>(
                        builder: (context, child, model) {
                      return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.remove_circle_outline),
                              onPressed: () => product.quantity == "1"
                                  ? null
                                  : model.decreaseQuantity(product),
                            ),
                            Text(
                              '${product.quantity}',
                              style: TextStyle(fontSize: 15),
                            ),
                            IconButton(
                              icon: Icon(Icons.add_circle_outline),
                              onPressed: () => model.increaseQuantity(product),
                            )
                          ]);
                    }),
                  ),
                ])
              ],
            ),
          ))
        ],
      ),
    ),
  );
}

Widget productDetailsBottomNavigation(
    Product item, CartViewModel viewModel, Function showCartSnak) {
  return Container(
      margin: EdgeInsets.only(bottom: 18.0),
      height: 60.0,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Colors.grey[300], width: 1.0))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Container(
                  width: 60.0,
                  child: Text(
                    "Total Amount",
                    style: TextStyle(fontSize: 12.0, color: Colors.grey),
                  ),
                ),
                Text(formatMoney(item.price),
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.green[900])),
              ],
            ),
          ),
          RaisedButton(
            color: Constant.getColor("1b4332"),
            onPressed: () {
              viewModel.addCart(item);
              Timer(Duration(milliseconds: 500), () {
                showCartSnak(viewModel.cartMessage, viewModel.success);
              });
            },
            child: Row(children: <Widget>[
              Icon(
                Icons.add,
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "ADD TO CART",
                style:
                    TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
              ),
            ]),
          )
        ],
      ));
}

Widget cacheImage(String url) {
  return CachedNetworkImage(
    imageUrl: url,
    imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
      image: DecorationImage(
        image: imageProvider,
        fit: BoxFit.cover,
      ),
    )),
    placeholder: (context, url) => LoadingIndicator(),
    errorWidget: (context, url, error) => Icon(Icons.error),
  );
}

class TrendingItem extends StatelessWidget {
  final Product product;

  TrendingItem({this.product});

  @override
  Widget build(BuildContext context) {
    double trendCardWidth = 170;

    return GestureDetector(
      child: Stack(
        children: <Widget>[
          Container(
            width: trendCardWidth,
            child: Card(
              elevation: 2,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Column(
                  children: <Widget>[
                    // Row(
                    //   children: <Widget>[
                    //     Spacer(),
                    //     Icon(
                    //       Ionicons.getIconData("ios-heart-empty"),
                    //       color: Colors.black54,
                    //     )
                    //   ],
                    // ),
                    _productImage(),
                    _productDetails()
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      onTap: () =>
          Navigator.of(context).pushNamed('/detail', arguments: product),
    );
  }

  _productImage() {
    return Expanded(
        // children: <Widget>[
        child: Center(
      child: Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: CachedNetworkImageProvider(product.image),
              fit: BoxFit.contain),
        ),
      ),
    )
        // ],
        );
  }

  _productDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                product.title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
              ),
              // StarRating(rating: , size: 10),
              StarRating(
                  size: 10.0,
                  rating: product.rating,
                  color: Colors.orange,
                  borderColor: Colors.grey,
                  starCount: 5),
            ]),
        SizedBox(
          height: 7,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(formatMoney(product.price),
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[900])),
            SizedBox(
              width: 10,
            ),
            Text(
              formatMoney(00.00),
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                  decoration: TextDecoration.lineThrough),
            )
          ],
        )
      ],
    );
  }
}

