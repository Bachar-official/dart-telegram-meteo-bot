import 'package:intl/intl.dart';

import '../entity/measure.dart';

class MeasureListHandler {
  MeasureListHandler();
  static final DateFormat _outputFormat = DateFormat('dd.MM.yyyy HH:mm');

  String _getMaxTemperature(List<Measure> list) {
    Measure maxTemperature = list.reduce((first, another) =>
        first.temperature > another.temperature ? first : another);
    return 'Max T: ${_outputFormat.format(maxTemperature.date)} (${maxTemperature.temperature.toStringAsFixed(2)}°C)';
  }

  String _getMinTemperature(List<Measure> list) {
    Measure minTemperature = list.reduce((first, another) =>
        first.temperature < another.temperature ? first : another);
    return 'Min T ${_outputFormat.format(minTemperature.date)}  (${minTemperature.temperature.toStringAsFixed(2)}°C)';
  }

  String _getMaxHumidity(List<Measure> list) {
    Measure max = list.reduce((first, another) =>
        first.humidity > another.humidity ? first : another);
    return 'Max H ${_outputFormat.format(max.date)}  (${max.humidity.toStringAsFixed(2)}%)';
  }

  String _getMinHumidity(List<Measure> list) {
    Measure min = list.reduce((first, another) =>
        first.humidity < another.humidity ? first : another);
    return 'Min H ${_outputFormat.format(min.date)}  (${min.humidity.toStringAsFixed(2)}%)';
  }

  String _getMaxPressure(List<Measure> list) {
    Measure max = list.reduce((first, another) =>
        first.pressure > another.pressure ? first : another);
    return 'Max P ${_outputFormat.format(max.date)}  (${max.pressure.toStringAsFixed(2)} mmhg)';
  }

  String _getMinPressure(List<Measure> list) {
    Measure min = list.reduce((first, another) =>
        first.pressure < another.pressure ? first : another);
    return 'Min P ${_outputFormat.format(min.date)}  (${min.pressure.toStringAsFixed(2)} mmhg)';
  }

  String getListAnalysis(List<Measure> list) {
    DateTime begin = list.elementAt(0).date;
    DateTime end = list.elementAt(list.length - 1).date;
    return 'From ${_outputFormat.format(begin)} to ${_outputFormat.format(end)}\n'
        '${_getMaxTemperature(list)}\n'
        '${_getMinTemperature(list)}\n'
        '${_getMaxHumidity(list)}\n'
        '${_getMinHumidity(list)}\n'
        '${_getMaxPressure(list)}\n'
        '${_getMinPressure(list)}\n';
  }
}
