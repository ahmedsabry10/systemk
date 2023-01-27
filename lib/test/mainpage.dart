import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:systemk/Data/Shared/Component/reusable_component.dart';
import 'package:systemk/Screens/Auth_Screens/login_screen.dart';
import 'package:systemk/TestDownload/download_home.dart';
import 'package:systemk/test/api.dart';
import 'package:systemk/test/buttom_widget.dart';

import '../Screens/Home_Screens/home_screen.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  UploadTask? task;
  File? file;

  @override
  Widget build(BuildContext context) {
    final fileName = file != null ? basename(file!.path) : 'No File Selected';

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            padding: EdgeInsets.all(32),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonWidget(
                    text: 'Select File',
                    icon: Icons.attach_file,
                    onClicked: selectFile,
                  ),
                  SizedBox(height: 20 ),
                  Text(
                    fileName,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 30),
                  ButtonWidget(
                    text: 'Upload File',
                    icon: Icons.cloud_upload_outlined,
                    onClicked: uploadFile,
                  ),
                  SizedBox(height: 20),
                  task != null ? buildUploadStatus(task!) : Container(),

                  SizedBox(height: 20.0,),
                  ButtonWidget(
                      icon: Icons.file_copy,
                      text: "Show Files",
                      onClicked: (){
                        navigateTo(context, DownloadMainPage());
                      }),
                  SizedBox(height: 20.0,),
                  Row(
                    children: [
                      Spacer(),
                      TextButton(
                          onPressed: (){
                       _signOut();
                       navigateAndFinish(context, LoginScreen());

                      },
                          child: Text(
                            'SignOut',
                            style: TextStyle(
                              color: Colors.blue
                            ),
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }


  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) return;
    final path = result.files.single.path!;

    setState(() => file = File(path));
  }

  Future uploadFile() async {
    if (file == null) return;

    final fileName = basename(file!.path);
    final destination = 'files/$fileName';

    task = FirebaseApi.uploadFile(destination, file!);
    setState(() {});

    if (task == null) return;

    final snapshot = await task!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();

    print('Download-Link: $urlDownload');
  }

  Widget buildUploadStatus(UploadTask task) => StreamBuilder<TaskSnapshot>(
    stream: task.snapshotEvents,
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        final snap = snapshot.data!;
        final progress = snap.bytesTransferred / snap.totalBytes;
        final percentage = (progress * 100).toStringAsFixed(2);

        return Text(
          '$percentage %',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        );
      } else {
        return Container();
      }
    },
  );
}