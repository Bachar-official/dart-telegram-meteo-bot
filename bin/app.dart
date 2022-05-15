import 'package:dart_telegram_meteo_bot/handlers/command_handler.dart';
import 'package:dart_telegram_meteo_bot/handlers/db_handler.dart';
import 'package:dart_telegram_meteo_bot/handlers/file_handler.dart';
import 'package:sqlite3/sqlite3.dart';
import 'package:teledart/teledart.dart';
import 'package:teledart/telegram.dart';

void main(List<String> arguments) async {
  Database db = sqlite3.open('/home/pi/database/measures.db');
  print('Database initializaed successfully.');
  FileHandler fileHandler = FileHandler(path: '/home/pi/database/token.txt');
  DBHandler dbHandler = DBHandler(database: db);
  CommandHandler comHandler = CommandHandler(dbHandler: dbHandler);
  String token = await fileHandler.getBotToken();
  print('Bot token got successfully.');
  final username = (await Telegram(token).getMe()).username;
  var teledart = TeleDart(token, Event(username!));
  print('Bot initialized.');

  teledart.onCommand('measure').listen(comHandler.singleMeasureAnswer);
  teledart.onCommand('hour').listen(comHandler.hourMeasureAnswer);
  teledart.onCommand('workday').listen(comHandler.workDayMeasureAnswer);
  teledart.onCommand('day').listen(comHandler.dayMeasureAnswer);
  teledart.onCommand('week').listen(comHandler.weekMeasureAnswer);

  teledart.start();
}
