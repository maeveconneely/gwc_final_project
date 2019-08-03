import 'dart:async';

import 'package:conserve/extra_widgets/score_calculator.dart';
import 'package:flutter/material.dart';

class Footprint extends StatefulWidget {
  Footprint({Key key}) : super(key: key);
  @override
  _FootprintState createState() => _FootprintState();
}

class _FootprintState extends State<Footprint> {
  List<Item> _data = generateItems(4);
  ScoreCalculator s = ScoreCalculator();
  Future<double> _calculation;
  double leftAmount = 0;
  

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.headerValue),
            );
          },
          body: ListTile(
            title: Text(item.expandedValue),
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }

  void initState() {
    super.initState();
    _calculation = getScore();
  }

  double getLeftAmount() {
    return leftAmount;
  }

  Future<double> getScore() async {
    double score = 0;
    score += await s.calcCar();
    score += await s.calcBus();
    score += await s.calcPlane();
    score += await s.calcBeef();
    score += await s.calcPork();
    score += await s.calcPoultry();
    score += await s.calcCheese();
    score += await s.calcMilk();
    score += await s.calcEggs();
    score += await s.calcRice();
    score += await s.calcBread();
    score += await s.calcLegumes();
    score += await s.calcVegetables();
    score += await s.calcFruit();
    score += await s.calcCarrot();
    score += await s.calcPotato();
    score += await s.calcShower();
    score += await s.calcBathroom();
    score += await s.calcBottle();
    score += await s.calcSmartphone();
    score += await s.calcTablet();
    score += await s.calcClothes();
    print('run');
    return score;
  }

  @override
  Widget build(BuildContext context) {
    _calculation = getScore();
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 60,
            left: 146,
            child: FutureBuilder(
              future: _calculation,
              builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
                if (snapshot.hasData) {
                  leftAmount = snapshot.data / .075;
                  if (leftAmount > 390) {
                    leftAmount = 390;
                  }
                  return Text(
                    'Your Score: ' + snapshot.data.toStringAsFixed(1),
                    textAlign: TextAlign.center,
                  );
                } else {
                  return Text(
                      'No content. Go to Calculator to find out your footprint!');
                }
              },
            ),
          ),
          ListView(children: [
            SizedBox(
              height: 90,
            ),
            RaisedButton(
              child: Text('Reload'),
              onPressed: () {setState(() { 
                
              });}
            ),
            SizedBox(
              height: 360,
            ),
            SingleChildScrollView(
              child: Container(
                child: _buildPanel(),
              ),
            ),
          ]),
           
          Positioned(
            left: 0,
            right: 245,
            child: Container(
              margin: const EdgeInsets.all(10.0),
              color: Colors.green,
              width: 48.0,
              height: 48.0,
            ),
          ),
          Positioned(
            left: 125,
            right: 125,
            child: Container(
              margin: const EdgeInsets.all(10.0),
              color: Colors.yellow,
              width: 48.0,
              height: 48.0,
            ),
          ),
          Positioned(
            left: 265,
            right: 0, //for sure this one is zero
            child: Container(
              margin: const EdgeInsets.all(10.0),
              color: Colors.red,
              width: 48.0,
              height: 48.0,
            ),
          ),
          Positioned(
            left: getLeftAmount(),
            right: 385 - getLeftAmount(),
            child: Container(
              margin: const EdgeInsets.all(10.0),
              color: Colors.black,
              width: 48.0,
              height: 48.0,
            ),
          ),
        ],
      ),
    );
  }
}

class Item {
  Item({
    this.expandedValue,
    this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Panel $index',
      expandedValue: 'This is item number $index',
    );
  });
}
