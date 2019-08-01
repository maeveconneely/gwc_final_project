import 'package:conserve/quiz.dart';
import 'package:flutter/material.dart';
import 'footprint.dart';

class Home extends StatefulWidget {
  int score;

  Home(this.score);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int score;

   @override
  void initState() {
    score = widget.score;

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Footprint",
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.green,
      ),
      body: Text("Total:",), //gonna call footprint.dart here
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text("CO2NSERVE"),
              decoration: BoxDecoration(
                color: Colors.green,
              ),
            ),
            FlatButton(
                color: Colors.green,
                textColor: Colors.white,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                padding: EdgeInsets.all(8.0),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "My Footprint",
                  textAlign: TextAlign.center,
                )),
            FlatButton(
                color: Colors.green,
                textColor: Colors.white,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                padding: EdgeInsets.all(8.0),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Quiz(score)),
                  );
                },
                child: Text(
                  "Calculator",
                )),
            FlatButton(
                color: Colors.green,
                textColor: Colors.white,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                padding: EdgeInsets.all(8.0),
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   // MaterialPageRoute(builder: (context) => ThirdRoute()),
                  // );
                },
                child: Text(
                  "Resources",
                )),
            ListTile(
                title: Text("Close"),
                trailing: Icon(Icons.close),
                onTap: () {
                  Navigator.pop(context);
                }),
          ],
        ),
      ),
    );
  }
}