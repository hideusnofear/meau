import 'dart:io';

import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';

import '../../models/Credential.dart';

Future<Credential> fetchCredential() async {
  final tokenEndpoint = "https://as1.tecban-sandbox.o3bank.co.uk/token";

  final SecurityContext context = SecurityContext.defaultContext;

  final ByteData crtData = await rootBundle.load('assets/bank1/chain.crt');
  context.setTrustedCertificatesBytes(crtData.buffer.asUint8List());

  final ByteData keyBytes =
      await rootBundle.load('assets/bank1/client_private_key.key');
  context.usePrivateKeyBytes(keyBytes.buffer.asUint8List());

  HttpClient client = new HttpClient(context: context);
  client
      .getUrl(Uri.parse(tokenEndpoint))
      .then((HttpClientRequest request) => request.close())
      .then((HttpClientResponse response) {
    response.transform(utf8.decoder).listen((contents) {
      print(contents);
      return contents;
    });
  });
}
