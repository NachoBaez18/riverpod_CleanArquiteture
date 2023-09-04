import 'package:app_cobro_v2/src/features/home/ui/Pages/home_page.dart';
import 'package:flutter/material.dart';

//? Mis importaciones
import '../../../../src/features/auth/ui/Pages/login_pages.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'login': (_) => const LoginPages(),
  'home': (_) => const HomePage()
};
