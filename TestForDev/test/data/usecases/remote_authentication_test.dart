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
  AuthenticationParams params;
  setUp(() {
    httpClient = HttpClienteSpy();
    url = faker.internet.httpUrl();
    sut = RemoteAuthentication(httpClient: httpClient, url: url);
    params = AuthenticationParams(
        email: faker.internet.email(), secret: faker.internet.password());
  });
  test("Should call HttpClient whit correct values", () async {
    when(
      httpClient.request(
        url: anyNamed("url"),
        method: anyNamed("method"),
        body: anyNamed("body"),
      ),
    ).thenAnswer(
      (_) async => {
        "accessToken": faker.guid.guid(),
        "name": faker.person.name(),
      },
    );
    await sut.auth(params);

    verify(httpClient.request(
        url: url,
        method: "post",
        body: {"email": params.email, "password": params.secret}));
  });

  test("Should throw UnexpectedError if HttpClient returns 400", () async {
    when(
      httpClient.request(
        url: anyNamed("url"),
        method: anyNamed("method"),
        body: anyNamed("body"),
      ),
    ).thenThrow(HttpError.badRequest);

    final future = sut.auth(params);

    expect(future, throwsA(DomainError.unexpected));
  });

  test("Should throw UnexpectedError if HttpClient returns 404", () async {
    when(
      httpClient.request(
        url: anyNamed("url"),
        method: anyNamed("method"),
        body: anyNamed("body"),
      ),
    ).thenThrow(HttpError.notFound);

    final future = sut.auth(params);

    expect(future, throwsA(DomainError.unexpected));
  });

  test("Should throw UnexpectedError if HttpClient returns 500", () async {
    when(
      httpClient.request(
        url: anyNamed("url"),
        method: anyNamed("method"),
        body: anyNamed("body"),
      ),
    ).thenThrow(HttpError.serverError);

    final future = sut.auth(params);

    expect(future, throwsA(DomainError.unexpected));
  });

  test("Should return an Account if HttpClient returns 200", () async {
    when(
      httpClient.request(
        url: anyNamed("url"),
        method: anyNamed("method"),
        body: anyNamed("body"),
      ),
    ).thenThrow(HttpError.unauthorized);

    final future = sut.auth(params);

    expect(future, throwsA(DomainError.invalidCredentials));
  });
  test("Should throw InvalidCredentialsError if HttpClient returns 401",
      () async {
    final accessToken = faker.guid.guid();
    when(
      httpClient.request(
        url: anyNamed("url"),
        method: anyNamed("method"),
        body: anyNamed("body"),
      ),
    ).thenAnswer(
      (_) async => {
        "accessToken": accessToken,
        "name": faker.person.name(),
      },
    );

    final account = await sut.auth(params);

    expect(account.token, accessToken);
  });
}
