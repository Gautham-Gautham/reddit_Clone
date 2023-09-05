//loggedOut
//loggedIn

import 'package:flutter/material.dart';
import 'package:redit_clone/feature/auth/screens/login.dart';
import 'package:redit_clone/feature/community/screens/community_screen.dart';
import 'package:redit_clone/feature/home/home_screen.dart';
import 'package:routemaster/routemaster.dart';

final loggedOutRoute =
    RouteMap(routes: {'/': (_) => const MaterialPage(child: Login_Screen())});
final loggedInRoute =
    RouteMap(routes: {
      '/': (_) => const MaterialPage(child: HomeScreen()),
      '/create-community': (_) => const MaterialPage(child: CommunityScreen()),
      });
