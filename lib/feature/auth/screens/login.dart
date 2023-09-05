import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:redit_clone/core/common/loader.dart';
import 'package:redit_clone/core/common/signup_Button.dart';
import 'package:redit_clone/feature/auth/controller/auth_controller.dart';

import '../../../core/constants/constants.dart';

class Login_Screen extends ConsumerWidget {
  const Login_Screen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final isLoading=ref.watch(authControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          Constants.logoPath,
          height: 40,
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: const Text(
                'Skip',
                style: TextStyle(fontWeight: FontWeight.bold),
              ))
        ],
      ),
      body:isLoading?const Loader() : Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          const Text(
            "Dive into anything",
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: 0.5),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              Constants.loginEmotePath,
              height: 400,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
           SignInPage(mainContext: context,),
        ],
      ),
    );
  }
}
