abstract class AppStates{}
class AppInitialStates extends AppStates{}
class AppChangeButtonNavBarState extends AppStates{}
class AppChangeItemState extends AppStates{}
class AppChangeModeStates extends AppStates{}
class AppChangeSwitchStates extends AppStates{}
class AppChangeColorIconStates extends AppStates{}
class AppChangeBottomSheetState extends AppStates{}
class ChangeDateDoneState extends AppStates{}



// get users
class GetUserLoadingState extends AppStates {}

class GetUserSuccessState extends AppStates {}

class GetUserErrorState extends AppStates
{
  final String error;

  GetUserErrorState(this.error);
}


// get  all users
class GetAllUsersLoadingState extends AppStates {}

class GetAllUsersSuccessState extends AppStates {}

class GetAllUsersErrorState extends AppStates
{
  final String error;

  GetAllUsersErrorState(this.error);
}


//update user
class UserUpdateLoadingState extends AppStates {}
class UserUpdateErrorState extends AppStates {}


//profile image

class ProfileImagePickedSuccessState extends AppStates {}
class ProfileImagePickedErrorState extends AppStates {}
class UploadProfileImageErrorState extends AppStates{}
class UploadProfileImageSuccessState extends AppStates{}


//alasnaf
class CreateItemLoadingState extends AppStates {}
class CreateItemSuccessState extends AppStates {}
class CreateItemErrorState extends AppStates {}

//almandobeen
class CreateRepresentativeLoadingState extends AppStates {}
class CreateRepresentativeSuccessState extends AppStates {}
class CreateRepresentativeErrorState extends AppStates {}

//supplier
class CreateSupplierLoadingState extends AppStates {}
class CreateSupplierSuccessState extends AppStates {}
class CreateSupplierErrorState extends AppStates {}

//Clints
class CreateClintLoadingState extends AppStates {}
class CreateClintSuccessState extends AppStates {}
class CreateClintErrorState extends AppStates {}


//get clint
class GetClintLoadingState extends AppStates {}
class GetClintSuccessState extends AppStates {}
class GetClintErrorState extends AppStates {}

//get Items

class GetItemsLoadingState extends AppStates {}
class GetItemsSuccessState extends AppStates {}
class GetItemsErrorState extends AppStates {}

