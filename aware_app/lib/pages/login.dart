import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './homepage.dart';

class loginPage extends StatefulWidget {
  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final _email = new TextEditingController();
  final _pass = new TextEditingController();

  String _message = '';

  Future _loginCheck(String email, String Pass) async {
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

  Widget _emailField() {
    return TextFormField(
      decoration: InputDecoration(
          // labelText: "Email",
          border: InputBorder.none,
          fillColor: Colors.lightBlue[50],
          filled: true),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Email required';
        }
        return null;
      },
      controller: _email,
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

  Widget _emailPasswordWidget() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Email",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          _emailField(),
          SizedBox(
            height: 20,
          ),
          Text(
            "Password",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
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
            var resp = await _loginCheck(_email.text, _pass.text);
            if (resp == 1) {
              setState(() {
                _message = "SUCCESS";
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
                    _emailPasswordWidget(),
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
