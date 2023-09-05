import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:redit_clone/feature/auth/controller/auth_controller.dart';
import 'package:redit_clone/feature/home/drawers/community_list_drawer.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider)!;
    return Scaffold(
      appBar: AppBar(title: const Text("Home"),
      //leading: IconButton(onPressed: (){}, icon:const Icon(Icons.menu),),
      actions: [
        IconButton(onPressed: (){}, icon: const Icon(Icons.search)),
         IconButton(
           icon: CircleAvatar(
            backgroundImage:NetworkImage(user.profilePic) ,
            
                 ),
                 onPressed: (){},
         )
      ],
      ),
      drawer:const  CommunityListDrawer(),
      body: Center(
        child: Text(user.name),
      ),
    );
  }
}
