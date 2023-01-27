


import 'package:flutter/material.dart';
import 'package:systemk/FaceTest/page/face_recognition/camera_page.dart';
import 'package:systemk/FaceTest/utils/local_db.dart';
import 'package:systemk/FaceTest/utils/utils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    printIfDebug(LocalDB.getUser().name);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("Face Authentication"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(32),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildButton(
                  text: 'Register',
                  icon: Icons.app_registration_rounded,
                  onClicked: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FaceScanScreen()));
                  },
                ),
                const SizedBox(height: 24),
                buildButton(
                  text: 'Login',
                  icon: Icons.login,
                  onClicked: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FaceScanScreen(
                                  user: LocalDB.getUser(),
                                )));
                  },
                ),
              ],
            ),
          ),
        ),
      );

  Widget buildButton({
    required String text,
    required IconData icon,
    required VoidCallback onClicked,
  }) =>
      Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey[600]?.withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
        ),
        child: MaterialButton(

          child: Text(
            text,
            style: const TextStyle(fontSize: 20),
          ),
          onPressed: onClicked,
        ),
      );
}
