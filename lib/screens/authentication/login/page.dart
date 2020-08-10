part of 'login.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  ProgressDialog progressDialog;
  String _email;
  String _password;

  final GlobalKey<FormState> _globalKey = new GlobalKey<FormState>();

  @override
  void initState() {
    progressDialog = new ProgressDialog(context, ProgressDialogType.Normal);
    progressDialog.setMessage('Logging in...');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Form(
            key: _globalKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  loginHeader(),
                  Container(
                    padding: EdgeInsets.only(top: 35, left: 20.0, right: 20.0),
                    child: Column(
                      children: <Widget>[
                        emailField(),
                        SizedBox(height: 20.0),
                        passwordField(),
                        SizedBox(
                          height: 10.0,
                        ),
                        forgotBtn(context),
                        SizedBox(
                          height: 40.0,
                        ),
                        loginBtn(context),
                        // SizedBox(
                        //   height: 20.0,
                        // ),
                        // loginUsePhone(context),
                        SizedBox(
                          height: 20.0,
                        ),
                        registerLink(context)
                      ],
                    ),
                  ),
                ]),
          )
        ],
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      validator: (val) => validateEmailField(val),
      onSaved: (String val) {
        _email = val;
      },
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

  Widget passwordField() {
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
      //onChanged: bloc.changeUserPassword
    );
  }

  Widget loginBtn(context) {
    return ScopedModelDescendant<AuthViewModel>(
        builder: (context, child, authViewModel) {
      return Container(
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
                          Constant.loginBtn,
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
                            Icons.shopping_basket,
                            color: Colors.white,
                            size: 20.0,
                          ),
                        ),
                      ]),
                  onPressed: () {
                    if (!_globalKey.currentState.validate()) {
                      return;
                    } else {
                      _globalKey.currentState.save();
                      progressDialog.show();
                      authViewModel
                          .loginUser(_email, _password)
                          .then((result) {
                        if (result['status']) {
                          progressDialog.hide();
                          Navigator.of(context).pushNamed('/home',arguments:result['user']);
                        } else {
                          progressDialog.hide();
                          Navigator.of(context).pushNamed('/login');
                          ToastOn("Invalid email or password.", Colors.redAccent, Colors.white, 20.0);
                        }
                      });
                    }
                  })));
    });
  }
}
