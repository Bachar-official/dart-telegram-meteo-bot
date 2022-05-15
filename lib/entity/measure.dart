import 'package:intl/intl.dart';
import 'package:sqlite3/sqlite3.dart';

class Measure {
  late final int? id;
  late final DateTime date;
  late final double temperature;
  late final double humidity;
  late final double pressure;
  final DateFormat formatter = DateFormat('yyyy-MM-ddTHH:mm:ss');
  final DateFormat outputFormat = DateFormat('dd.MM.yyyy HH:mm');

  Measure(
      {this.id,
      required this.date,
      required this.temperature,
      required this.humidity,
      required this.pressure});

  factory Measure.fromRow(Row row) => Measure(
      id: row['id'],
      date: DateTime.parse(row['date']),
      temperature: row['temperature'],
      pressure: row['pressure'],
      humidity: row['humidity']);

  @override
  String toString() => 'Measure:\nD: ${outputFormat.format(date)}, '
      'T: $temperature°C, '
      'H: ${humidity.toStringAsFixed(2)}%, '
      'P: ${pressure.toStringAsFixed(2)} mmHg.';

  String toSqlValues() =>
      '("${formatter.format(date)}", $temperature, $humidity, $pressure)';

  String toMessage() => 'Measure from ${outputFormat.format(date)}:\n'
      'Temperature: $temperature°C;\n'
      'Humidity: ${humidity.toStringAsFixed(2)}%;\n'
      'Pressure: ${pressure.toStringAsFixed(2)} mmHg.';
}
