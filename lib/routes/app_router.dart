import 'package:auth_task/presentation/home/views/home_screen.dart';
import 'package:auth_task/routes/route_names.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../presentation/auth/views/login_screen.dart';
import '../presentation/auth/views/registration_screen.dart';



final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: RouteNames.login,
    routes: [
      GoRoute(
        path: RouteNames.login,
        name: 'login',
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        path: RouteNames.registration,
        name: '/registration',
        builder: (context, state) => RegistrationScreen(),
      ),
      GoRoute(
        path: RouteNames.home,
        name: '/home',
        builder: (context, state) => HomeScreen(),
      ),
    ],
  );
});
