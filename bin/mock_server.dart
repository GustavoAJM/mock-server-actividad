import 'dart:convert';
import 'dart:io';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart';

void main() async {
  final router = Router();

  router.get('/prueba', (Request req) {
    final data = [
      {"fecha": "19/01/2027", "11:00": 30, "20:00": 35}
    ];
    return Response.ok(
      jsonEncode(data),
      headers: {
        'Content-Type': 'application/json',
        'Access-Control-Allow-Origin': '*', // permite consumirlo desde Flutter web
      },
    );
  });

  await io.serve(router.call, InternetAddress.anyIPv4, 3000);
  print('Mock server en http://localhost:3000/prueba');
}