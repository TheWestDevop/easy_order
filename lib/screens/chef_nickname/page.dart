part of 'nickname.dart';

class SearchChefsPage extends StatefulWidget {
  @override
  _SearchChefsPageState createState() => _SearchChefsPageState();
}

class _SearchChefsPageState extends State<SearchChefsPage> {
  AccountViewModel account = locator<AccountViewModel>();
  ChefViewModel chef = locator<ChefViewModel>();
  ProgressDialog progressDialog;
  String _nickname;
  var items = List<Chef>();

  @override
  void initState() {
    //locator<ChefViewModel>().fetchChef();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    progressDialog = new ProgressDialog(context, ProgressDialogType.Normal);
    progressDialog.setMessage('Search...');

    return ScopedModelDescendant<ChefViewModel>(
        builder: (context, child, model) {
      return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar:pageAppBar(context,Constant.searchChefNickNameLabel),
        body:  SingleChildScrollView(
                  child: Container(
            padding: const EdgeInsets.all(10.0),
            height: size.height / 2,
            child: Card(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: UnderlineInputBorder(
                              // borderRadius:  BorderRadius.all(Radius.circular(25.0)
                              borderSide: BorderSide(color: Constant.getColor("1b4332"))),
                          suffixIcon:
                              Icon(Icons.search, color: Colors.green[700]),
                          labelText: Constant.searchChefNicknamePlaceholder,
                          labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                          focusedBorder: UnderlineInputBorder(
                              //borderRadius:BorderRadius.all(Radius.circular(25.0)),
                              borderSide: BorderSide(color: Constant.getColor("1b4332")))),
                      onChanged: (val) => setState(() => _nickname = val),
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
                              color: (_nickname == null ||
                                      _nickname.isEmpty )
                                  ? Constant.getColor("74c69d")
                                  : Constant.getColor("081c15"),
                              onPressed: () => (_nickname == null ||
                                      _nickname.isEmpty)
                                  ? null
                                  : handleSearch(context),
                              child: Text(
                                Constant.searchChefNickName,
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



  
  handleSearch(BuildContext context) async {
    progressDialog.show();
    var result = await chef.searchChefNickname(_nickname , account.profile.token);
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
