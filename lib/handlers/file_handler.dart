import 'dart:io';

class FileHandler {
  late final String path;
  late final File file;

  FileHandler({required this.path}) {
    file = File(path);
  }

  Future<String> getBotToken() async {
    List<String> lines = await file.readAsLines();
    return lines[0];
  }
}
