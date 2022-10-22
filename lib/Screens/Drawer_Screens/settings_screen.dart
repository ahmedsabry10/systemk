
import 'dart:async';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:systemk/Data/Cubit/Home_Cubit/app_cubit.dart';
import 'package:systemk/Data/Cubit/Home_Cubit/app_states.dart';
import 'package:systemk/Data/Shared/Component/reusable_component.dart';
import 'package:systemk/Data/Shared/Styles/icon_broken.dart';


class EditProfileScreen extends StatefulWidget {
  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}



class _EditProfileScreenState extends State<EditProfileScreen> {
  var nameController = TextEditingController();

  var bioController = TextEditingController();

  var phoneController = TextEditingController();

  var emailController = TextEditingController();

  double? _height;
  double? _width;

  double percent = 0.0;

  @override
  void initState() {
    Timer? timer;
    timer = Timer.periodic(Duration(milliseconds: 300), (_) {
      setState(() {
        percent += 1;
        if (percent >= 100) {
          timer!.cancel();
          // percent=0;
        }
      });
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var userModel = AppCubit.get(context).userModel;

        var profileImageFile = AppCubit.get(context).profileImageFile;
        nameController.text = userModel!.name!;
        bioController.text = userModel.bio!;
        phoneController.text = userModel.phone!;
        emailController.text=userModel.email!;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Edit Profile'),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(IconBroken.Arrow___Left_2),
            ),
            titleSpacing: 5.0,
            actions: [
              TextButton(
                  onPressed: (){
                    AppCubit.get(context).updateUser(
                        name: nameController.text,
                        phone: phoneController.text,
                        bio: bioController.text);
                  },
                  child: const Text(
                    'UPDATE'
                  )
              ),
              const SizedBox(
                width: 15.0,
              ),
            ],
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ConditionalBuilder(
                  builder:(context )=> Column(
                    children: [

                      Container(
                        height: 200.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: NetworkImage(
                                  'https://media.istockphoto.com/vectors/letter-s-and-puddle-water-logo-template-design-vector-emblem-design-vector-id1329175476?k=20&m=1329175476&s=170667a&w=0&h=35yLGDKif6pjZ6o3mMziApSh9ebIT1nT-7QCESG7FM4='
                              )
                          ),



                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),


                      defaultFormFiled(
                        controller: nameController,
                        type: TextInputType.name,
                        validate: (String value) {
                          if (value.isEmpty) {
                            return 'name must not be empty';
                          }
                          return null;
                        },
                        label: 'الاسم',
                        prefix: IconBroken.User,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      defaultFormFiled(
                        controller: bioController,
                        type: TextInputType.text,
                        validate: (String value) {
                          if (value.isEmpty) {
                            return 'note must not be empty';
                          }
                          return null;
                        },
                        label: 'نوت ',
                        prefix: IconBroken.Info_Circle,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      defaultFormFiled(
                        controller: phoneController,
                        type: TextInputType.phone,
                        validate: (String value) {
                          if (value.isEmpty) {
                            return 'Phone Number must not be empty';
                          }
                          return null;
                        },
                        label: 'الهاتف',
                        prefix: IconBroken.Call,
                      ),

                      SizedBox(
                        height: 20.0,
                      ),
                      // if(state is UserUpdateLoadingState)




                    ],
                  ),
                  fallback: (context )=>Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 130,
                          width: 130,
                          child: LiquidCircularProgressIndicator(
                            value: percent / 100,
                            // Defaults to 0.5.
                            valueColor: AlwaysStoppedAnimation(Colors.blue),
                            backgroundColor: Colors.white,
                            borderColor: Colors.black54,
                            borderWidth: 4.0,
                            direction: Axis.vertical,
                            center: Text(
                              percent.toString() + "%",
                              style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  condition: state is! UserUpdateLoadingState


            ),
              ),
            ),
          ),
        );
      },
    );
  }
}