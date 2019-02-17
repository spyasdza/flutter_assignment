import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  String user_id, user_pass;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Login")
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20.0),
          children: <Widget>[
            Image.asset(
              "resources/Caterpie.png",
              height: 100,
            ),
            TextFormField(
                decoration: InputDecoration(
                  labelText: "ID",
                  hintText: "User Id",
                  icon: Icon(Icons.person),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (id) {
                  if (id.isEmpty) {
                    user_id = "";
                    return "กรุณาระบุ user or password";
                  } else {
                    user_id = id;
                  }
                }),
            TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "Password",
                  icon: Icon(Icons.lock),
                ),
                keyboardType: TextInputType.text,
                validator: (pass) {
                  if (pass.isEmpty) {
                    user_pass = "";
                    return "กรุณาระบุ user or password";
                  } else {
                    user_pass = pass;
                  }
                }),
            RaisedButton(
              child: Text("Login"),
              color: Colors.green[50],
              onPressed: () {
                _formKey.currentState.validate();
                if (user_id == "admin" && user_pass == "admin") {
                  Navigator.pushNamed(context, "/second");
                } else if (user_id == "" || user_pass == "") {
                  _ackAlert2(context);
                } else {
                  _ackAlert1(context);
                }
              },
            ),
            Container(
              alignment: FractionalOffset.bottomRight,
              child: FlatButton(
                child: Text(
                  "Register New Account",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.green),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, "/third");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _ackAlert1(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: const Text('User or Password ไม่ถูกต้อง'),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _ackAlert2(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: const Text('กรุณาระบุ user or password'),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
