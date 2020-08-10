part of 'searched_chefs.dart';

class ChefPage extends StatefulWidget {

  const ChefPage({Key key, this.chefs}) : super(key: key);
  final List<Chef> chefs;

  @override
  _ChefsPageState createState() => _ChefsPageState();
}

class _ChefsPageState extends State<ChefPage> {
  AccountViewModel account = locator<AccountViewModel>();
  ChefViewModel chef = locator<ChefViewModel>();
  String _state;
  String _lga;
  String _food;
 
  @override
  void initState() {
    //locator<ChefViewModel>().fetchChef();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ChefViewModel>(
        builder: (context, child, model) {
      return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar:pageAppBar(context, Constant.chefs),
        body: widget.chefs.isEmpty ? 
        Container(
          padding: EdgeInsets.all(15.0),
          alignment:Alignment.center,
          child:
          Text(
          Constant.noChefFound,
          style:TextStyle(fontSize:20,color: Colors.grey),),
          )
        : chefTable(context, widget.chefs,filterSearchResults)
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
          color: Colors.green[900],
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
                    color: Colors.green[900])),
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
          color: Colors.green[900],
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
                  color: Colors.green[900])),
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
                  color: Colors.green[900])),
          value: lga,
        );
      }).toList();
    }
  }

  void filterSearchResults(String query) {
    List<Chef> chefSearchList = widget.chefs;
    if (query.isNotEmpty) {
      List<Chef> searchedListData = List<Chef>();

      chefSearchList.forEach((item) {
        if (item.experience.toLowerCase().contains(query) ||
            item.nickname.toLowerCase().contains(query) || 
            item.dish.toLowerCase().contains(query)
            ) {
          searchedListData.clear();
          searchedListData.add(item);
        }
      });
      setState(() {
        widget.chefs.clear();
        widget.chefs.addAll(searchedListData);
      });
      return;
    } else {
      setState(() {
        widget.chefs.clear();
        widget.chefs.addAll(widget.chefs);
      });
    }
  }

}
