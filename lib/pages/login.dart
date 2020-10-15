import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './homepage.dart';

class loginPage extends StatefulWidget {
  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final _userid = new TextEditingController();
  final _pass = new TextEditingController();

  String _message = '';

  Future _loginCheck(String userid, String Pass) async {
    var url = '';
    // var response = await http.post(
    //   url,
    //   headers: <String, String>{
    //     'Content-Type': 'application/json; charset=UTF-8'
    //   },
    // );
    var response = 200;
    if (response == 200) {
      return 1;
    } else {
      return null;
    }
  }

  Widget _title() {
    return Container(
      child: Center(
        child: Container(
          width: 250,
          height: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(15.0, 60.0, 0.0, 0.0),
                child: Text(
                  'Aware',
                  style: TextStyle(
                      color: Colors.green[700],
                      fontFamily: 'Montserrat',
                      fontSize: 60.0,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _useridField() {
    return TextFormField(
      decoration: InputDecoration(
          // labelText: "Email",
          border: InputBorder.none,
          fillColor: Colors.lightBlue[50],
          filled: true),
      validator: (String value) {
        if (value.isEmpty) {
          return 'User Id required';
        }
        return null;
      },
      controller: _userid,
    );
  }

  Widget _passwordField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        // labelText: "Password",
        border: InputBorder.none,
        fillColor: Colors.lightBlue[50],
        filled: true,
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Password required';
        }
        return null;
      },
      controller: _pass,
    );
  }

  Widget _useridPasswordWidget() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "User Id",
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          _useridField(),
          SizedBox(
            height: 20,
          ),
          Text(
            "Password",
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          _passwordField(),
        ],
      ),
    );
  }

  Widget _submitButton() {
    return ButtonTheme(
      minWidth: 200.0,
      height: 60.0,
      child: new RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(23.0),
        ),
        child: Text(
          'Sign In',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        color: Colors.green,
        onPressed: () async {
          if (!_formkey.currentState.validate()) {
            return;
          } else {
            setState(() {
              _message = 'Loading....';
            });
            var resp = await _loginCheck(_userid.text, _pass.text);
            if (resp == 1) {
              setState(() {
                _message = "Login Success";
              });
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Menu();
              }));
            } else {
              setState(() {
                _message = 'Login failed.';
              });
            }
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
      height: height,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Form(
                key: _formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(height: height * .05),
                    _title(),
                    SizedBox(height: 20),
                    _useridPasswordWidget(),
                    SizedBox(height: 40),
                    _submitButton(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
