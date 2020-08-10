part of 'chef.dart';

class ChefsPage extends StatefulWidget {
  @override
  _ChefsPageState createState() => _ChefsPageState();
}

class _ChefsPageState extends State<ChefsPage> {
  AccountViewModel account = locator<AccountViewModel>();
  ChefViewModel chef = locator<ChefViewModel>();
  ProgressDialog progressDialog;
  String _state;
  String _lga;
  String _food;
  var items = List<Chef>();

  @override
  void initState() {
    //locator<ChefViewModel>().fetchChef();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    progressDialog = new ProgressDialog(context, ProgressDialogType.Normal);
    progressDialog.setMessage('Search...');

    return ScopedModelDescendant<ChefViewModel>(
        builder: (context, child, model) {
      return Scaffold(
        resizeToAvoidBottomPadding: false,
        body:  SingleChildScrollView(
                  child: Container(
            padding: const EdgeInsets.all(10.0),
           // height: size.height ,
            child: Card(
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        Constant.chefHeader,
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: "Wavehaus",
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: widgetRow(),
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: UnderlineInputBorder(
                             // borderRadius:BorderRadius.all(Radius.circular(25.0)),
                              borderSide: BorderSide(color: Constant.getColor("1b4332"))),
                          suffixIcon:
                              Icon(Icons.search, color: Constant.getColor("2d6a4f")),
                          labelText: Constant.searchChefPlaceholder,
                          labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                          focusedBorder: UnderlineInputBorder(
                              //borderRadius: BorderRadius.all(Radius.circular(25.0)),
                              borderSide: BorderSide(color: Constant.getColor("1b4332")))),
                      onChanged: (val) => setState(() => _food = val),
                    ),
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                        width: 350,
                        height: 55.0,
                        child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            shadowColor: Constant.getColor("2d6a4f"),
                            color: Constant.getColor("2d6a4f"),
                            elevation: 2.0,
                            child: RaisedButton(
                              color: (_state == null ||
                                      _state.isEmpty ||
                                      _lga.isEmpty ||
                                      _lga == null ||
                                      _food == null ||
                                      _food.isEmpty)
                                  ? Constant.getColor("74c69d")
                                  : Constant.getColor("081c15"),
                              onPressed: () => (_state == null ||
                                      _state.isEmpty ||
                                      _lga.isEmpty ||
                                      _lga == null ||
                                      _food == null ||
                                      _food.isEmpty)
                                  ? null
                                  : handleSearch(context),
                              child: Text(
                                Constant.searchChefLabel,
                                style: TextStyle(
                                  //height:2.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat',
                                  fontSize: 15,
                                ),
                              ),
                            ))),
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                        width: 300,
                        height: 55.0,
                        child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            shadowColor: Constant.getColor("2d6a4f"),
                            color: Constant.getColor("2d6a4f"),
                            elevation: 2.0,
                            child: RaisedButton(
                              color:Constant.getColor("2d6a4f"),
                              onPressed: () => Navigator.of(context).pushNamed('/search/chef/nickname'),
                              child: Text(
                                Constant.searchChefNickNameLabel2,
                                style: TextStyle(
                                  //height:2.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat',
                                  fontSize: 15,
                                ),
                              ),
                            ))),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  widgetRow() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          stateDropdown(),
          SizedBox(
            height: 10.0,
          ),
          lgaDropdown()
        ],
      ),
    );
  }

  stateDropdown() {
    //print("money format :- ${formatMoney(500)}");
    List<String> _states = ['Lagos', 'Abuja']; // Option 2
    return Container(
      child: DropdownButton(
        isExpanded: true,
        icon: Icon(
          Icons.location_on,
          color: Constant.getColor("2d6a4f"),
        ),
        hint: Text('Please choose your state'), // Not necessary for Option 1
        value: _state,
        onChanged: (newValue) {
          setState(() {
            _state = newValue;
            if (_state == 'Lagos') {
              _lga = 'Ikeja';
            } else {
              _lga = 'Wuse';
            }
          });
        },
        items: _states.map((state) {
          return DropdownMenuItem(
            child: new Text(state,
                style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w600,
                    color: Constant.getColor("2d6a4f"))),
            value: state,
          );
        }).toList(),
      ),
    );
  }

  lgaDropdown() {
    return Container(
      child: DropdownButton(
        isExpanded: true,
        icon: Icon(
          Icons.location_on,
          color: Constant.getColor("2d6a4f"),
        ),
        hint: Text('Please choose your L.G.A'),
        // Not necessary for Option 1
        value: _lga,
        onChanged: (newValue) {
          setState(() {
            _lga = newValue;
          });
        },
        items: lgaSwitching(_state),
      ),
    );
  }

  List<DropdownMenuItem<String>> lgaSwitching(String state) {
    // print("state ==> $state");
    List<String> _lagosLga = ['Ikeja', 'Surulere'];
    List<String> _abujaLga = ['Wuse', 'Gwagwalada'];

    if (_state == 'Lagos') {
      return _lagosLga.map((lga) {
        // setState(() {
        //   _lga = 'Ikeja';
        // });
        return DropdownMenuItem(
          child: new Text(lga,
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                  color: Constant.getColor("2d6a4f"))),
          value: lga,
        );
      }).toList();
    } else if (_state == 'Abuja') {
      return _abujaLga.map((lga) {
        return DropdownMenuItem(
          child: new Text(lga,
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                  color: Constant.getColor("2d6a4f"))),
          value: lga,
        );
      }).toList();
    }
  }

  handleSearch(BuildContext context) async {
    progressDialog.show();
    var result =
        await chef.searchChef(_state, _lga, _food, account.profile.token);
    if (result['status']) {
      List profiles = result['data'];
      List<Chef> chefs = profiles.map((data) => Chef.fromJson(data)).toList();
      print("user chef searched response ==> $chefs");
      progressDialog.hide();
      Navigator.of(context).pushNamed('/avaliable/chefs', arguments: chefs);
    } else {
      progressDialog.hide();
      ToastOn(result['message'], Colors.red[700], Colors.white, 20.0);
    }
  }
}
