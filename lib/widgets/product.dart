import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_order/models/Models.dart';
import 'package:easy_order/shared/shared.dart';
import 'package:easy_order/viewModel/viewModel.dart';
import 'package:easy_order/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:scoped_model/scoped_model.dart';

Widget productTable(context, List<Product> product) {
  return new Column(
    children: <Widget>[
      // searchField(productSearch),
      new Expanded(child: productsGrid(product))
    ],
  );
}

Widget productsGrid(List<Product> data) {
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          // childAspectRatio: ,
          mainAxisSpacing: 1,
          crossAxisSpacing: 1),
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.all(8.0),
          child: TrendingItem(
            product: data[index],
          ),
        );
      },
      itemCount: data.length,
    ),
  );
}

Widget upcomingProductTable(context, List<UpcomingProduct> product) {
  return new Column(
    children: <Widget>[
      // searchField(productSearch),
      new Expanded(child: upcomingProductsGrid(product))
    ],
  );
}

Widget upcomingProductsGrid(List<UpcomingProduct> data) {
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          // childAspectRatio: ,
          mainAxisSpacing: 1,
          crossAxisSpacing: 1),
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.all(8.0),
          child: UpcomingItem(
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

Column buildUpcoming(List<UpcomingProduct> data) {
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
              child: UpcomingItem(
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
  return Column(
    children: <Widget>[
      Padding(
        padding: EdgeInsets.all(5.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(color: Colors.white, width: 1.0),
                top: BorderSide(color: Colors.white, width: 1.0),
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
      ),
      Divider(color: Colors.grey,height: 1.0,),
    ],
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
            // width: trendCardWidth,
            //height: 170,
            child: FittedBox(
              child: Card(
                elevation: 14,
                color: Colors.white,
                shadowColor: Constant.getColor("2196f3"),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[_productImage(context), _productDetails()],
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

  _productImage(context) {
    return Container(
      width: 170,
      child: ClipRRect(
        child: Image(
          image: CachedNetworkImageProvider(product.image),
          // fit: BoxFit.fill,
          alignment: Alignment.center,
        ),
      ),
      // )
      // ],
    );
  }

  _productDetails() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    product.title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
                SizedBox(
                  width: 25,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: StarRating(
                      size: 15.0,
                      rating: product.rating,
                      color: Colors.orange,
                      borderColor: Colors.grey,
                      starCount: 5),
                ),
              ]),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(formatMoney(product.price),
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[900])),
              SizedBox(
                width: 25,
              ),
              Text(
                formatMoney(00.00),
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.lineThrough),
              )
            ],
          )
        ],
      ),
    );
  }
}

class UpcomingItem extends StatelessWidget {
  final UpcomingProduct product;

  UpcomingItem({this.product});

  @override
  Widget build(BuildContext context) {
    double trendCardWidth = 170;
    return GestureDetector(
      child: Stack(
        children: <Widget>[
          Container(
            // width: trendCardWidth,
            //height: 170,
            child: FittedBox(
              child: Card(
                elevation: 14,
                color: Colors.white,
                shadowColor: Constant.getColor("2196f3"),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[_productImage(context), _productDetails()],
                ),
              ),
            ),
          ),
        ],
      ),
      onTap: () => null,
    );
    // Navigator.of(context).pushNamed('/detail', arguments: product),
    // );
  }

  _productImage(context) {
    return Container(
      width: 200,
      child: ClipRRect(
        child: Image(
          image: CachedNetworkImageProvider(product.image),
          // fit: BoxFit.fill,
          alignment: Alignment.center,
        ),
      ),
      // )
      // ],
    );
  }

  _productDetails() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    product.title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
                SizedBox(
                  width: 25,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: StarRating(
                      size: 15.0,
                      rating: product.rating,
                      color: Colors.orange,
                      borderColor: Colors.grey,
                      starCount: 5),
                ),
              ]),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(formatMoney(product.price),
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[900])),
              SizedBox(
                width: 25,
              ),
              Text(
                formatMoney(00.00),
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.lineThrough),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Icon(
                Feather.getIconData("calendar"),
                size: 20,
                color: Constant.getColor("1b4332"),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                product.available_on,
                style: TextStyle(
                    color: Constant.getColor("1b4332"),
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    ),
              )
            ],
          )
        ],
      ),
    );
  }
}
