import 'package:flutter/material.dart';
import 'package:systemk/Data/Shared/Component/reusable_component.dart';
import 'package:systemk/Screens/Home_Screens/Basics_Screens/Alasnaf_Screens/alasnaf_screen.dart';
import 'package:systemk/Screens/Home_Screens/Basics_Screens/Almowrdiin_Screens/almowrdiin.dart';
import 'package:systemk/Screens/Home_Screens/home_screen.dart';

class GetNewSupplier extends StatelessWidget {
  const GetNewSupplier({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
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
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(onPressed: (){
                      navigateAndFinish(context, SupplierScreen());
                    },
                        child: Text(
                            'ادخال مورد جديد'
                        )),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(onPressed: (){
                      navigateAndFinish(context, HomeScreen());

                    },
                        child: Text(
                            'الرجوع الى القائمه الرئيسيه'
                        )),
                  ),



                ],
              ),
            ),
          ),
        )
    );
  }
}
