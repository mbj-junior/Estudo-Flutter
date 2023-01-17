import 'package:TestForDev/data/http/http.dart';
import 'package:TestForDev/domain/usecases/usecases.dart';
import 'package:flutter/material.dart';

class RemoteAuthentication {
  final HttpClient httpClient;
  final String url;

  RemoteAuthentication({@required this.httpClient, @required this.url});

  Future<void> auth(AuthenticationParams params) async {
    await httpClient.request(
      url: url,
      method: "post",
      body: params.toJson(),
    );
  }
}
