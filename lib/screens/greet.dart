import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class GreetApp extends StatefulWidget {
  _GreetAppState createState() => new _GreetAppState();
}

class _GreetAppState extends State<GreetApp> {
  String name, age, name_age, add_name_age;
  bool nameage = false;
  TextEditingController _controller_name = new TextEditingController();
  TextEditingController _controller_age = new TextEditingController();
  String _capitalize(String n) {
    return n[0].toUpperCase() + n.substring(1).toLowerCase();
  }

  _show() {
    setState(() {
      name_age = _capitalize(name) + " " + age;
      nameage = true;
    });
  }

  _hide() {
    setState(() {
      nameage = false;
      _controller_name.clear();
      _controller_age.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
          title: Text("Name_Age", style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.lightBlueAccent,
          centerTitle: true),
      body: new SingleChildScrollView(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Container(
              padding: EdgeInsets.all(15),
              child: TextField(
                controller: _controller_name,
                style: TextStyle(
                    fontStyle: FontStyle.normal,
                    color: Colors.black,
                    fontSize: 30),
                onChanged: (name_get) {
                  name = name_get;
                },
                decoration: new InputDecoration(
                    labelText: "Enter your name",
                    hintText: "Your name here",
                    hintStyle: TextStyle(fontSize: 12),
                    helperText: "Enter name",
                    prefixIcon: Icon(Icons.account_circle,
                        size: 20, color: Colors.black),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () => _controller_name.clear(),
                      iconSize: 20,
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4))),
              ),
            ),
            new Container(
              padding: EdgeInsets.all(15),
              child: TextField(
                controller: _controller_age,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  WhitelistingTextInputFormatter.digitsOnly
                ], // Only numbers can be entered
                style: TextStyle(
                    fontStyle: FontStyle.normal,
                    color: Colors.black,
                    fontSize: 30),
                onChanged: (age_get) {
                  age = age_get;
                },
                decoration: new InputDecoration(
                    labelText: "Enter your age",
                    hintText: "Your age here",
                    hintStyle: TextStyle(fontSize: 12),
                    helperText: "Enter age",
                    prefixIcon: Icon(Icons.calendar_today,
                        size: 20, color: Colors.black),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () => _controller_age.clear(),
                      iconSize: 20,
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4))),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: _show,
                  color: Colors.white,
                  child: new Text(
                    "Submit",
                    style: TextStyle(color: Colors.black, fontSize: 30),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                RaisedButton(
                  onPressed: _hide,
                  color: Colors.white,
                  child: new Text(
                    "Clear",
                    style: TextStyle(color: Colors.black, fontSize: 30),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              nameage ? "${name_age}" : "Enter name and age",
              style: TextStyle(fontSize: 30),
            )
          ],
        ),
      ),
    );
  }
}
