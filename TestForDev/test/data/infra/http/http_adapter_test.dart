import 'package:TestForDev/data/http/http.dart';
import 'package:TestForDev/infra/http/http.dart';
import 'package:faker/faker.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class ClienteSpy extends Mock implements Client {}

void main() {
  HttpAdapter sut;
  ClienteSpy client;
  String url;

  setUp(() {
    client = ClienteSpy();
    sut = HttpAdapter(client);
    url = faker.internet.httpUrl();
  });

  group('shared', () {
    test("Shoul thow ServerError if invalid method is provided", () async {
      final future = sut.request(url: url, method: 'invalid_method');

      expect(future, throwsA(HttpError.serverError));
    });
  });

  group("post", () {
    PostExpectation mockRequest() =>
        when(client.post(any, body: anyNamed("body"), headers: anyNamed('headers')));

    void mockResponse(int statusCode, {String body = '{"any_key":"any_value"}'}) {
      mockRequest().thenAnswer((_) async => Response(body, statusCode));
    }

    void mockError() {
      mockRequest().thenThrow(Exception());
    }

    setUp(() {
      mockResponse(200);
    });

    test("Shoul call post with correct values", () async {
      await sut.request(
        url: url,
        method: "post",
        body: {"any_key": "any_value"},
      );

      verify(
        client.post(
          url,
          headers: {
            "content-type": "application/json",
            "accept": "application/json",
          },
          body: '{"any_key":"any_value"}',
        ),
      );
    });

    test("Shoul call post without body", () async {
      await sut.request(url: url, method: "post");

      verify(client.post(any, headers: anyNamed("headers")));
    });

    test("Shoul return data if post returns 200", () async {
      final response = await sut.request(url: url, method: "post");

      expect(response, {"any_key": "any_value"});
    });

    test("Shoul return null if post returns 200 with no data", () async {
      mockResponse(200, body: '');

      final response = await sut.request(url: url, method: "post");

      expect(response, null);
    });

    test("Shoul return null if post returns 204", () async {
      mockResponse(204, body: '');

      final response = await sut.request(url: url, method: "post");

      expect(response, null);
    });

    test("Shoul return null if post returns 204 with data with no data", () async {
      mockResponse(204);

      final response = await sut.request(url: url, method: "post");

      expect(response, null);
    });

    test("Shoul return BadRequestError if post returns 400 with no data", () async {
      mockResponse(400, body: "");

      final future = sut.request(url: url, method: "post");

      expect(future, throwsA(HttpError.badRequest));
    });

    test("Shoul return BadRequestError if post returns 400", () async {
      mockResponse(400);

      final future = sut.request(url: url, method: "post");

      expect(future, throwsA(HttpError.badRequest));
    });

    test("Shoul return UnauthorizedError if post returns 401", () async {
      mockResponse(401);

      final future = sut.request(url: url, method: "post");

      expect(future, throwsA(HttpError.unauthorized));
    });

    test("Shoul return ForbiddenError if post returns 403", () async {
      mockResponse(403);

      final future = sut.request(url: url, method: "post");

      expect(future, throwsA(HttpError.forbidden));
    });

    test("Shoul return notFoundError if post returns 404", () async {
      mockResponse(404);

      final future = sut.request(url: url, method: "post");

      expect(future, throwsA(HttpError.notFound));
    });

    test("Shoul return ServerError if post returns 500", () async {
      mockResponse(500);

      final future = sut.request(url: url, method: "post");

      expect(future, throwsA(HttpError.serverError));
    });

    test("Shoul return ServerError if post throws", () async {
      mockError();

      final future = sut.request(url: url, method: "post");

      expect(future, throwsA(HttpError.serverError));
    });
  });
}
