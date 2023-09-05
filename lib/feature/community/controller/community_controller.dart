import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:redit_clone/core/constants/constants.dart';
import 'package:redit_clone/core/utils.dart';
import 'package:redit_clone/feature/auth/controller/auth_controller.dart';
import 'package:redit_clone/feature/community/repository/community_repository.dart';
import 'package:redit_clone/model/community_model.dart';
import 'package:routemaster/routemaster.dart';

final CommunityControllerProvider =
    StateNotifierProvider<CommunityController, bool>((ref) {
  final communityRepository = ref.watch(communityRepositoryProvider);
  return CommunityController(
      communityRepository: communityRepository, ref: ref);
});

class CommunityController extends StateNotifier<bool> {
  final CommunityRepository _communityRepository;
  final Ref _ref;
  CommunityController(
      {required CommunityRepository communityRepository, required Ref ref})
      : _communityRepository = communityRepository,
        _ref = ref,
        super(false);

  void createCommunity(String name, BuildContext context) async {
    state = true;
    final uid = _ref.read(userProvider)?.uid ?? '';
    Community community = Community(
        id: name,
        name: name,
        banner: Constants.bannerDefault,
        avatar: Constants.avatarDefault,
        member: [uid],
        mods: [uid]);
    final res = await _communityRepository.createCommunity(community);
    state = false;
    res.fold((l) => showSnackBar(context, l.message), (r) {
      showSnackBar(context, 'Community created successfully!');
      Routemaster.of(context).pop();
    });
  }
}
