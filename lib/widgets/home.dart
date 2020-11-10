import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_order/models/Models.dart';
import 'package:easy_order/shared/shared.dart';
import 'package:easy_order/viewModel/viewModel.dart';
import 'package:easy_order/widgets/widget.dart';
import 'package:flutter/material.dart';

Widget profilePicture(String img) {
  return CircleAvatar(
    child: ClipOval(
      child: cacheImage(img),
    ),
    radius: 200 / 2,
  );
}

Widget profileDetails(context, Profile profile) {
  final authViewModel = locator<AuthViewModel>();
  return Container(
    child: Center(
      child: Column(children: <Widget>[
        TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Constant.getColor("1b4332"))),
            prefixIcon: Icon(Icons.person, color: Constant.getColor("1b4332")),
            labelText: Constant.namePlaceholder,
            labelStyle: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          initialValue: profile.name,
          enabled: false,
        ),
        SizedBox(
          height: 20.0,
        ),
        TextFormField(
          initialValue: profile.phone,
          enabled: false,
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Constant.getColor("1b4332"))),
            prefixIcon: Icon(Icons.phone, color: Constant.getColor("1b4332")),
            labelText: Constant.phonePlaceholder,
            labelStyle: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        TextFormField(
          initialValue: profile.email,
          enabled: false,
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Constant.getColor("1b4332"))),
            prefixIcon: Icon(Icons.email, color: Constant.getColor("1b4332")),
            labelText: Constant.emailPlaceholder,
            labelStyle: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ),
        SizedBox(
          height: 40.0,
        ),
        Container(
          height: 55.0,
          child: Material(
            borderRadius: BorderRadius.circular(20.0),
            shadowColor: Constant.getColor("1b4332"),
            color: Constant.getColor("1b4332"),
            elevation: 7.0,
            child: RaisedButton(
                color: Constant.getColor("1b4332"),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          child: Text(
                        Constant.logOutLabel,
                        style: TextStyle(
                          //height:2.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                          fontSize: 20,
                        ),
                      )),
                      SizedBox(
                        width: 10.0,
                      ),
                      Container(
                        child: Icon(
                          Icons.exit_to_app,
                          color: Colors.white,
                          size: 20.0,
                        ),
                      ),
                    ]),
                onPressed: () async {
                  await authViewModel.logOut();
                  Navigator.of(context).pushNamed('/login');
                }),
          ),
        )
      ]),
    ),
  );
}

CarouselSlider buildCarouselSlider(List<dynamic> ads) {
  return CarouselSlider(
    height: 150,
    viewportFraction: 0.9,
    aspectRatio: 16 / 9,
    autoPlay: true,
    enlargeCenterPage: true,
    items: ads.map(
      (ad) {
        // print("carousel data ---> ${ad['url']}");
        return Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Image.network(
                  ad['url'],
                  fit: BoxFit.cover,
                  width: 1000.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      ad['heading'],
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(ad['description'],
                          style: TextStyle(color: Colors.white, fontSize: 14)),
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      },
    ).toList(),
  );
}

class CategoriesListView extends StatelessWidget {
  final List<Category> categories;
  // final List<String> categoryTitle;

  const CategoriesListView({
    Key key,
    @required this.categories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: LinePainter(),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 5),
            height: 90,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    // print("Category ID is ---> ${categories[index].id}");
                    Navigator.of(context).pushNamed("/product/category",
                        arguments:[categories[index].id,categories[index].title]);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          width: 55,
                          height: 55,
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Constant.getColor("1b4332"),
                            border: Border.all(
                              color: Colors.blueGrey,
                              width: 1,
                            ),
                          ),
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage(
                                  categories[index].icon,
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            categories[index].title,
                            style: TextStyle(
                              fontSize: 10,
                              fontFamily: 'FontAwesome5Brands',
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CustomBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: LinePainter(),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        height: 90.0,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(),
                ),
                Icon(Icons.search),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 0.2
      ..style = PaintingStyle.stroke;

    Path path = Path();
    path.moveTo(0, size.height + 10);
    path.lineTo(size.width, size.height + 10);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
