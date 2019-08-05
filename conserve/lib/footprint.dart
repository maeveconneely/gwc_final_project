import 'dart:async';

import 'package:conserve/extra_widgets/score_calculator.dart';
import 'package:flutter/material.dart';

import 'extra_widgets/item.dart';

class Footprint extends StatefulWidget {
  Footprint({Key key}) : super(key: key);
  @override
  _FootprintState createState() => _FootprintState();
}

class _FootprintState extends State<Footprint> {
  List<Item> _data;
  ScoreCalculator s = ScoreCalculator();
  Future<double> _calculation;

  // left amount for black bar
  double leftAmount = 0;

  // message under score 
  String message =
      "Including all areas of a carbon footprint (not all are provided in this app)," +
          " the average emissions around the world is 13 kg CO2 a day." +
          " The average emssions in America is 57 kg CO2 a day." +
          " In order to have a sustainable future, we must drop our footprints to 5 kg CO2 a day.";

  // initallize the expandable items right away
  _FootprintState() {
    _data = generateItems();
  }

  // indivisual breakdown for transportation data
  Future<String> getTransportationData() async {
    String content = '';
    double car = await s.calcCar();
    double bus = await s.calcBus();
    double plane = await s.calcPlane();
    content += 'Car kg CO2: ' + car.toStringAsFixed(1) + '\n';
    content += 'Bus kg CO2: ' + bus.toStringAsFixed(1) + '\n';
    content += 'Plane kg CO2: ' + plane.toStringAsFixed(1) + '\n';
    return content;
  }

  // indivisual breakdown for food data
  Future<String> getFoodData() async {
    String content = '';
    double beef = await s.calcBeef();
    double pork = await s.calcPork();
    double poultry = await s.calcPoultry();
    double cheese = await s.calcCheese();
    double milk = await s.calcMilk();
    double eggs = await s.calcEggs();
    double rice = await s.calcRice();
    double bread = await s.calcBread();
    double legumes = await s.calcLegumes();
    double vegetables = await s.calcVegetables();
    double fruit = await s.calcFruit();
    double carrot = await s.calcCarrot();
    double potato = await s.calcPotato();
    content += 'Beef kg CO2: ' + beef.toStringAsFixed(1) + '\n';
    content += 'Pork/Lamb kg CO2: ' + pork.toStringAsFixed(1) + '\n';
    content += 'Poultry kg CO2: ' + poultry.toStringAsFixed(1) + '\n';
    content += 'Cheese kg CO2: ' + cheese.toStringAsFixed(1) + '\n';
    content += 'Milk kg CO2: ' + milk.toStringAsFixed(1) + '\n';
    content += 'Eggs kg CO2: ' + eggs.toStringAsFixed(1) + '\n';
    content += 'Rice kg CO2: ' + rice.toStringAsFixed(1) + '\n';
    content += 'Bread kg CO2: ' + bread.toStringAsFixed(1) + '\n';
    content += 'Legumes kg CO2: ' + legumes.toStringAsFixed(1) + '\n';
    content += 'Vegetables kg CO2: ' + vegetables.toStringAsFixed(1) + '\n';
    content += 'Fruit kg CO2: ' + fruit.toStringAsFixed(1) + '\n';
    content += 'Carrot kg CO2: ' + carrot.toStringAsFixed(1) + '\n';
    content += 'Potatoes kg CO2: ' + potato.toStringAsFixed(1) + '\n';
    return content;
  }

  // indivisual breakdown for Home data
  Future<String> getHomeData() async {
    String content = '';
    double shower = await s.calcShower();
    double bathroom = await s.calcBathroom();
    double bottle = await s.calcBottle();
    double smartphone = await s.calcSmartphone();
    double tablet = await s.calcTablet();
    content += 'Shower kg CO2: ' + shower.toStringAsFixed(1) + '\n';
    content += 'Bathroom kg CO2: ' + bathroom.toStringAsFixed(1) + '\n';
    content += 'Bottle kg CO2: ' + bottle.toStringAsFixed(1) + '\n';
    content += 'Smartphone kg CO2: ' + smartphone.toStringAsFixed(1) + '\n';
    content += 'Tablet kg CO2: ' + tablet.toStringAsFixed(1) + '\n';
    return content;
  }

  // indivisual breakdown for Misc data
  Future<String> getMiscData() async {
    String content = '';
    double clothes = await s.calcClothes();
    content += 'Clothes kg CO2: ' + clothes.toStringAsFixed(1) + '\n';
    return content;
  }



  List<Item> generateItems() {

    return [
      Item(
        headerValue: 'Home Breakdown',
        expandedValue: FutureBuilder<String>(
            future: getHomeData(),
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data);
              } else {
                return Text('No Home Data');
              }
            }),
      ),
      Item(
        headerValue: 'Food Breakdown',
        expandedValue: FutureBuilder<String>(
            future: getFoodData(),
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data);
              } else {
                return Text('No Food Data');
              }
            }),
      ),
      Item(
        headerValue: 'Transportation Breakdown',
        expandedValue: FutureBuilder<String>(
            future: getTransportationData(),
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data);
              } else {
                return Text('No Transportation Data');
              }
            }),
      ),
      Item(
        headerValue: 'Misc Breakdown',
        expandedValue: FutureBuilder<String>(
            future: getMiscData(),
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data);
              } else {
                return Text('No Miscellaneous Data');
              }
            }),
      ),
    ];
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data = generateItems();
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
            title: item.expandedValue,
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
    return score;
  }

  String getCarData() {
    String content = '';

    return content;
  }

  @override
  Widget build(BuildContext context) {
    _calculation = getScore();
    

    return Scaffold(
      body: Stack(
        children: <Widget>[
          ListView(children: [
            SizedBox(
              height: 200,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(
              height: 180,
            ),
            SingleChildScrollView(
              child: Container(
                child: _buildPanel(),
              ),
            ),
          ]),
          Container(
            width: 410,
            height: 90,
            child: FutureBuilder(
              future: _calculation,
              builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
                if (snapshot.hasData) {
                  leftAmount = snapshot.data / .075;
                  if (leftAmount > 390) {
                    leftAmount = 390;
                  }

                  return Stack(
                    children: <Widget>[
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
                        left: 255,
                        right: 0, //for sure this one is zero
                        child: Container(
                          margin: const EdgeInsets.all(10.0),
                          color: Colors.red,
                          width: 48.0,
                          height: 48.0,
                        ),
                      ),
                      Positioned(
                        top: 60,
                        left: 120,
                        child: Text(
                          'Your Score: ' + snapshot.data.toStringAsFixed(1) + 'kg CO2',
                          textAlign: TextAlign.center,
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
                  );
                } else {
                  return Center(
                    child: Text(
                        'No content. Go to Calculator to find out your footprint!'),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
