import 'package:flutter/material.dart';

import 'package:systemk/Screens/helpers/helper.dart';



class Face extends StatefulWidget {
  const Face({Key? key}) : super(key: key);

  @override
  State<Face> createState() => _FaceState();
}

class _FaceState extends State<Face> {

  bool authenticated = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed:() async{
                  final authenticate= await LocalAuth.authenticate();
                  setState(() {
                    authenticated=authenticate;
                  });
                },
                child: Text(
                  'Authenticate by face id'
                )),

            if (authenticated)
              ElevatedButton(onPressed: (){
                setState(() {
                  authenticated=false;
                });
              }, child: Text(
                'Log out'
              )
              )
          ],
        ),
      ),
    );
  }
}
