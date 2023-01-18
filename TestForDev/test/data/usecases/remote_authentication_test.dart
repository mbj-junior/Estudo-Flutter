import 'package:TestForDev/data/http/http.dart';
import 'package:TestForDev/data/usecases/usecases.dart';
import 'package:TestForDev/domain/helpers/helpers.dart';
import 'package:TestForDev/domain/usecases/usecases.dart';
import 'package:faker/faker.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class HttpClienteSpy extends Mock implements HttpClient {}

void main() {
  RemoteAuthentication sut;
  HttpClienteSpy httpClient;
  String url;
  setUp(() {
    httpClient = HttpClienteSpy();
    url = faker.internet.httpUrl();
    sut = RemoteAuthentication(httpClient: httpClient, url: url);
  });
  test("Should call HttpClient whit correct values", () async {
    final params = AuthenticationParams(
        email: faker.internet.email(), secret: faker.internet.password());
    await sut.auth(params);

    verify(httpClient.request(
        url: url,
        method: "post",
        body: {"email": params.email, "password": params.secret}));
  });

  test("Should throw UnexpectedError if HttpCliente returns 400", () async {
    when(
      httpClient.request(
        url: anyNamed("url"),
        method: anyNamed("method"),
        body: anyNamed("body"),
      ),
    ).thenThrow(HttpError.badRequest);

    final params = AuthenticationParams(
        email: faker.internet.email(), secret: faker.internet.password());
    final future = sut.auth(params);

    expect(future, throwsA(DomainError.unexpected));
  });
}
  