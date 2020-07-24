
import 'package:easy_order/models/models.dart';
import 'package:easy_order/shared/shared.dart';
import 'package:easy_order/viewModel/viewModel.dart';
import 'package:easy_order/widgets/product.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:money2/money2.dart';

import 'package:scoped_model/scoped_model.dart';

Widget nextBtn(
  context,
  String route,
) {
  return Container(
      height: 55.0,
      child: Material(
          borderRadius: BorderRadius.circular(20.0),
          shadowColor: Colors.green[700],
          color: Colors.green[700],
          elevation: 7.0,
          child: GestureDetector(
            onTap: () => Navigator.of(context).pushNamed(route), //:  null,
            child: Center(
                child: Text(
              Constant.nextLabel,
              style: TextStyle(
                //height:2.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat',
                fontSize: 25,
              ),
            )),
          )));
}

formatMoney(double price) {
  // print("naira symbol ---> ${}");
  String symbol = new String.fromCharCodes(new Runes('\u20A6'));
  Currency _currency = Currency.create('NG', 2,symbol:symbol);
  // Create money from an int.
  Money _money = Money.from(price, _currency);
  return _money.format('S###,###.##');
}

AppBar buildAppBar(
    BuildContext context, GlobalKey<ScaffoldState> _scaffoldKey) {
  return AppBar(
    title: Text(
      "SMOR-FARM",
      style: TextStyle(color: Colors.white, fontSize: 16),
    ),
    leading: new IconButton(
        icon: new Icon(MaterialCommunityIcons.getIconData("menu"),
            color: Colors.white),
        onPressed: () => _scaffoldKey.currentState.openDrawer()),
    actions: <Widget>[
      GestureDetector(
        onTap: () => Navigator.of(context).pushNamed('/search'),
        child: Icon(
          MaterialCommunityIcons.getIconData("magnify"),
          color: Colors.white,
        ),
      ),
      Stack(
        children: <Widget>[
          IconButton(
            icon: Icon(
              MaterialCommunityIcons.getIconData("cart-outline"),
            ),
            color: Colors.white,
            onPressed: () => Navigator.of(context).pushNamed('/cart'),
          ),
          Positioned(
            left: 20.0,
            child: ScopedModelDescendant<CartViewModel>(
              builder: (context, child, model) {
                return Container(
                  child: Align(
                      alignment: Alignment.topCenter,
                      // widthFactor:1,
                      // heightFactor:.5,
                      child: Text(
                        (model.cartListing.length > 0)
                            ? model.cartListing.length.toString()
                            : "",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                            fontWeight: FontWeight.w900),
                      )),
                );
              },
            ),
          ),
        ],
      ),
    ],
    backgroundColor: Colors.green[700],
  );
}

AppBar pageAppBar(BuildContext context, String title) {
  return AppBar(
    title: Text(
      title,
      style: TextStyle(color: Colors.white, fontSize: 16),
    ),
    leading: new IconButton(
        icon: new Icon(MaterialCommunityIcons.getIconData("keyboard-backspace"),
            color: Colors.white),
        onPressed: () => Navigator.of(context).pop()),
    actions: <Widget>[
      // GestureDetector(
      //   onTap: () => Navigator.of(context).pushNamed('/search'),
      //   child: Icon(
      //     MaterialCommunityIcons.getIconData("magnify"),
      //     color: Colors.white,
      //   ),
      // ),
      Stack(
        children: <Widget>[
          IconButton(
            icon: Icon(
              MaterialCommunityIcons.getIconData("cart-outline"),
            ),
            color: Colors.white,
            onPressed: () => Navigator.of(context).pushNamed('/cart'),
          ),
          Positioned(
            left: 20.0,
            child: ScopedModelDescendant<CartViewModel>(
              builder: (context, child, model) {
                return Container(
                  child: Align(
                      alignment: Alignment.topCenter,
                      // widthFactor:1,
                      // heightFactor:.5,
                      child: Text(
                        (model.cartListing.length > 0)
                            ? model.cartListing.length.toString()
                            : "",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                            fontWeight: FontWeight.w900),
                      )),
                );
              },
            ),
          ),
        ],
      ),
    ],
    backgroundColor: Colors.green[700],
  );
}

