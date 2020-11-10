import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_order/models/Models.dart';
import 'package:easy_order/screens/details/details.dart';
import 'package:easy_order/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

Widget generatePostList(Recipe post) {
  return PostItem(post.author, post.title_header, post.featured_image,
      post.likes, post.views, post.created_at, post);
}



class PostItem extends StatefulWidget {
  final String author;
  final String title_header;
  final String featured_image;
  final int likes;
  final int views;
  final String created_at;
  final Recipe item;

  PostItem(this.author, this.title_header, this.featured_image, this.likes,
      this.views, this.created_at, this.item);
  
  @override
  _PostItemState createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  bool pressed = false;
  List<Color> recipeColor = [
   Constant.getColor("264653"),
   Constant.getColor("f4a261"),
   Constant.getColor("e63946"),
   Constant.getColor("457b9d"),
   Constant.getColor("1d3557"),
   Constant.getColor("03045e"),
   Constant.getColor("023e8a"),
   Constant.getColor("6d6875"),
   Constant.getColor("e07a5f"),
   Constant.getColor("3d405b"),
   Constant.getColor("03071e"),
   Constant.getColor("370617"),
   Constant.getColor("6a040f"),
   Constant.getColor("9d0208"),
   Constant.getColor("e85d04"),
   Constant.getColor("ef476f"),
   Constant.getColor("073b4c"),
   Constant.getColor("774936"),
   Constant.getColor("7400b8"),
   Constant.getColor("6930c3"),
   Constant.getColor("5e60ce"),
   Constant.getColor("006d77"),
   Constant.getColor("2b2d42"),
   Constant.getColor("05668d"),
   Constant.getColor("02c39a"),

  ];

  Random rnd = new Random();
  Color randomListItem(List<Color> lst) => lst[rnd.nextInt(lst.length)];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
      child: GestureDetector(
          onTap: () {
            // print("post ==> ${widget.item.toMap()}");
            Navigator.of(context)
                .pushNamed('/post/detail', arguments: widget.item);
          },
          child: Container(
            child: FittedBox(
              child: Material(
                color: randomListItem(recipeColor),
                elevation: 14,
                borderRadius: BorderRadius.circular(24.0),
                shadowColor: Constant.getColor("2196f3"),
                child: Row(
                  // mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _details(),
                    Container(
                      width: 250,
                      height: 250,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(24.0),
                        child: Image(
                          image:
                              CachedNetworkImageProvider(widget.featured_image),
                          fit: BoxFit.cover,
                          width: 250,
                          height: 230,
                          alignment: Alignment.topRight,
                        ),
                      ),
                      // ),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }

  _details() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            widget.title_header,
            style: TextStyle(
                fontSize: 35,
                fontFamily: "FontAwesome5Solid",
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal,
                color: Colors.white),
          ),
          SizedBox(
            height: 5,
          ),
          postAuthor(widget.author),
          postViews(),
          postDate(Constant.dateToString(widget.created_at)),
        ],
      ),
    );
  }

  postViews() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
          Icon(
            Feather.getIconData("eye"),
            size: 30,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            "${widget.views}",
            style: TextStyle(
                fontSize: 30,
                fontFamily: "FontAwesome5",
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
                color: Colors.white),
          )
        ],
      ),
    );
  }

  postAuthor(String val) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
          Icon(
            Feather.getIconData("user"),
            size: 30,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            val,
            style: TextStyle(
                fontSize: 30,
                fontFamily: "FontAwesome5",
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
                color: Colors.white),
          )
        ],
      ),
    );
  }

  postDate(String val) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
          Icon(
            Feather.getIconData("calendar"),
            size: 30,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            val,
            style: TextStyle(
                fontSize: 30,
                fontFamily: "FontAwesome5",
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
                color: Colors.white),
          )
        ],
      ),
    );
  }
}
