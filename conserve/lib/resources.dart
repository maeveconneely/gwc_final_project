import 'package:conserve/model/score.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'data/database_helper.dart'; //needed to launch the urls

_resetData() async {
  var dbHelper = DatabaseHelper.instance;
  List<String> all = [
    'Car',
    'Bus',
    'Plane',
    'Beef/Lamb',
    'Pork',
    'Poultry',
    'Cheese',
    'Milk',
    'Eggs',
    'Rice',
    'Bread/Cereals',
    'Legumes',
    'Vegetables',
    'Fruit',
    'Carrots',
    'Potatoes',
    'Smartphone',
    'Tablet',
    'Shower',
    'Bathroom',
    'Water Bottles'
  ];

  for (int i = 0; i < 22; i++) {
    Score row = Score(columnId: i, columnName: all[i], columnScore: 0);
    await dbHelper.insertScore(row).then((value) {
      }).catchError((onError) {
        dbHelper.updateScore(row);
      });
  }
}

_launchURL() async {
  const url =
      'https://www.scu.edu/environmental-ethics/carbon-footprint-calculator/create_calc/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURLtwo() async {
  const url = 'https://www.greenpeace.org/usa/global-warming/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURLthree() async {
  const url = 'http://www.globalstewards.org/reduce-carbon-footprint.htm';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURLfour() async {
  const url = 'https://www.nrdc.org/stories/how-you-can-stop-global-warming';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURLfive() async {
  const url = 'https://www.wikihow.com/Reduce-Your-Carbon-Footprint-at-Home';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURLsix() async {
  const url =
      'https://www.nationalgeographic.com/environment/global-warming/global-warming-overview/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURLseven() async {
  const url = 'https://mashable.com/2013/10/22/reduce-carbon-footprint/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURLeight() async {
  const url =
      'https://www.nasa.gov/topics/earth/features/climate_by_any_other_name.html';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURLnine() async {
  const url =
      'https://www.climate.gov/news-features/climate-qa/whats-difference-between-global-warming-and-climate-change';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURLten() async {
  const url =
      'https://www.scu.edu/media/ethics-center/environmental-ethics/carbon-footprint/Math_and_Methodologies_Behind_This_Calculator.pdf';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURLeleven() async {
  const url =
      'https://www.treehugger.com/green-food/carbon-footprint-of-tap-water.html';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class Resources extends StatelessWidget {
  //static const String _title = 'Resources Page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Resources',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.cyan,
      ),
      body: Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[
              Card(
                child: Column(children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Click below to see the resources we used to do our calculations!',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    width: 390,
                    child: RaisedButton(
                        color: Colors.cyan,
                        onPressed: _launchURL,
                        child: Text(
                          'See our calculations!',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )),
                  ),
                  SizedBox(
                    width: 390,
                    child: RaisedButton(
                        color: Colors.cyan,
                        onPressed: _launchURLeleven,
                        child: Text(
                          'Water Resource',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )),
                  ),
                ]),
              ),
              Card(
                child: Column(children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Click below to see how you can help stop global warming!',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    width: 390,
                    child: RaisedButton(
                      color: Colors.cyan,
                      onPressed: _launchURLtwo,
                      child: Text(
                        'Get Involved!',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 390,
                    child: RaisedButton(
                      color: Colors.cyan,
                      onPressed: _launchURLfour,
                      child: Text(
                        'Stop global warming!',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
              Card(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Dont know what global warming is? Click below!',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      width: 390,
                      child: RaisedButton(
                        color: Colors.cyan,
                        onPressed: _launchURLsix,
                        child: Text(
                          'About global warming',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Card(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Click any of the buttons below to learn how you can reduce your carbon footprint!',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      width: 390,
                      child: RaisedButton(
                        color: Colors.cyan,
                        onPressed: _launchURLthree,
                        child: Text(
                          'Click on me!',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 390,
                      child: RaisedButton(
                        color: Colors.cyan,
                        onPressed: _launchURLseven,
                        child: Text(
                          'Click on me!',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 390,
                      child: RaisedButton(
                          color: Colors.cyan,
                          onPressed: _launchURLfive,
                          child: Text(
                            'Click on me!',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )),
                    ),
                  ],
                ),
              ),
              Card(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Click on any of the buttons below to learn the difference between climate change and global warming!',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      width: 390,
                      child: RaisedButton(
                        color: Colors.cyan,
                        onPressed: _launchURLeight,
                        child: Text(
                          'Click on me!',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 390,
                      child: RaisedButton(
                        color: Colors.cyan,
                        onPressed: _launchURLnine,
                        child: Text(
                          'Click on me!',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              RaisedButton(
                color: Colors.cyan,
                onPressed: _resetData,
                child: Text(
                  'Reset Data',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
