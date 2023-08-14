import 'dart:convert';
import 'dart:io';

List<Map<String, dynamic>> imageList = [];
// String path = 'C:\\Users\\User\\Desktop\\images\\';
String path = 'E:\\Lalit\\GK\\Pinnacle Videos\\7 Phere Series';
int id = 0;
void imagesToJson(path) {
  Directory(path)
      .listSync(recursive: true, followLinks: false)
      .forEach((element) {
    if (element is File) {
      id++;
      File file = element;
      String fileName = file.path.split('\\').last;
      int fileSize = file.lengthSync();
      String filePath = file.path.replaceAll('\\', '\/');
      // DateTime lastModified = file.lastModifiedSync();
      Map<String, dynamic> imageInfo = {
        'id':id,
        'name': fileName,
        'size': fileSize,
        'path': filePath,
        // 'lastModified': lastModi  fied
      };
      imageList.add(imageInfo);
    }
  });
  String json = jsonEncode(imageList);


  File('test.json').writeAsStringSync(json);
}


void main(){
  imagesToJson(path);
}