import 'package:flutter/material.dart';
import 'package:systemk/Data/Shared/Component/reusable_component.dart';
import 'package:systemk/Screens/Auth_Screens/login.dart';
import 'package:systemk/Screens/Auth_Screens/login_screen.dart';
import 'package:systemk/Screens/helpers/helper.dart';


class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool showBiometric = false;
  bool isAuthenticated = false;
  @override
  void initState() {
    isBiometricsAvailable();
    super.initState();
  }

  isBiometricsAvailable() async {
    showBiometric = await BiometricHelper().hasEnrolledBiometrics();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (showBiometric)
              ElevatedButton(
                child: const Text(
                  'FingerPrint Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                onPressed: () async {
                  isAuthenticated = await BiometricHelper().authenticate();
                  setState(() {
                    if (isAuthenticated)
                      navigateAndFinish(context, LoginScreen());

                  });
                },
              ),


          ],
        ),
      ),
    );
  }
}