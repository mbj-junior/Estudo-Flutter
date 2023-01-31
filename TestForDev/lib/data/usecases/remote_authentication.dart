import 'package:TestForDev/data/http/http.dart';
import 'package:TestForDev/data/models/models.dart';
import 'package:TestForDev/domain/entities/entities.dart';
import 'package:TestForDev/domain/helpers/helpers.dart';
import 'package:TestForDev/domain/usecases/usecases.dart';
import 'package:flutter/material.dart';

class RemoteAuthentication {
  final HttpClient httpClient;
  final String url;

  RemoteAuthentication({@required this.httpClient, @required this.url});

  Future<AccountEntity> auth(AuthenticationParams params) async {
    final body = RemoteAuthenticationParams.fromDomain(params).toJson();
    try {
      final httpResponse = await httpClient.request(
        url: url,
        method: "post",
        body: body,
      );
      return RemoteAccountModel.fromJson(httpResponse).toEntity();
    } on HttpError catch (error) {
      throw error == HttpError.unauthorized
          ? DomainError.invalidCredentials
          : DomainError.unexpected;
    }
  }
}

class RemoteAuthenticationParams {
  final String email;
  final String password;

  RemoteAuthenticationParams({
    @required this.email,
    @required this.password,
  });

  factory RemoteAuthenticationParams.fromDomain(AuthenticationParams params) =>
      RemoteAuthenticationParams(email: params.email, password: params.secret);

  Map toJson() => {'email': email, 'password': password};
}
