import 'package:flutter/material.dart';
import 'package:shop/models/auth.dart';
import 'package:provider/provider.dart';

enum AuthMode { signup, login }

class AuthForm extends StatefulWidget {
  const AuthForm({Key? key}) : super(key: key);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  AuthMode _authMode = AuthMode.login;
  final Map<String, String> _authData = {
    "email": "",
    "password": "",
  };

  bool _isLogin() => _authMode == AuthMode.login;
  bool _isSignup() => _authMode == AuthMode.signup;
  void _switchAuthMode() {
    setState(() {
      if (_isLogin()) {
        _authMode = AuthMode.signup;
      } else {
        _authMode = AuthMode.login;
      }
    });
  }

  Future<void> _submit() async {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) {
      return;
    }
    setState(() => _isLoading = true);

    _formKey.currentState?.save();
    Auth auth = Provider.of(context, listen: false);
    if (_isLogin()) {
      await auth.signInWithPassword(
        _authData['email']!,
        _authData['password']!,
      );
    } else {
      await auth.signup(
        _authData['email']!,
        _authData['password']!,
      );
    }

    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        height: _isLogin() ? 310 : 400,
        width: size.width * 0.75,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: "E-mail"),
                keyboardType: TextInputType.emailAddress,
                onSaved: (email) => _authData["email"] = email ?? "",
                validator: (_email) {
                  final email = _email ?? "";
                  if (email.trim().isEmpty || !email.contains("@")) {
                    return "Email invalido";
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Senha"),
                keyboardType: TextInputType.emailAddress,
                obscureText: true,
                controller: _passwordController,
                onSaved: (password) => _authData["password"] = password ?? "",
                validator: _isLogin()
                    ? null
                    : (_password) {
                        final password = _password ?? "";
                        if (password.isEmpty || password.length < 5) {
                          return "Senha invalida";
                        }
                        return null;
                      },
              ),
              if (_isSignup())
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: "Confirmar Senha"),
                  keyboardType: TextInputType.emailAddress,
                  obscureText: true,
                  validator: (_password) {
                    final password = _password ?? "";
                    if (password != _passwordController.text) {
                      return "Senhas diferentes";
                    }
                    return null;
                  },
                ),
              const SizedBox(
                height: 20,
              ),
              if (_isLoading)
                const CircularProgressIndicator()
              else
                ElevatedButton(
                  onPressed: _submit,
                  child: Text(_isLogin() ? "ENTRAR" : "REGISTRAR"),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 8,
                    ),
                  ),
                ),
              const Spacer(),
              TextButton(
                onPressed: _switchAuthMode,
                child:
                    Text(_isLogin() ? "DESEJA REGISTRAR" : "JÁ POSSUI CONTA?"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
