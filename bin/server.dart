import 'dart:convert';
import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

final List data = json.decode(File('test.json').readAsStringSync());
// Configure routes.
final _router = Router()
  ..get('/', _rootHandler)
  ..get('/id/<num>', _idHandler);
  // ..get('/<count>', _countHandler);

Response _rootHandler(Request req) {
  print(jsonEncode(data));
  return Response.ok(jsonEncode(data),
      headers: {'Content-Type': 'application/json'});
}


Response _idHandler(Request req,String id) {
  // final id = req.params['num'];
  final passedId = int.tryParse(id);
  final image = data.firstWhere((element) => element['id'] == passedId,orElse: () => null,);
  return Response.ok(jsonEncode(image),
      headers: {'Content-Type': 'application/json'});

}

Response _testHandler(Request req) {
  return Response.movedPermanently('Hsdsklfjsdlkfjrld!\n',
      context: {'location': 'dfdf'});
}

Response _echoHandler(Request request) {
  final message = request.params['message'];
  return Response.ok('$message\n');
}

void main(List<String> args) async {
  // Use any available host or container IP (usually `0.0.0.0`).
  final ip = InternetAddress.anyIPv4;

  // Configure a pipeline that logs requests.
  final handler = Pipeline().addMiddleware(logRequests()).addHandler(_router);

  // For running in containers, we respect the PORT environment variable.
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await serve(handler, ip, port);
  print('Server listening on port ${server.port}');
  print('cline me ${server.address}');
}
