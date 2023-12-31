import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:redit_clone/feature/auth/controller/auth_controller.dart';
import 'package:redit_clone/theme/pallet.dart';

import '../constants/constants.dart';

class SignInPage extends ConsumerWidget {
  final BuildContext mainContext;
  const SignInPage({super.key,required this.mainContext});
  void signInWithGoogle(BuildContext context,WidgetRef ref){
    ref.read(authControllerProvider.notifier).signInWithGoogle(context);
  }

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: ElevatedButton.icon(
        onPressed: ()=>signInWithGoogle(mainContext,ref),
         icon: Image.asset(Constants.googlePath,width: 35,),
          label: const Text('Continue with google',style: TextStyle(fontSize: 18),),
          style: ElevatedButton.styleFrom(
            backgroundColor: Pallete.greyColor,
            minimumSize:const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40)
            )
          ),
      ),
    );
  }
}