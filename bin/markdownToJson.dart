import 'dart:convert';
import 'dart:io';
import 'package:markdown/markdown.dart' as markdown;

void convertMarkdownToJson(String markdownFilePath, String jsonFilePath) {
  // Read Markdown file
  final markdownFileContent = File(markdownFilePath).readAsStringSync();

  // Parse Markdown to HTML
  final htmlContent = markdown.markdownToHtml(markdownFileContent);

  print(htmlContent);

  // Convert HTML to JSON
  final jsonData = {'content': htmlContent};

  // Write JSON to file
  final jsonFile = File(jsonFilePath);
  jsonFile.writeAsStringSync(json.encode(jsonData));
}

// Usage example
void main() {
  convertMarkdownToJson('D:\\college_work\\internship\\Congnus-Flutter\\Apps\\dart_learn\\dart_api\\bin\\input.md', 'output.json');
}