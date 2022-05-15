import 'package:sqlite3/sqlite3.dart';

import '../entity/measure.dart';

class DBHandler {
  late final Database database;
  final String _tableName = 'measure';
  static final int _HOUR = 12;
  static final int _WORKDAY = _HOUR * 8;
  static final int _DAY = _HOUR * 24;
  static final int _WEEK = _DAY * 7;
  static final int _MONTH = _DAY * 30;

  DBHandler({required this.database});

  String _getQueryByDuration(int duration) {
    return 'SELECT * FROM $_tableName ORDER BY id DESC LIMIT $duration';
  }

  void addMeasure(Measure measure) {
    database.execute(
        'INSERT into $_tableName(`date`, `temperature`, `humidity`, `pressure`) VALUES ${measure.toSqlValues()}');
  }

  List<Measure> getAllMeasures() {
    final ResultSet result =
        database.select('SELECT * FROM $_tableName ORDER BY id DESC');
    return result
        .map((entry) => Measure.fromRow(entry))
        .toList()
        .reversed
        .toList();
  }

  List<Measure> getHourMeasures() {
    final ResultSet result = database.select(_getQueryByDuration(_HOUR));
    return result
        .map((entry) => Measure.fromRow(entry))
        .toList()
        .reversed
        .toList();
  }

  List<Measure> getWorkDayMeasures() {
    final ResultSet result = database.select(_getQueryByDuration(_WORKDAY));
    return result
        .map((entry) => Measure.fromRow(entry))
        .toList()
        .reversed
        .toList();
  }

  List<Measure> getDayMeasures() {
    final ResultSet result = database.select(_getQueryByDuration(_DAY));
    return result
        .map((entry) => Measure.fromRow(entry))
        .toList()
        .reversed
        .toList();
  }

  List<Measure> getWeekMeasures() {
    final ResultSet result = database.select(_getQueryByDuration(_WEEK));
    return result
        .map((entry) => Measure.fromRow(entry))
        .toList()
        .reversed
        .toList();
  }

  List<Measure> getMonthMeasures() {
    final ResultSet result = database.select(_getQueryByDuration(_MONTH));
    return result
        .map((entry) => Measure.fromRow(entry))
        .toList()
        .reversed
        .toList();
  }

  Measure getLastMeasure() {
    final ResultSet result =
        database.select('SELECT * FROM measure ORDER BY id DESC LIMIT 1');
    return Measure.fromRow(result[0]);
  }
}
