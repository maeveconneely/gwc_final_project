import 'package:conserve/data/database_helper.dart';
import 'package:conserve/model/score.dart';

class ScoreCalculator {
  var dbHelper = DatabaseHelper.instance;
  var allRows;
  
  ScoreCalculator ();

  
  Future<double> calcCar() async{

    // get the database
    allRows = await dbHelper.queryAllRows();
  
    // make it a list of Scores
    List<Score> c = List<Score>();
     allRows.forEach((score) {
      print(score);
      c.add(Score.fromMap(score));
    });

    // find the car score
    int carScore = 0;
    for (int i = 0; i < c.length; i++) {
      if (c[i].columnId == 0) {
        carScore = c[0].columnScore;
      }
    }

    // return score with calculation
    return carScore * .40935;

  }

  Future<double> calcBus() async{
    allRows = await dbHelper.queryAllRows();
  
    List<Score> c = List<Score>();
     allRows.forEach((score) {
      print(score);
      c.add(Score.fromMap(score));
    });

    int busScore = 0;
    for (int i = 0; i < c.length; i++) {
      if (c[i].columnId == 1) {
        busScore = c[1].columnScore;
      }
    }


    return busScore * .18891/.622137;

  }

  Future<double> calcPlane() async{
    allRows = await dbHelper.queryAllRows();
  
    List<Score> c = List<Score>();
     allRows.forEach((score) {
      print(score);
      c.add(Score.fromMap(score));
    });

    int planeScore = 0;
    for (int i = 0; i < c.length; i++) {
      if (c[i].columnId == 2) {
        planeScore = c[2].columnScore;
      }
    }

    return planeScore * 1.09 * .20515 / .62137;

  }

  Future<double> calcBeef() async{
    allRows = await dbHelper.queryAllRows();
  
    List<Score> c = List<Score>();
     allRows.forEach((score) {
      print(score);
      c.add(Score.fromMap(score));
    });

    int beefScore = 0;
    for (int i = 0; i < c.length; i++) {
      if (c[i].columnId == 3) {
        beefScore = c[3].columnScore;
      }
    }

    return  beefScore * .40935;

  
  }


}