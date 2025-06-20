import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app_fluttercon25/pages/home.dart';
import 'package:movie_app_fluttercon25/pages/sign_in.dart';

import '../pages/settings.dart';

Page getPage({required Widget child, required GoRouterState state}) {
  return MaterialPage(child: child, key: state.pageKey);
}

const signInPath = '/sign-in';
const homePath = '/';
final _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'Shell');
final _homeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'Home');
final _settingsNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'Settings');
final goRouter = GoRouter(
    navigatorKey: _shellNavigatorKey,
    redirect: (context, state) async {
      User? user = (await FirebaseAuth.instance.userChanges().first);
      if (user != null) {
        return state.fullPath;
      }
      return signInPath;
    },
    routes: routes,
    initialLocation: homePath);
final routes = [
  StatefulShellRoute.indexedStack(
    parentNavigatorKey: _shellNavigatorKey,
    branches: [
      StatefulShellBranch(navigatorKey: _homeNavigatorKey, routes: [
        GoRoute(path: homePath, builder: (context, state) => Home())
      ]),
      StatefulShellBranch(navigatorKey: _settingsNavigatorKey, routes: [
        GoRoute(
            path: '/settings', builder: (context, state) => const Settings())
      ])
    ],
    builder: (context, state, navigationShell) =>
        ScaffoldWithNavBar(shell: navigationShell),
  ),
  GoRoute(path: signInPath, builder: (context, state) => const SignIn())
];

class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({super.key, required this.shell});
  final StatefulNavigationShell shell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(padding: EdgeInsets.all(10.0), child: shell)),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          ],
          onTap: (index) => shell.goBranch(index,
              initialLocation: index == shell.currentIndex),
        ));
  }
}
