import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommunityScreen extends ConsumerStatefulWidget {
  const CommunityScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends ConsumerState<CommunityScreen> {
  final communityNameController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Create a community",),centerTitle: true,),
      body: Padding(
        padding:  const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Text("Community name")),
              const SizedBox(height: 10,),
              TextField(
                controller: communityNameController,
                decoration: const InputDecoration(
                  hintText: 'r/Community_name',
                  filled: true,
                  border: InputBorder.none,
                  contentPadding:EdgeInsets.all(18)
                ),
                maxLength: 21,
              ),
               const SizedBox(height: 30,),
               ElevatedButton(onPressed: (){

               }, 
               style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                )
               ),
               child: const Text('Create community'),
               )
          ],
        ),
      ),
    );
  }
}