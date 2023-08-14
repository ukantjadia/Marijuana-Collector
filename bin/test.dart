import 'dart:convert';
import 'dart:io';

void readJsonFile(String jsonFilePath) {
  final jsonFileContent = File(jsonFilePath).readAsStringSync();
  final jsonData = json.decode(jsonFileContent);

  // Access the 'content' from the JSON data
  final content = jsonData['content'];

  // Access the 'username' from the 'content'
  // final username = content['username'];

  print('Username: $content');
}

// Usage example
void main() {
  readJsonFile('bin\\output.json');
}