leftDrawerMenu(Profile user, BuildContext context) {
  Color blackColor = Colors.white;

  return Container(
    decoration: BoxDecoration(
      color: Colors.green[700],
    ),
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          height: 150,
          // color: ,
          child: DrawerHeader(
            child: GestureDetector(
                onTap: () => Navigator.of(context).pushNamed('/profile'),
                child: ListTile(
                  trailing: Icon(
                    Icons.chevron_right,
                    size: 28,
                  ),
                  subtitle: Text(
                    "See Profile",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: blackColor),
                  ),
                  title: Text(
                    user.name,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: blackColor),
                  ),
                  leading: CircleAvatar(
                    child: cacheImage(user.avatar),
                    radius: 25,
                    // backgroundImage: NetworkImage(user.avatar),
                    // backgroundImage: NetworkImage("https://img.icons8.com/color/48/000000/person-male.png"),
                  ),
                )),
            decoration: BoxDecoration(
              color: Colors.green[700],
            ),
          ),
        ),
        ListTile(
          leading: Icon(
            Feather.getIconData('home'),
            color: blackColor,
          ),
          title: Text(
            'Home',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w600, color: blackColor),
          ),
          onTap: () => Navigator.of(context).pushNamed('/home'),
        ),
        ListTile(
          leading: Icon(Feather.getIconData('search'), color: blackColor),
          title: Text('Search',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: blackColor)),
          onTap: () => Navigator.of(context).pushNamed('/search'),
        ),
        ListTile(
          trailing: Icon(
            Ionicons.getIconData('ios-radio-button-on'),
            color: Color(0xFFFB7C7A),
            size: 18,
          ),
          leading: Icon(Feather.getIconData('bell'), color: blackColor),
          title: Text('Notifications',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: blackColor)),
          onTap: () {
            //Nav.route(context,Checkout());
          },
        ),
        ListTile(
          trailing: ScopedModelDescendant<CartViewModel>(
            builder: (context, child, model) {
              return Container(
                child: Align(
                    alignment: Alignment.center,
                    widthFactor: 1,
                    // heightFactor:.5,
                    child: Text(
                      (model.cartListing.length > 0)
                          ? model.cartListing.length.toString()
                          : "",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFFFB7C7A),
                          fontWeight: FontWeight.w500),
                    )),
              );
            },
          ),
          leading:
              Icon(Feather.getIconData('shopping-cart'), color: blackColor),
          title: Text('Shopping Cart',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: blackColor)),
          onTap: () => Navigator.of(context).pushNamed('/cart'),
        ),
        ListTile(
          leading: Icon(Feather.getIconData('list'), color: blackColor),
          title: Text('My Orders',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: blackColor)),
          onTap: () {
            ////Nav.route(context, ProductList());
          },
        ),
        // ListTile(
        //   leading:
        //   Icon(Feather.getIconData('message-circle'), color: blackColor),
        //   title: Text('Support',
        //       style: TextStyle(
        //           fontSize: 16,
        //           fontWeight: FontWeight.w600,
        //           color: blackColor)),
        //   onTap: () {
        //     //Nav.route(context, ProductList());
        //   },
        // ),
        ListTile(
          leading: Icon(Feather.getIconData('help-circle'), color: blackColor),
          title: Text('Help',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: blackColor)),
          onTap: () {
            // Nav.route(context, UserSettings());
          },
        ),
        // ListTile(
        //   leading: Icon(Feather.getIconData('settings'), color: blackColor),
        //   title: Text('Settings',
        //       style: TextStyle(
        //           fontSize: 16,
        //           fontWeight: FontWeight.w600,
        //           color: blackColor)),
        //   onTap: () {
        //     // Navigator.push(
        //     //   context,
        //     //   PageTransition(
        //     //     type: PageTransitionType.fade,
        //     //     child: UserSettings(),
        //     //   ),
        //     // );
        //   },
        // ),
        ListTile(
          leading: Icon(Feather.getIconData('x-circle'), color: blackColor),
          title: Text('Quit',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: blackColor)),
          onTap: () {
            // SystemChannels.platform.invokeMethod('SystemNavigator.pop');
          },
        ),
      ],
    ),
  );
}

