import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:redit_clone/core/constants/constants.dart';
import 'package:redit_clone/core/constants/firebase_constants.dart';
import 'package:redit_clone/core/failure.dart';
import 'package:redit_clone/core/providers/firebase_providers.dart';
import 'package:redit_clone/model/user_model.dart';

import '../../../core/type_def.dart';

final authRepositoryProvider = Provider((ref) => Auth_Repository(
    firestore: ref.read(fireStroeProvider),
    auth: ref.read(authProvider),
    googleSignIn: ref.read(googleSigninProvider)));

class Auth_Repository {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;

  Auth_Repository(
      {required FirebaseFirestore firestore,
      required FirebaseAuth auth,
      required GoogleSignIn googleSignIn})
      : _auth = auth,
        _firestore = firestore,
        _googleSignIn = googleSignIn;

  CollectionReference get _users =>
      _firestore.collection(FirebaseConstants.usersCollection);

      Stream<User?> get authStateChange =>_auth.authStateChanges();

  FutureEither<UserModel> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser?.authentication;
      final Credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
      UserCredential userCredential =
          await _auth.signInWithCredential(Credential);
       UserModel userModel;

      if (userCredential.additionalUserInfo!.isNewUser) {
        userModel = UserModel(
            name: userCredential.user!.displayName ?? 'NO Name',
            profilePic:
                userCredential.user!.photoURL ?? Constants.avatarDefault,
            banner: Constants.bannerDefault,
            uid: userCredential.user!.uid,
            isAuthenticated: true,
            karma: 0,
            awards: []);
        await _users.doc(userCredential.user!.uid).set(userModel.toMap());
      } else {
        userModel =await getUserData(userCredential.user!.uid).first;
      }
      return right(userModel);
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
  Stream<UserModel> getUserData(String uid){
    return _users.doc(uid).snapshots().map((event) => UserModel.fromMap(event.data()as Map<String,dynamic>));
  }
}