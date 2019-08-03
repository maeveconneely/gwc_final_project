import 'package:conserve/data/database_helper.dart';
import 'package:conserve/model/score.dart';

class ScoreCalculator {
  var dbHelper = DatabaseHelper.instance;
  var allRows;
  
  ScoreCalculator();

  
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
        carScore = c[i].columnScore;
      }
    }

    print('okay');
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
        busScore = c[i].columnScore;
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
        planeScore = c[i].columnScore;
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
        beefScore = c[i].columnScore;
      }
    }

    return beefScore * .40935;

  
  }

  Future<double> calcPork() async{

    // get the database
    allRows = await dbHelper.queryAllRows();
  
    // make it a list of Scores
    List<Score> c = List<Score>();
     allRows.forEach((score) {
      print(score);
      c.add(Score.fromMap(score));
    });

    // find the car score
    int porkScore = 0;
    for (int i = 0; i < c.length; i++) {
      if (c[i].columnId == 4) {
        porkScore = c[i].columnScore;
      }
    }

    // return score with calculation
    return porkScore * .78;

  }

Future<double> calcPoultry() async{

    // get the database
    allRows = await dbHelper.queryAllRows();
  
    // make it a list of Scores
    List<Score> c = List<Score>();
     allRows.forEach((score) {
      print(score);
      c.add(Score.fromMap(score));
    });

    // find the car score
    int poultryScore = 0;
    for (int i = 0; i < c.length; i++) {
      if (c[i].columnId == 5) {
        poultryScore = c[i].columnScore;
      }
    }

    // return score with calculation
    return poultryScore * .57;

  }

  Future<double> calcCheese() async{
    // get the database
    allRows = await dbHelper.queryAllRows();
  
    // make it a list of Scores
    List<Score> c = List<Score>();
     allRows.forEach((score) {
      print(score);
      c.add(Score.fromMap(score));
    });

    // find the car score
    int cheeseScore = 0;
    for (int i = 0; i < c.length; i++) {
      if (c[i].columnId == 6) {
        cheeseScore = c[i].columnScore;
      }
    }

    // return score with calculation
    return cheeseScore * 1.11;

  }




  Future<double> calcMilk() async{
    // get the database
    allRows = await dbHelper.queryAllRows();
  
    // make it a list of Scores
    List<Score> c = List<Score>();
     allRows.forEach((score) {
      print(score);
      c.add(Score.fromMap(score));
    });

    // find the car score
    int milkScore = 0;
    for (int i = 0; i < c.length; i++) {
      if (c[i].columnId == 7) {
        milkScore = c[i].columnScore;
      }
    }

    // return score with calculation
    return milkScore * .33;

  }

  Future<double> calcEggs() async{

    // get the database
    allRows = await dbHelper.queryAllRows();
  
    // make it a list of Scores
    List<Score> c = List<Score>();
     allRows.forEach((score) {
      print(score);
      c.add(Score.fromMap(score));
    });

    // find the car score
    int eggsScore = 0;
    for (int i = 0; i < c.length; i++) {
      if (c[i].columnId == 8) {
        eggsScore = c[i].columnScore;
      }
    }

    // return score with calculation
    return eggsScore * .4;

  }

  Future<double> calcRice() async{

    // get the database
    allRows = await dbHelper.queryAllRows();
  
    // make it a list of Scores
    List<Score> c = List<Score>();
     allRows.forEach((score) {
      print(score);
      c.add(Score.fromMap(score));
    });

    // find the car score
    int riceScore = 0;
    for (int i = 0; i < c.length; i++) {
      if (c[i].columnId == 9) {
        riceScore = c[i].columnScore;
      }
    }

    // return score with calculation
    return riceScore * .072;

  }

  Future<double> calcBread() async{

    // get the database
    allRows = await dbHelper.queryAllRows();
  
    // make it a list of Scores
    List<Score> c = List<Score>();
     allRows.forEach((score) {
      print(score);
      c.add(Score.fromMap(score));
    });

    // find the car score
    int breadScore = 0;
    for (int i = 0; i < c.length; i++) {
      if (c[i].columnId == 10) {
        breadScore = c[i].columnScore;
      }
    }

    // return score with calculation
    return breadScore * .9;

  }

  Future<double> calcLegumes() async{

    // get the database
    allRows = await dbHelper.queryAllRows();
  
    // make it a list of Scores
    List<Score> c = List<Score>();
     allRows.forEach((score) {
      print(score);
      c.add(Score.fromMap(score));
    });

    // find the car score
    int legumesScore = 0;
    for (int i = 0; i < c.length; i++) {
      if (c[i].columnId == 11) {
        legumesScore = c[i].columnScore;
      }
    }

    // return score with calculation
    return legumesScore * .5;

  }

  Future<double> calcVegetables() async{

    // get the database
    allRows = await dbHelper.queryAllRows();
  
    // make it a list of Scores
    List<Score> c = List<Score>();
     allRows.forEach((score) {
      print(score);
      c.add(Score.fromMap(score));
    });

    // find the car score
    int vegetablesScore = 0;
    for (int i = 0; i < c.length; i++) {
      if (c[i].columnId == 12) {
        vegetablesScore = c[i].columnScore;
      }
    }

    // return score with calculation
    return vegetablesScore * .135;

  }

  Future<double> calcFruit() async{

    // get the database
    allRows = await dbHelper.queryAllRows();
  
    // make it a list of Scores
    List<Score> c = List<Score>();
     allRows.forEach((score) {
      print(score);
      c.add(Score.fromMap(score));
    });

    // find the car score
    int fruitScore = 0;
    for (int i = 0; i < c.length; i++) {
      if (c[i].columnId == 13) {
        fruitScore = c[i].columnScore;
      }
    }

    // return score with calculation
    return fruitScore * .195;

  }

  Future<double> calcCarrot() async{

    // get the database
    allRows = await dbHelper.queryAllRows();
  
    // make it a list of Scores
    List<Score> c = List<Score>();
     allRows.forEach((score) {
      print(score);
      c.add(Score.fromMap(score));
    });

    // find the car score
    int carrotScore = 0;
    for (int i = 0; i < c.length; i++) {
      if (c[i].columnId == 14) {
        carrotScore = c[i].columnScore;
      }
    }

    // return score with calculation
    return carrotScore * .03;

  }