class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
            child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          alignment: Alignment.center,
          child: FlareActor(
            'assets/icon/loader.flr',
            alignment: Alignment.center,
            fit: BoxFit.contain,
            animation: 'load',
          ),
        )),
      );
}

typedef CouponInputBuilder = Widget Function(bool hasFocus, String char);

class CouponInput extends StatefulWidget {
  CouponInput._({
    Key key,
    @required this.length,
    @required this.focusNode,
    @required this.keyboardType,
    @required this.inputFormatters,
    @required this.builder,
    this.onChanged,
    this.onFilled,
  }) : super(key: key);

  factory CouponInput({
    Key key,
    @required int length,
    FocusNode focusNode,
    TextInputType keyboardType = TextInputType.text,
    List<TextInputFormatter> inputFormatters,
    @required CouponInputBuilder builder,
    void Function(String value) onChanged,
    void Function(String value) onFilled,
  }) {
    assert(length != null);
    assert(length > 0, 'The length needs to be larger than zero.');
    assert(length.isFinite, 'The length needs to be finite.');
    assert(keyboardType != null);
    assert(builder != null,
        'The builder is required for rendering the character segments.');

    return CouponInput._(
      key: key,
      length: length,
      focusNode: focusNode ?? FocusNode(),
      keyboardType: keyboardType,
      inputFormatters:
          inputFormatters ?? _createInputFormatters(length, keyboardType),
      builder: builder,
      onChanged: onChanged,
      onFilled: onFilled,
    );
  }

  final int length;

  final FocusNode focusNode;

  final TextInputType keyboardType;

  final List<TextInputFormatter> inputFormatters;

  final CouponInputBuilder builder;

  final void Function(String value) onChanged;

  final void Function(String value) onFilled;

  static List<TextInputFormatter> _createInputFormatters(
      int length, TextInputType keyboardType) {
    final formatters = <TextInputFormatter>[
      LengthLimitingTextInputFormatter(length)
    ];

    if (keyboardType == TextInputType.number) {
      formatters.add(WhitelistingTextInputFormatter(RegExp('^[0-9]*\$')));
    }

    return formatters;
  }

  @override
  _CouponInputState createState() => _CouponInputState();
}

class _CouponInputState extends State<CouponInput> {
  final controller = TextEditingController();

  String get text => controller.text;

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Container(
          width: 0.0,
          height: 0.0,
          child: EditableText(
            controller: controller,
            focusNode: widget.focusNode,
            inputFormatters: widget.inputFormatters,
            keyboardType: widget.keyboardType,
            backgroundCursorColor: Colors.black,
            style: TextStyle(),
            cursorColor: Colors.black,
            onChanged: (value) => setState(() {
              widget.onChanged?.call(value);
              if (value.length == widget.length) {
                widget.onFilled?.call(value);
              }
            }),
          )),
      GestureDetector(
          onTap: () {
            final focusScope = FocusScope.of(context);
            focusScope.requestFocus(FocusNode());
            Future.delayed(
              Duration.zero,
              () => focusScope.requestFocus(widget.focusNode),
            );
          },
          child: Container(
            color: Colors.transparent,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(widget.length, (i) {
                final hasFocus = controller.selection.start == i;
                final char = i < text.length ? text[i] : '';
                final characterEntity = widget.builder(hasFocus, char);

                assert(
                    characterEntity != null,
                    'The builder for the character entity at position $i '
                    'returned null. It did${hasFocus ? ' not' : ''} have the '
                    'focus and the character passed to it was \'$char\'.');

                return characterEntity;
              }),
            ),
          )),
    ]);
  }
}

