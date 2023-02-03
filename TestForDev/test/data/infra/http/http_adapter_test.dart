import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class HttpAdapter {
  final Client client;

  HttpAdapter(this.client);
  Future<void> request({
    @required String url,
    @required String method,
  }) async {
    await client.post(url);
  }
}

class ClienteSpy extends Mock implements Client {}

void main() {
  group("post", () {
    test("Shoul call post with correct values", () async {
      final client = ClienteSpy();
      final sut = HttpAdapter(client);
      final url = faker.internet.httpUrl();

      await sut.request(url: url, method: "post");

      verify(client.post(url));
    });
  });
}
