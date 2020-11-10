part of 'register.dart';

class Register_Page extends StatefulWidget {
  @override
  Register_PageState createState() => Register_PageState();
}

class Register_PageState extends State<Register_Page> {
  String _name;
  String _phone;
  String _email;
  String _password;
  ProgressDialog progressDialog;


  final GlobalKey<FormState> _globalKey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    progressDialog = new ProgressDialog(context, ProgressDialogType.Normal);
    progressDialog.setMessage('Creating Account...');
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      //appBar: authAppBar(context, ''),
      body: ListView(scrollDirection: Axis.vertical, children: <Widget>[
        Form(
          key: _globalKey,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                signUpLabel(),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25.0, 0, 25.0, 0),
                  child: nameField(),
                ),
                SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25.0, 0, 25.0, 0),
                  child: emailField(),
                ),
                SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25.0, 0, 25.0, 0),
                  child: phoneField(),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25.0, 0, 25.0, 0),
                  child: passwordField(),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25.0, 0, 25.0, 0),
                  child: confirmPasswordField(),
                ),
                SizedBox(
                  height: 40.0,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(35.0, 0, 35.0, 0),
                  child: registerBtn(context),
                ),
                SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: oldUser(Constant.oldUserlabel,context),
                )
              ]),
        ),
      ]),
    );
  }

  phoneField() {
    return TextFormField(
      validator: (val) => validatePhoneField(val),
      onSaved: (String val) {
        _phone = val;
      },
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.phone, color: Constant.getColor("1b4332")),
        labelText: Constant.phonePlaceholder,
        labelStyle: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Constant.getColor("1b4332"))),
        //errorText: snapshot.error,
      ),
      onChanged: (val) => setState(() => _phone = val),

      // onChanged: bloc.changeUserPhone
    );
  }

  nameField() {
    return TextFormField(
      validator: (val) => validateNameField(val),
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person, color: Constant.getColor("1b4332")),
        labelText: Constant.namePlaceholder,
        labelStyle: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Constant.getColor("1b4332"))),
        // errorText: snapshot.error,
      ),
      onSaved: (String val) {
        _name = val;
      },
      onChanged: (val) => setState(() => _name = val),

      //onChanged: bloc.changeUserName
    );
  }

  emailField() {
    return TextFormField(
      validator: (val) => validateEmailField(val),
      onSaved: (String val) {
        _email = val;
      },
      onChanged: (val) => setState(() => _email = val),

      decoration: InputDecoration(
        prefixIcon: Icon(Icons.email, color: Constant.getColor("1b4332")),
        labelText: Constant.emailPlaceholder,
        labelStyle: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Constant.getColor("1b4332"))),
        //errorText: snapshot.error,
      ),
      //onChanged: bloc.changeUserEmail,
    );
  }

  passwordField() {
    return TextFormField(
      validator: (val) => validatePasswordField(val),
      onSaved: (String val) {
        _password = val;
      },
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock, color: Constant.getColor("1b4332")),
        labelText: Constant.passwordPlaceholder,
        labelStyle: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Constant.getColor("1b4332"))),
        //errorText: snapshot.error,
      ),
      obscureText: true,
      onChanged: (val) => setState(() => _password = val),

      //onChanged: bloc.changeUserPassword
    );
  }
  
  confirmPasswordField() {
    return TextFormField(
      validator: (val){
        if (val == null || val.isEmpty || val.length < 7) {
     return "Invalid Password";
   } else if(val != _password){
     return "Password and confirm password mismatched";
   } else {
     return null;
   }
      },
      onSaved: (String val) {
        _password = val;
      },
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock, color: Constant.getColor("1b4332")),
        labelText: Constant.confirmPasswordPlaceholder,
        labelStyle: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Constant.getColor("1b4332"))),
        //errorText: snapshot.error,
      ),
      obscureText: true,
      // onChanged: (val) => setState(() => _password = val),

      //onChanged: bloc.changeUserPassword
    );
  }

  Widget registerBtn(context) {
    return ScopedModelDescendant<AuthViewModel>(
        builder: (context, child, authViewModel) {
      return Container(
          height: 55.0,
          child: RaisedButton(
            color: Constant.getColor("1b4332"),
            elevation: 20.0,
            highlightElevation: 20.0,
            focusElevation: 20.0,
            onPressed: () => formState()
                ? register()
                : null,
            child: Container(
                child: Text(
              Constant.registerBtn,
              style: TextStyle(
                //height:2.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat',
                fontSize: 20,
              ),
            )),
          ));
    });
  }

  bool formState() {
    if (!_globalKey.currentState.validate())
      return false;
    else
      return true;
  }

  register() async {
    progressDialog.show();
    var result = await locator<AuthViewModel>().registerUser(_name, _phone, _email, _password);
      if (result['status']) {
        progressDialog.hide();
        Navigator.of(context).pushNamed('/home',);
        ToastOn(
                   "Hurray!!!,Your Account Has Been Created Successfully",
                    Colors.greenAccent[400],
                    Colors.white,
                    18.0);
      } else {
        progressDialog.hide();
        ToastOn(
                   result['message'] ,
                    Colors.red[900],
                    Colors.white,
                    18.0);
      }
  }
}
