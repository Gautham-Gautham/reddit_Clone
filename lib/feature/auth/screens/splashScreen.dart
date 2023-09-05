import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:redit_clone/core/common/loader.dart';
import 'package:redit_clone/feature/auth/controller/auth_controller.dart';
import 'package:redit_clone/feature/auth/screens/login.dart';
import 'package:redit_clone/feature/home/home_screen.dart';
import 'package:redit_clone/model/user_model.dart';

// class SplashScreen extends StatefulWidget {
//   final getData;
//   final userModel;
//   final data;
//   SplashScreen({
//     super.key,
//     required this.getData,
//     required this.userModel,
//     required this.data,
//   });

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   getLocalStatus() {
//     if (widget.data != null) {
//       widget.getData();
//       if (widget.userModel != null) {
//         Navigator.pushAndRemoveUntil(
//             context,
//             MaterialPageRoute(
//               builder: (context) => const HomeScreen(),
//             ),
//             (route) => false);
//       }
//     } else {
//       Navigator.pushAndRemoveUntil(
//           context,
//           MaterialPageRoute(
//             builder: (context) => const Login_Screen(),
//           ),
//           (route) => false);
//     }
//   }

//   @override
//   void initState() {
//     Timer(const Duration(seconds: 3), () {
//       getLocalStatus();
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return const Loader();
//   }
// }

class Root extends ConsumerStatefulWidget {
  final data;
  Root({
    super.key,
    required this.data,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RootState();
}

class _RootState extends ConsumerState<Root> {
  UserModel? userModel;
  getData(WidgetRef ref, User data) async {
    userModel = await ref
        .watch(authControllerProvider.notifier)
        .getUserData(data.uid)
        .first;
    ref.watch(userProvider.notifier).update((state) => userModel);
    setState(() {});
  }

  getLocalStatus() {
    if (widget.data != null) {
      getData(ref, widget.data);
      if (userModel != null) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
            (route) => false);
      }
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const Login_Screen(),
          ),
          (route) => false);
    }
  }
    @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      getLocalStatus();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Loader();
  }
}