Future<double> calcPotato() async{

    // get the database
    allRows = await dbHelper.queryAllRows();
  
    // make it a list of Scores
    List<Score> c = List<Score>();
     allRows.forEach((score) {
      print(score);
      c.add(Score.fromMap(score));
    });

    // find the potato score
    int potatoScore = 0;
    for (int i = 0; i < c.length; i++) {
      if (c[i].columnId == 15) {
        potatoScore = c[i].columnScore;
      }
    }

    // return score with calculation
    return potatoScore * .0014;

  }

Future<double> calcShower() async{

    // get the database
    allRows = await dbHelper.queryAllRows();
  
    // make it a list of Scores
    List<Score> c = List<Score>();
     allRows.forEach((score) {
      print(score);
      c.add(Score.fromMap(score));
    });

    // find the car score
    int showerScore = 0;
    for (int i = 0; i < c.length; i++) {
      if (c[i].columnId == 16) {
        showerScore = c[i].columnScore;
      }
    }

    // return score with calculation
    return showerScore * 2.1 * 3.78541 * .000298;

  }

Future<double> calcBathroom() async{

    // get the database
    allRows = await dbHelper.queryAllRows();
  
    // make it a list of Scores
    List<Score> c = List<Score>();
     allRows.forEach((score) {
      print(score);
      c.add(Score.fromMap(score));
    });

    // find the car score
    int bathroomScore = 0;
    for (int i = 0; i < c.length; i++) {
      if (c[i].columnId == 17) {
        bathroomScore = c[i].columnScore;
      }
    }

    // return score with calculation
    return bathroomScore * 1.3 * 3.78541 * .000298;

  }

Future<double> calcBottle() async{

    // get the database
    allRows = await dbHelper.queryAllRows();
  
    // make it a list of Scores
    List<Score> c = List<Score>();
     allRows.forEach((score) {
      print(score);
      c.add(Score.fromMap(score));
    });

    // find the car score
    int bottleScore = 0;
    for (int i = 0; i < c.length; i++) {
      if (c[i].columnId == 18) {
        bottleScore = c[i].columnScore;
      }
    }

    // return score with calculation
    return bottleScore * .445;

  }

Future<double> calcSmartphone() async{

    // get the database
    allRows = await dbHelper.queryAllRows();
  
    // make it a list of Scores
    List<Score> c = List<Score>();
     allRows.forEach((score) {
      print(score);
      c.add(Score.fromMap(score));
    });

    // find the car score
    int smartphoneScore = 0;
    for (int i = 0; i < c.length; i++) {
      if (c[i].columnId == 19) {
        smartphoneScore = c[i].columnScore;
      }
    }

    // return score with calculation
    return (smartphoneScore *(28/1456) + 27);

  }

Future<double> calcTablet() async{

    // get the database
    allRows = await dbHelper.queryAllRows();
  
    // make it a list of Scores
    List<Score> c = List<Score>();
     allRows.forEach((score) {
      print(score);
      c.add(Score.fromMap(score));
    });

    // find the car score
    int tabletScore = 0;
    for (int i = 0; i < c.length; i++) {
      if (c[i].columnId == 20) {
        tabletScore = c[i].columnScore;
      }
    }

    // return score with calculation
    return (tabletScore *(65/1456) + 65 );

  }

Future<double> calcClothes() async{

    // get the database
    allRows = await dbHelper.queryAllRows();
  
    // make it a list of Scores
    List<Score> c = List<Score>();
     allRows.forEach((score) {
      print(score);
      c.add(Score.fromMap(score));
    });

    // find the car score
    int clothesScore = 0;
    for (int i = 0; i < c.length; i++) {
      if (c[i].columnId == 21) {
        clothesScore = c[i].columnScore;
      }
    }

    // return score with calculation
    return clothesScore * .2756 * 6.5 * .25 * (1/7);

  }

}