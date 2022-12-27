import 'package:flutter/material.dart';
import 'package:shop/models/auth.dart';
import 'package:provider/provider.dart';
import 'package:shop/pages/auth_page.dart';
import 'package:shop/pages/produts_overview_page.dart';

class AuthOrHomePage extends StatelessWidget {
  const AuthOrHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of(context);
    return auth.isAuth ? const ProductOverviewPage() : const AuthPage();
  }
}
