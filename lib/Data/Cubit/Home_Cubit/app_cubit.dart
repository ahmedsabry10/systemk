import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:systemk/Data/Cubit/Home_Cubit/app_states.dart';


import 'package:systemk/Data/Models/user_model.dart';
import 'package:systemk/Data/Shared/Component/reusable_component.dart';
import 'package:systemk/Data/Shared/Constent/constent.dart';
import 'package:systemk/Data/Shared/Styles/icon_broken.dart';

import 'package:firebase_storage/firebase_storage.dart'as firebase_storage;



class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialStates());

  static AppCubit get(context) => BlocProvider.of(context);






  IconData fabIcon = IconBroken.Arrow___Down_2;
  bool isBottomSheetShown = false;
  void changeBottomSheetState({
    required bool isShow,
    required IconData icon,
  }){
    isBottomSheetShown=isShow;
    fabIcon =icon ;
    emit(AppChangeBottomSheetState());
  }


  UserModel? userModel ;



  void getUserData() {
    emit(GetUserLoadingState());
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      userModel = UserModel.fromJson(value.data()!);

      print(value.data());
      emit(GetUserSuccessState());
    }).catchError((error) {
      emit(GetUserErrorState(error.toString()));
      print(error.toString());
    });
  }

  // update users
  void updateUser({
    required String? name,
    required String? phone,
    required String? bio,
    String? cover,
    String? image,
  }) {
    emit(UserUpdateLoadingState());
    UserModel socialUserModel = UserModel(
      uId: uId,
      email: userModel!.email ?? 'your mail',
      image: image ??
          userModel!.image ??
          'https://img.freepik.com/premium-photo/3d-rendering-3d-illustration-people-avatar-icon-isolated-white-background_640106-552.jpg?size=626&ext=jpg&uid=R78364619&ga=GA1.2.140343669.1662316312',
      cover: cover ??
          userModel!.cover ??
          'https://img.freepik.com/free-photo/abstract-luxury-gradient-blue-background-smooth-dark-blue-with-black-vignette-studio-banner_1258-82801.jpg?size=626&ext=jpg&uid=R78364619&ga=GA1.2.140343669.1662316312',
      name: name ?? 'Name',
      phone: phone ?? 'Number Phone',
      bio: bio ?? 'your bio',
      isEmailVerified: false,
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .update(socialUserModel.toMap())
        .then((value) {
      getUserData();
    }).catchError((error) {
      print(error.toString());
      emit(UserUpdateErrorState());
    });
  }


  final ImagePicker picker = ImagePicker();


  //تغيير البروفايل
  XFile? profileImage;
  File? profileImageFile;

  Future<void> getProfileImage() async {
    profileImage = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (profileImage != null) {
      profileImageFile = File(profileImage!.path);

      emit(ProfileImagePickedSuccessState());
    } else {
      showToast(text: 'No image selected', state: ToastStates.WARNING);
      emit(ProfileImagePickedErrorState());
    }
  }

  String profileImageUrl = '';
  void uploadProfileImage({
    required String? name,
    required String? phone,
    required String? bio,
  }) async {
    emit(UserUpdateLoadingState());
    await firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/chats/${Uri.file(profileImage!.path).pathSegments.last}')
        .putFile(profileImageFile!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        profileImageUrl = value;
        updateUser(
          name: name,
          phone: phone,
          bio: bio,
          image: value,
        );
        // emit(SocialUploadProfileImageSuccessState());
      }).catchError((error) {
        emit(UploadProfileImageErrorState());
        print(error.toString());
      });
    }).catchError((error) {
      emit(UploadProfileImageErrorState());
      print(error.toString());
    });
  }






}
