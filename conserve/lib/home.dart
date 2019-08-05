import 'package:conserve/quiz.dart';
import 'package:conserve/resources.dart';
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
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "My Footprint",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        //backgroundColor: Colors.green,
      ),
      body: Footprint(), //gonna call footprint.dart here
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Image.asset('images/conserv.png'),
              decoration: BoxDecoration(
                color: Colors.cyan,
              ),
            ),
            FlatButton(
                color: Colors.cyan,
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
                color: Colors.cyan,
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
                color: Colors.cyan,
                textColor: Colors.white,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                padding: EdgeInsets.all(8.0),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Resources()),
                  );
                },
                child: Text(
                  "Resources",
                )),
            FlatButton(
                child: Text("Close"),
                color: Colors.cyan,
                textColor: Colors.white,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                padding: EdgeInsets.all(8.0),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ],
        ),
      ),
    );
  }
}
