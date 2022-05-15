import 'package:dart_telegram_meteo_bot/handlers/db_handler.dart';
import 'package:dart_telegram_meteo_bot/handlers/measure_list_handler.dart';
import 'package:teledart/model.dart';

import '../entity/measure.dart';

class CommandHandler {
  late final DBHandler dbHandler;
  late final MeasureListHandler listHandler;
  CommandHandler({required this.dbHandler}) {
    listHandler = MeasureListHandler();
  }

  void singleMeasureAnswer(TeleDartMessage message) {
    print('Message from ${message.chat.first_name} ${message.chat.last_name}\n'
        '(id: ${message.chat.id})');
    Measure result = dbHandler.getLastMeasure();
    print('returned 1 result');
    message.reply(result.toMessage());
  }

  void hourMeasureAnswer(TeleDartMessage message) {
    print('Message from ${message.chat.first_name} ${message.chat.last_name}\n'
        '(id: ${message.chat.id})');
    List<Measure> result = dbHandler.getHourMeasures();
    print('returned ${result.length} results');
    message.reply(listHandler.getListAnalysis(result));
  }

  void workDayMeasureAnswer(TeleDartMessage message) {
    print('Message from ${message.chat.first_name} ${message.chat.last_name}\n'
        '(id: ${message.chat.id})');
    List<Measure> result = dbHandler.getWorkDayMeasures();
    print('returned ${result.length} results');
    message.reply(listHandler.getListAnalysis(result));
  }

  void dayMeasureAnswer(TeleDartMessage message) {
    print('Message from ${message.chat.first_name} ${message.chat.last_name}\n'
        '(id: ${message.chat.id})');
    List<Measure> result = dbHandler.getDayMeasures();
    print('returned ${result.length} results');
    message.reply(listHandler.getListAnalysis(result));
  }

  void weekMeasureAnswer(TeleDartMessage message) {
    print('Message from ${message.chat.first_name} ${message.chat.last_name}\n'
        '(id: ${message.chat.id})');
    List<Measure> result = dbHandler.getWeekMeasures();
    print('returned ${result.length} results');
    message.reply(listHandler.getListAnalysis(result));
  }
}