abstract class CouponInputBuilders {
  static CouponInputBuilder containerized({
    Duration animationDuration = const Duration(milliseconds: 50),
    @required Size totalSize,
    @required Size emptySize,
    @required Size filledSize,
    @required BoxDecoration emptyDecoration,
    @required BoxDecoration filledDecoration,
    @required TextStyle emptyTextStyle,
    @required TextStyle filledTextStyle,
  }) {
    return (bool hasFocus, String char) => Container(
        width: totalSize.width,
        height: totalSize.height,
        alignment: Alignment.center,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 100),
          decoration: char.isEmpty ? emptyDecoration : filledDecoration,
          width: char.isEmpty ? emptySize.width : filledSize.width,
          height: char.isEmpty ? emptySize.height : filledSize.height,
          alignment: Alignment.center,
          child: Text(char,
              style: char.isEmpty ? emptyTextStyle : filledTextStyle),
        ));
  }

  static CouponInputBuilder circle(
      {double totalRadius = 30.0,
      double emptyRadius = 10.0,
      double filledRadius = 25.0,
      @required Border border,
      @required Color color,
      @required TextStyle textStyle}) {
    final decoration = BoxDecoration(
      shape: BoxShape.rectangle,
      border: border,
      color: color,
    );

    return containerized(
        totalSize: Size.fromRadius(totalRadius),
        emptySize: Size.fromRadius(emptyRadius),
        filledSize: Size.fromRadius(filledRadius),
        emptyDecoration: decoration,
        filledDecoration: decoration,
        emptyTextStyle: textStyle.copyWith(fontSize: 0.0),
        filledTextStyle: textStyle);
  }

  static CouponInputBuilder darkCircle({
    double totalRadius = 25.0,
    double emptyRadius = 20.0,
    double filledRadius = 20.0,
  }) {
    return circle(
      totalRadius: totalRadius,
      emptyRadius: emptyRadius,
      filledRadius: filledRadius,
      color: Colors.grey[350],
      textStyle: TextStyle(
          color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
      border: null,
    );
  }
}

typedef OTPInputBuilder = Widget Function(bool hasFocus, String char);

class OTPInput extends StatefulWidget {
  OTPInput._({
    Key key,
    @required this.length,
    @required this.focusNode,
    @required this.keyboardType,
    @required this.inputFormatters,
    @required this.builder,
    this.onChanged,
    this.onFilled,
  }) : super(key: key);

  factory OTPInput({
    Key key,
    @required int length,
    FocusNode focusNode,
    TextInputType keyboardType = TextInputType.text,
    List<TextInputFormatter> inputFormatters,
    @required OTPInputBuilder builder,
    void Function(String value) onChanged,
    void Function(String value) onFilled,
  }) {
    assert(length != null);
    assert(length > 0, 'The length needs to be larger than zero.');
    assert(length.isFinite, 'The length needs to be finite.');
    assert(keyboardType != null);
    assert(builder != null,
        'The builder is required for rendering the character segments.');

    return OTPInput._(
      key: key,
      length: length,
      focusNode: focusNode ?? FocusNode(),
      keyboardType: keyboardType,
      inputFormatters:
          inputFormatters ?? _createInputFormatters(length, keyboardType),
      builder: builder,
      onChanged: onChanged,
      onFilled: onFilled,
    );
  }

  final int length;

  final FocusNode focusNode;

  final TextInputType keyboardType;

  final List<TextInputFormatter> inputFormatters;

  final OTPInputBuilder builder;

  final void Function(String value) onChanged;

  final void Function(String value) onFilled;

