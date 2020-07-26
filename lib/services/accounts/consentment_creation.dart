import 'dart:io';
import 'dart:async';

import 'package:dio/adapter.dart';
import 'package:flutter/services.dart';
import '../../models/Credential.dart';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';

Future<Credential> fetchCredential() async {
  final tokenEndpoint = "https://as1.tecban-sandbox.o3bank.co.uk/token";

  final clientCredentials =
      'ODFjYWM0NzgtOGQwZS00ZWFkLWIwMjQtZjUzOWRhMzBlZmFjOjYzYWNlMDllLTcyODktNDcyMi05MmE2LWFhYTA3NzY4NzdhZQ==';

  final SecurityContext context = SecurityContext.defaultContext;

  final crtData = await rootBundle.load('cert/bank1/client_certificate.crt');
  context.useCertificateChainBytes(crtData.buffer.asUint8List());

  final keyBytes = await rootBundle.load('cert/bank1/client_private_key.key');
  context.usePrivateKeyBytes(keyBytes.buffer.asUint8List());

  Map<String, dynamic> jsonMap = {
    'grant_type': 'client_credentials',
    'scope': 'accounts openid',
  };

  Response responseD;
  Dio dio = new Dio();

  (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
      (clientx) {
    HttpClient httpClient = new HttpClient(context: context);
    httpClient.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);
    return httpClient;
  };
  dio.options.contentType = Headers.formUrlEncodedContentType;
  dio.options.headers[HttpHeaders.authorizationHeader] =
      "Basic $clientCredentials";
  responseD = await dio.post(tokenEndpoint,
      data: jsonMap,
      options: Options(contentType: Headers.formUrlEncodedContentType));
  debugPrint('responseD: ' + responseD.data.toString());
  return Credential.fromJson(responseD.data);
}
