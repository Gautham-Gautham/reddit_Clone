import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:redit_clone/core/constants/firebase_constants.dart';
import 'package:redit_clone/core/failure.dart';
import 'package:redit_clone/core/providers/firebase_providers.dart';
import 'package:redit_clone/model/community_model.dart';

import '../../../core/type_def.dart';



final communityRepositoryProvider = Provider((ref) {
  return CommunityRepository(firestore: ref.watch(fireStroeProvider));
});

class CommunityRepository {
  final FirebaseFirestore _firestore;
  CommunityRepository({required FirebaseFirestore firestore})
      : _firestore = firestore;
  FutureVoid createCommunity(Community community) async {
    try {

      var communityDoc =await _communities.doc(community.name).get();
      if(communityDoc.exists){
        throw 'Community with the same name is exists..!';
      }

      return right(_communities.doc(community.name).set(community.toMap()));              

    } on FirebaseException catch (e) {
      return left(Failure(e.message!));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }


  CollectionReference get _communities => _firestore.collection(FirebaseConstants.communitiesCollection);
}
