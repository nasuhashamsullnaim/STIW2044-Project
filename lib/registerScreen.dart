import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';
import 'package:http/http.dart' as http;
import 'loginScreen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _emcontroller = TextEditingController();
  final TextEditingController _pscontroller = TextEditingController();
  final TextEditingController _phcontroller = TextEditingController();

  String _email = "";
  String _password = "";
  String _name = "";
  String _phone = "";
  bool _passwordVisible = false;
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Account'),
      ),
      body: Container(
        child: Padding(
            padding: EdgeInsets.fromLTRB(20, 5, 20, 10),
            child: SingleChildScrollView(
                child: Column(children: [
              Image.asset(
                'assets/images/DeafZoneLogo.png',
                scale: 2,
              ),
              Card(
                  elevation: 1,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                    child: Column(
                      children: [
                        TextField(
                            controller: _namecontroller,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                                labelText: 'Name', icon: Icon(Icons.person))),
                        TextField(
                            controller: _emcontroller,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                labelText: 'Email', icon: Icon(Icons.email))),
                        TextField(
                            controller: _phcontroller,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                                labelText: 'Mobile', icon: Icon(Icons.phone))),
                        TextField(
                          controller: _pscontroller,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            icon: Icon(Icons.lock),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Theme.of(context).primaryColorDark,
                              ),
                              onPressed: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                            ),
                          ),
                          obscureText: _passwordVisible,
                        ),
                        SizedBox(height: 1),
                        Row(
                          children: <Widget>[
                            Checkbox(
                              value: _rememberMe,
                              onChanged: (bool value) {
                                _onChange(value);
                              },
                            ),
                            Text('Remember Me', style: TextStyle(fontSize: 16))
                          ],
                        ),
                        SizedBox(height: 1),
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0)),
                          minWidth: 400,
                          height: 40,
                          child: Text('Register'),
                          color: Colors.teal[600],
                          textColor: Colors.white,
                          elevation: 7,
                          onPressed: _onRegister,
                        ),
                        SizedBox(height: 5),
                        GestureDetector(
                          onTap: _onLogin,
                          child: Text('Already Register? Sign In Here!',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.blue[900])),
                        )
                      ],
                    ),
                  ))
            ]))),
      ),
    );
  }

  void _onRegister() async {
    _name = _namecontroller.text;
    _email = _emcontroller.text;
    _password = _pscontroller.text;
    _phone = _phcontroller.text;
    if (_name.isEmpty ||
        _email.isEmpty ||
        _password.isEmpty ||
        _phone.isEmpty) {
      Toast.show(
        "Please check your input",
        context,
        duration: Toast.LENGTH_LONG,
        gravity: Toast.TOP,
      );
      return;
    }
    if (!validateEmail(_email) && !validatePassword(_password)) {
      Toast.show(
        "Check your email/password",
        context,
        duration: Toast.LENGTH_LONG,
        gravity: Toast.TOP,
      );
      return;
    }
    ProgressDialog pr = new ProgressDialog(context,
        type: ProgressDialogType.Normal, isDismissible: false);
    pr.style(message: "Registration...");
    await pr.show();
    http.post("https://itsmelele.com/DeafZone3/php/registerUser.php", body: {
      "name": _name,
      "email": _email,
      "password": _password,
      "phone": _phone,
    }).then((res) {
      print(res.body);
      if (res.body == "success") {
        Toast.show(
          "Registration success using an email $_email. Please login using this email and password",
          context,
          duration: Toast.LENGTH_LONG,
          gravity: Toast.TOP,
        );
        if (_rememberMe) {
          savepref();
        }
        _onLogin();
      } else {
        Toast.show(
          "Sorry, registration failed!",
          context,
          duration: Toast.LENGTH_LONG,
          gravity: Toast.TOP,
        );
      }
    }).catchError((err) {
      print(err);
    });
    await pr.hide();
  }

  void _onLogin() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => LoginScreen()));
  }

  void _onChange(bool value) {
    setState(() {
      _rememberMe = value;
    });
  }

  void savepref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _email = _emcontroller.text;
    _password = _pscontroller.text;
    await prefs.setString('email', _email);
    await prefs.setString('password', _password);
    await prefs.setBool('rememberme', true);
  }

  bool validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    return (!regex.hasMatch(value)) ? false : true;
  }

  bool validatePassword(String value) {
    String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }
}
