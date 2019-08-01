class Score {
  int columnId;
  String columnName;
  int columnScore;

  Score({this.columnId, this.columnName, this.columnScore});

  factory Score.fromMap(Map<String, dynamic> parsedJson) {
    return Score(
      columnId: parsedJson['_id'],
      columnName: parsedJson['name'],
      columnScore: parsedJson['score']
    );
  }

  Map<String, dynamic> toMap() => {
    '_id': columnId,
    'name': columnName,
    'score': columnScore,
  };

}