import 'package:conserve/data/database_helper.dart';
import 'package:conserve/model/score.dart';

class ScoreCalculator {
  var dbHelper = DatabaseHelper.instance;
  var allRows;
  
  ScoreCalculator ();

  getRows() async{
    return await dbHelper.queryAllRows();
  }
  
  Future<double> calcCar() async{
    allRows = await dbHelper.queryAllRows();
    List<Score> c = allRows.forEach((score) => Score.fromMap(score));
    ///double cScore =  carScore * .40935; 
    //print(cScore);
    return 0;
  }
}