  static List<TextInputFormatter> _createInputFormatters(
      int length, TextInputType keyboardType) {
    final formatters = <TextInputFormatter>[
      LengthLimitingTextInputFormatter(length)
    ];

    if (keyboardType == TextInputType.number) {
      formatters.add(WhitelistingTextInputFormatter(RegExp('^[0-9]*\$')));
    }

    return formatters;
  }

  @override
  _OTPInputState createState() => _OTPInputState();
}

class _OTPInputState extends State<OTPInput> {
  final controller = TextEditingController();

  String get text => controller.text;

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Container(
          width: 0.0,
          height: 0.0,
          child: EditableText(
            controller: controller,
            focusNode: widget.focusNode,
            inputFormatters: widget.inputFormatters,
            keyboardType: widget.keyboardType,
            backgroundCursorColor: Colors.black,
            style: TextStyle(),
            cursorColor: Colors.black,
            onChanged: (value) => setState(() {
              widget.onChanged?.call(value);
              if (value.length == widget.length) {
                widget.onFilled?.call(value);
              }
            }),
          )),
      GestureDetector(
          onTap: () {
            final focusScope = FocusScope.of(context);
            focusScope.requestFocus(FocusNode());
            Future.delayed(
              Duration.zero,
              () => focusScope.requestFocus(widget.focusNode),
            );
          },
          child: Container(
            color: Colors.transparent,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(widget.length, (i) {
                final hasFocus = controller.selection.start == i;
                final char = i < text.length ? text[i] : '';
                final characterEntity = widget.builder(hasFocus, char);

                assert(
                    characterEntity != null,
                    'The builder for the character entity at position $i '
                    'returned null. It did${hasFocus ? ' not' : ''} have the '
                    'focus and the character passed to it was \'$char\'.');

                return characterEntity;
              }),
            ),
          )),
    ]);
  }
}

abstract class OTPInputBuilders {
  static OTPInputBuilder containerized({
    Duration animationDuration = const Duration(milliseconds: 50),
    @required Size totalSize,
    @required Size emptySize,
    @required Size filledSize,
    @required BoxDecoration emptyDecoration,
    @required BoxDecoration filledDecoration,
    @required TextStyle emptyTextStyle,
    @required TextStyle filledTextStyle,
  }) {
    return (bool hasFocus, String char) => Container(
        width: totalSize.width,
        height: totalSize.height,
        alignment: Alignment.center,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 100),
          decoration: char.isEmpty ? emptyDecoration : filledDecoration,
          width: char.isEmpty ? emptySize.width : filledSize.width,
          height: char.isEmpty ? emptySize.height : filledSize.height,
          alignment: Alignment.center,
          child: Text(char,
              style: char.isEmpty ? emptyTextStyle : filledTextStyle),
        ));
  }

  static OTPInputBuilder circle(
      {double totalRadius = 30.0,
      double emptyRadius = 10.0,
      double filledRadius = 25.0,
      @required Border border,
      @required Color color,
      @required TextStyle textStyle}) {
    final decoration = BoxDecoration(
      shape: BoxShape.circle,
      border: border,
      color: color,
    );

    return containerized(
        totalSize: Size.fromRadius(totalRadius),
        emptySize: Size.fromRadius(emptyRadius),
        filledSize: Size.fromRadius(filledRadius),
        emptyDecoration: decoration,
        filledDecoration: decoration,
        emptyTextStyle: textStyle.copyWith(fontSize: 0.0),
        filledTextStyle: textStyle);
  }

  static OTPInputBuilder darkCircle({
    double totalRadius = 35.0,
    double emptyRadius = 25.0,
    double filledRadius = 30.0,
  }) {
    return circle(
      totalRadius: totalRadius,
      emptyRadius: emptyRadius,
      filledRadius: filledRadius,
      color: Color(0xFFF93963),
      textStyle: TextStyle(
          color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
      border: null,
    );
  }
}

