import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'package:onze_cafe/screens/edit_profile/edit_profile_screen.dart';

import '../../model/profile.dart';
import '../../reusable_components/animated_snackbar.dart';
import '../../supabase/client/supabase_mgr.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(BuildContext context) : super(ProfileInitial());

  Profile? profile = SupabaseMgr.shared.currentProfile;

  navigateToEditProfile(BuildContext context) =>
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => EditProfileScreen(profile: profile)));

  void showSnackBar(
      BuildContext context, String msg, AnimatedSnackBarType type) {
    if (context.mounted) {
      animatedSnakbar(msg: msg, type: type).show(context);
    }
  }

  void emitLoading() => LoadingState();
  void emitUpdate() => emit(UpdateUIState());
}
