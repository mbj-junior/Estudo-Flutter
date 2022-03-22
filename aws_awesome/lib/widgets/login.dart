import 'package:flutter/material.dart';
import 'package:aws_awesome/widgets/login.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:aws_awesome/amplifyconfiguration.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_analytics_pinpoint/amplify_analytics_pinpoint.dart';
import 'package:flutter_login/flutter_login.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Future<String?> _onLogin(BuildContext context, LoginData data) async {
    debugPrint(data.toString());
  }

  Future<String?>? _onSignup(BuildContext context, LoginData data) async {
    try {
      final res = await Amplify.Auth.signUp(
        username: data.name,
        password: data.password,
        options: CognitoSignUpOptions(
          userAttributes: {'email': data.name}
        )
      );
    } on AuthException catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'AmpAwesome',
      onLogin: (LoginData data) => _onLogin(context, data),
      onRecoverPassword: (_) => Future.value(''),
      onSignup: (LoginData data) => _onSignup(context, data),
      theme: LoginTheme(pageColorLight: Theme.of(context).primaryColor),
      onSubmitAnimationCompleted: () {},
    );
  }
}
