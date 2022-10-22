import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:systemk/Data/Cubit/Home_Cubit/app_cubit.dart';
import 'package:systemk/Data/Cubit/Home_Cubit/app_states.dart';
import 'package:systemk/Data/Shared/Component/reusable_component.dart';
import 'package:systemk/Data/Shared/Network/cache_helper.dart';
import 'package:systemk/Data/Shared/Styles/icon_broken.dart';
import 'package:systemk/Screens/Auth_Screens/login_screen.dart';
import 'package:systemk/Screens/Drawer_Screens/settings_screen.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit ,AppStates>(
      listener:(context ,state){} ,
      builder: (context ,state){
        return AdvancedDrawer(
          backdropColor: HexColor('#21618C'),
          controller: _advancedDrawerController,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 300),
          animateChildDecoration: true,
          rtlOpening: false,
          // openScale: 1.0,
          disabledGestures: false,
          childDecoration: const BoxDecoration(
            // NOTICE: Uncomment if you want to add shadow behind the page.
            // Keep in mind that it may cause animation jerks.
            // boxShadow: <BoxShadow>[
            //   BoxShadow(
            //     color: Colors.black12,
            //     blurRadius: 0.0,
            //   ),
            // ],
            borderRadius:  BorderRadius.all(Radius.circular(16)),
          ),
          drawer: SafeArea(
            child: Container(
              child: ListTileTheme(
                textColor: Colors.white,
                iconColor: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [

                      const Spacer(),

                      ListTile(
                        onTap: () {},
                        leading: const Icon(
                          Icons.shop_2_outlined,
                        ),
                        title: const Text('مبيعات'),
                      ),
                      const SizedBox(height: 16),

                      ListTile(
                        onTap: () {},
                        leading: const Icon(IconBroken.Buy,
                        ),
                        title: const Text('مشتريات'),
                      ),
                      const SizedBox(height: 16),

                      ListTile(
                        onTap: () {},
                        leading: const Icon(    IconBroken.Filter,),
                        title: const Text('اجمالى خزينه'),
                      ),
                      const SizedBox(height: 16),



                      ListTile(
                        onTap: () {},
                        leading: const Icon(    IconBroken.Paper,),
                        title: const Text(    'مديونيات العملاء',),
                      ),

                      const SizedBox(height: 16),

                      ListTile(
                        onTap: () {
                          navigateTo(context, EditProfileScreen());
                        },
                        leading: const Icon(    IconBroken.Setting,),
                        title: const Text(    'تعديل البيانات',),
                      ),


                      //الخطوط
                      const SizedBox(height: 16),
                      defaultLine(),
                      const SizedBox(height: 5),
                      defaultLine(),
                      const SizedBox(height: 16),



                      //تسجيل خروج من الايميل
                      ListTile(
                        onTap: () {
                          CacheHelper.removeData(key: 'uId').then((value) {
                            navigateAndFinish(context, LoginScreen());
                           }
                          );
                         },
                        leading: const Icon(    IconBroken.Logout,),
                        title: const Text(    ' تسجيل الخروج ',),
                      ),
                      const SizedBox(height: 16),


                      // قفل البرنامج خالص
                      ListTile(
                        onTap: () => exit(0),
                        leading: const Icon(    IconBroken.Close_Square,),
                        title: const Text( ' اغلاق البرنامج ',),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ),
          ),
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: _handleMenuButtonPressed,
                icon: ValueListenableBuilder<AdvancedDrawerValue>(
                  valueListenable: _advancedDrawerController,
                  builder: (_, value, __) {
                    return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 250),
                      child: Icon(
                        value.visible ? IconBroken.Close_Square : IconBroken.More_Square,
                        key: ValueKey<bool>(value.visible),
                      ),
                    );
                  },
                ),
              ),
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.white60,
                  child: GridView.count(

                    crossAxisCount: 2,
                    shrinkWrap: true ,
                    physics: const NeverScrollableScrollPhysics(),
                    mainAxisSpacing: 1.0,
                    crossAxisSpacing: 1.0,
                    childAspectRatio: 1 / 1.40,
                    children: List.generate(AppCubit.get(context).icons.length, (index) => buildGridProduct(context,
                      title: AppCubit.get(context).titlePages[index],
                      icons: AppCubit.get(context).icons[index],
                      screens: AppCubit.get(context).screens[index],

                    )),
                  ),
                ),
              ),
            ),

          ),
        );

      },
    );
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }

  Widget buildGridProduct(context, {
    String? title,
    IconData? icons,
    Widget? screens,

  }
      )=>InkWell(
    onTap: ({
      int index=0,
    }){
      navigateTo(context, screens);

      AppCubit.get(context).changeIndex(index);
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 5.0,
          vertical: 10.0
      ),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 5.0,
        color: Colors.grey[200],
        margin: const EdgeInsets.symmetric(
          horizontal: 2.0,

        ),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child:Center(
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: 8.0,
                    color: Colors.white60,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 2.0,

                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(icons,
                        color: HexColor('#0C5C93'),
                        size: 120,

                      ),
                    ),
                  ),
                )
            ),

            const SizedBox(
              height: 10.0,
            ),

            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(

                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      elevation: 5.0,
                      color: HexColor('#0C5C93'),
                      margin: const EdgeInsets.symmetric(
                        horizontal: 2.0,

                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: double.infinity,
                          child: Center(
                            child: Text(
                              '${title}',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 14.0,
                                height: 1.3,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                              ),

                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 10.0,
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}


