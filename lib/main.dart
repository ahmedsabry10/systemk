
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:systemk/Data/Cubit/Home_Cubit/app_cubit.dart';
import 'package:systemk/Data/Shared/Network/cache_helper.dart';
import 'package:systemk/Screens/Auth_Screens/login_screen.dart';
import 'package:systemk/Screens/Home_Screens/home_screen.dart';
import 'package:systemk/Screens/views/face.dart';
import 'package:systemk/Screens/views/home_views.dart';
import 'package:systemk/test/mainpage.dart';

import 'Data/Shared/Constent/constent.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await CacheHelper.init();
  Widget widget;

  uId = CacheHelper.getData(key: 'uId');
  if(uId != null)
  {
    widget = HomeScreen();
  } else
  {
    widget = LoginScreen();
  }


  runApp(MyApp(
    startWidget:widget,

  ));
}

class MyApp extends StatelessWidget {


  final Widget startWidget;

  MyApp({
    required this.startWidget,
  });


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>AppCubit()..getUserData(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch:Colors.blue ,
            scaffoldBackgroundColor:Colors.white,
            appBarTheme: const AppBarTheme(
                titleSpacing: 20.0,
                backgroundColor: Colors.white,
                elevation: 0.0,
                backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarIconBrightness: Brightness.dark,
                  statusBarColor: Colors.white,
                ),
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
                iconTheme: IconThemeData(
                  color: Colors.black,
                )
            ),
            bottomNavigationBarTheme:  const BottomNavigationBarThemeData(
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.grey,
              backgroundColor: Colors.white,
            ),
            textTheme: const TextTheme(
                bodyText1: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
                subtitle1: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    height: 1.3
                )
            ),
            fontFamily: 'Jannah'
        ),
        debugShowCheckedModeBanner: false,
        home: HomeView(),
      ),
    );
  }
}


