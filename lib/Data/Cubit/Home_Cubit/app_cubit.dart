import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:systemk/Data/Cubit/Home_Cubit/app_states.dart';
import 'package:systemk/Data/Models/alasnaf_model.dart';
import 'package:systemk/Data/Models/almandobin_model.dart';
import 'package:systemk/Data/Models/el3mlaa_model.dart';
import 'package:systemk/Data/Models/elmowrdiin_model.dart';
import 'package:systemk/Data/Models/user_model.dart';
import 'package:systemk/Data/Shared/Component/reusable_component.dart';
import 'package:systemk/Data/Shared/Constent/constent.dart';
import 'package:systemk/Data/Shared/Styles/icon_broken.dart';
import 'package:systemk/Screens/Home_Screens/Basics_Screens/Al3mlaa_Screens/al3mlaa_screen.dart';
import 'package:systemk/Screens/Home_Screens/Basics_Screens/Alasnaf_Screens/alasnaf_screen.dart';
import 'package:systemk/Screens/Home_Screens/Basics_Screens/Almandobin_Screens/almandobin_screen.dart';
import 'package:systemk/Screens/Home_Screens/Basics_Screens/Almowrdiin_Screens/almowrdiin.dart';
import 'package:systemk/Screens/Home_Screens/Basics_Screens/purchasesScreen.dart';
import 'package:systemk/Screens/Home_Screens/Basics_Screens/sales_screen.dart';
import 'package:firebase_storage/firebase_storage.dart'as firebase_storage;



class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialStates());

  static AppCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> screens = [
    SalesScreen(), //المبيعات
    purchasesScreen(),  // المشترياات
    TypesScreen(), //الاصناف
    ClintScreen(),
    RepresentativeScreen(), //العملاء
    SupplierScreen()
  ];

  String? valueChoose;
  List<String> listItem = [
    'مخزنى',
    'خدمى - بنود اعمال',
    'مجمع',
    'منتج تام',
    'متعدد'
  ];
  String? valueItem;

  void changeIndex(int index) {
    currentIndex = index;
    emit(AppChangeButtonNavBarState());
  }

  List<String> titlePages = [
    'مبيعات',
    'مشتريات',
    'الاصناف',
    'العملاء',
    'المندوبين',
    'الموردين',



  ];

  List<IconData> icons = [
    IconBroken.Bag,
    IconBroken.Buy,
    IconBroken.Paper,
    IconBroken.Work,
    IconBroken.Profile,
    IconBroken.User,


  ];





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



  //create Alasnaf


  TypesModel? typesModel ;


  void createItems({
    required String name,
    required String id,
    required String type,
    required String smallUnit,
    required String bigUnit,
    required String dateTime,
    required String openingCost,
    required String store,
    required String opiningStoreCost,
    required String limit,
    required String virtualSalesUnit,
    required String virtualPurchaseUnit,
    required String measurementUnit,
    required String itemCondition,
    required String effect,
  }) {
    emit(CreateItemLoadingState());

    TypesModel model = TypesModel(
      name: name,
      type: type,
      smallUnit: smallUnit,
      bigUnit: bigUnit,
      dateTime: dateTime,
      openingCost: openingCost,
      store: store,
      opiningStoreCost: opiningStoreCost,
      limit:limit,
      virtualSalesUnit:virtualSalesUnit,
      virtualPurchaseUnit:virtualPurchaseUnit,
      measurementUnit:measurementUnit,
      itemCondition:itemCondition,
      effect:effect,

    );

    FirebaseFirestore.instance.collection('users')
        .doc(userModel!.uId)
        .collection('items')
        .add(model.toMap())
        .then((value) {
      emit(CreateItemSuccessState());
    }).catchError((error) {
      emit(CreateItemErrorState());
    });
  }








  //creat almandoob  انشاء مندوب
  RepresentativeModel? representativeModel ;


  void createRepresentative({
    required String name,
    required String branch,
    required String delegateType,
    required String classification,
    required String admin,
    required String region,
    required String phoneNumber,
    required String condition,
    required String effect,
  }) {
    emit(CreateRepresentativeLoadingState());

    RepresentativeModel model = RepresentativeModel(
      name: name,
      branch: branch,
      delegateType:delegateType,
      classification:classification,
      admin:admin,
      region:region,
      phoneNumber:phoneNumber,
      condition:condition,
      effect:effect,

    );

    FirebaseFirestore.instance.collection('users')
        .doc(userModel!.uId)
        .collection('Representative')
        .add(model.toMap())
        .then((value) {
      emit(CreateRepresentativeSuccessState());
    }).catchError((error) {
      emit(CreateRepresentativeErrorState());
    });
  }






  //create suppliers

  SupplierModel? supplierModel ;


  void createSupplier({
    required String name,
    required String branch,
    required String region,
    required String phoneNumber,
    required String debtor,
    required String creditor,
    required String majorResource,
    required String status,
    required String condition,
    required String effect,
  }) {
    emit(CreateSupplierLoadingState());

    SupplierModel model = SupplierModel(
      name: name,
      branch: branch,
      region:region,
      phoneNumber:phoneNumber,
      debtor: debtor,
      creditor:creditor,
      status:status,
      majorResource:majorResource,
      condition:condition,
      effect:effect,

    );

    FirebaseFirestore.instance.collection('users')
        .doc(userModel!.uId)
        .collection('Suppliers')
        .add(model.toMap())
        .then((value) {
      emit(CreateSupplierSuccessState());
    }).catchError((error) {
      emit(CreateSupplierErrorState());
    });
  }







  // انشاء عميل جديد
  ClintModel? clintModel ;


  void createClint({
    required String name,
    required String branch,
    required String region,
    required String phoneNumber,
    required String debtor,
    required String creditor,
    required String status,
    required String condition,
    required String effect,
  }) {
    emit(CreateClintLoadingState());

    ClintModel model = ClintModel(
      name: name,
      branch: branch,
      region:region,
      phoneNumber:phoneNumber,
      debtor: debtor,
      creditor:creditor,
      status:status,
      condition:condition,
      effect:effect,

    );

    FirebaseFirestore.instance.collection('users')
        .doc(userModel!.uId)
        .collection('Clint')
        .add(model.toMap())
        .then((value) {
      emit(CreateClintSuccessState());
    }).catchError((error) {
      emit(CreateClintErrorState());
    });
  }
}



