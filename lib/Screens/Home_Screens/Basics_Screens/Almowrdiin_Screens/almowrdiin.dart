import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:systemk/Data/Cubit/Home_Cubit/app_cubit.dart';
import 'package:systemk/Data/Cubit/Home_Cubit/app_states.dart';
import 'package:systemk/Data/Shared/Styles/icon_broken.dart';
import 'package:systemk/Screens/Home_Screens/Basics_Screens/Almowrdiin_Screens/get_new_supplier.dart';
import 'package:systemk/Screens/Home_Screens/home_screen.dart';

import '../../../../Data/Shared/Component/reusable_component.dart';


class SupplierScreen extends StatefulWidget {
  const SupplierScreen({Key? key}) : super(key: key);

  @override
  State<SupplierScreen> createState() => _SupplierScreenState();
}

class _SupplierScreenState extends State<SupplierScreen> {
  String? type;
  List<String> listType = [
    'نقدى',
    'تجارى',
  ];

  var statusController = TextEditingController();
  String? status;
  List<String> listStatus = [
    'عميل',
    'مورد',
    'عميل ومورد',
  ];

  var conditionController = TextEditingController();
  String? condition;
  List<String> listActivity = [
    'نشط',
    'غير نشط',
  ];


  var branchController = TextEditingController();
  String? branch;
  List<String> listStore = [
    'المخزن الرئيسي',
    'مخزن اخر',
  ];


  var effectController = TextEditingController();
  String? effect;
  List<String> listEffect = [
    'نعم ',
    'لا',
  ];

  var formKey = GlobalKey<FormState>();

  var nameController = TextEditingController(); //الاسم
  // محافظه
  var debtorController = TextEditingController(); //مدين
  var creditorController = TextEditingController(); //دائن
  var regionController = TextEditingController(); //منطقه
  var phoneController = TextEditingController();
  var majorResourceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit ,AppStates>(
    listener: (context ,state){},
    builder: (context ,state){
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                navigateAndFinish(context,  HomeScreen());
              },
              icon: const Icon(IconBroken.Arrow___Left_2)),
          centerTitle: true,
          title: const Text('ادخل مورد جديد'),

        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  //اسم العميل
                  const Text(
                    'اسم المورد',
                    style: TextStyle(fontSize: 15.0),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: nameController,
                    keyboardType: TextInputType.name,
                    enabled: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "من فضلك ادخل اسم المورد";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      contentPadding:
                      const EdgeInsets.fromLTRB(18.0, 10.0, 18.0, 10.0),
                      hintText: 'اسم المورد',
                      hintStyle: const TextStyle(
                        fontStyle: FontStyle.italic,
                      ),
                      prefixIcon: const Icon(
                        IconBroken.Profile,
                        color: Colors.blue,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                          width: .5,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                          width: .5,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),

                  //المخازن

                  const Text(
                    'الفرع',
                    style: TextStyle(fontSize: 15.0),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Center(
                    child: Container(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      decoration: BoxDecoration(
                          border:
                          Border.all(
                              color: Colors.blue,
                              width: 0.5),
                          borderRadius: BorderRadius.circular(15.0)),
                      child: DropdownButton<String>(
                        hint: const Text(
                          'اختر المخزن',
                          style: TextStyle(fontSize: 15.0),
                        ),
                        dropdownColor: Colors.white,
                        icon: const Icon(
                          IconBroken.Arrow___Down_2,
                          color: Colors.blue,
                        ),
                        iconSize: 20,
                        isExpanded: true,
                        underline: const SizedBox(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                        ),
                        value: branch,
                        onChanged: (newValue) {
                          setState(() {
                            branch = newValue;
                            branchController.text=newValue!;
                          });
                        },
                        items: listStore.map((valueItem) {
                          return DropdownMenuItem(
                            value: valueItem,
                            child: Text(
                              valueItem,
                              style: const TextStyle(fontSize: 15.0),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),

                  //حاله المورد

                  const Text(
                    'حاله المورد',
                    style: TextStyle(fontSize: 15.0),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Center(
                    child: Container(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      decoration: BoxDecoration(
                          border:
                          Border.all(
                              color: Colors.blue,
                              width: 0.5),
                          borderRadius: BorderRadius.circular(15.0)),
                      child: DropdownButton<String>(
                        hint: const Text(
                          'اختر حاله المورد',
                          style: TextStyle(fontSize: 15.0),
                        ),
                        dropdownColor: Colors.white,
                        icon: const Icon(
                          IconBroken.Arrow___Down_2,
                          color: Colors.blue,
                        ),
                        iconSize: 20,
                        isExpanded: true,
                        underline: const SizedBox(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                        ),
                        value: status,
                        onChanged: (newValue) {
                          setState(() {
                            status = newValue;
                            statusController.text=newValue!;
                          });
                        },
                        items: listStatus.map((valueItem) {
                          return DropdownMenuItem(
                            value: valueItem,
                            child: Text(
                              valueItem,
                              style: const TextStyle(fontSize: 15.0),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),

                  //المنطقه

                  const Text(
                    'المنطقه',
                    style: TextStyle(fontSize: 15.0),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: regionController,
                    keyboardType: TextInputType.name,
                    enabled: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "من فضلك ادخل اسم المنطقه";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      contentPadding:
                      const EdgeInsets.fromLTRB(18.0, 10.0, 18.0, 10.0),
                      hintText: ' المنطقه',
                      hintStyle: const TextStyle(
                        fontStyle: FontStyle.italic,
                      ),
                      prefixIcon: const Icon(
                        Icons.place_outlined,
                        color: Colors.blue,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                          width: .5,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                          width: .5,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),

                  // رقم الهاتف
                  const Text(
                    'رقم الهاتف',
                    style: TextStyle(fontSize: 15.0),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    enabled: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "من فضلك ادخل رقم الهاتف";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      contentPadding:
                      const EdgeInsets.fromLTRB(18.0, 10.0, 18.0, 10.0),
                      hintText: ' 0123456789',
                      hintStyle: const TextStyle(
                        fontStyle: FontStyle.italic,
                      ),
                      prefixIcon: const Icon(
                        IconBroken.Call,
                        color: Colors.blue,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                          width: .5,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                          width: .5,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),



                  //افتتاحى مدين
                  const Text(
                    'افتتاحى مدين ',
                    style: TextStyle(fontSize: 15.0),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: debtorController,
                    keyboardType: TextInputType.phone,
                    enabled: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "من فضلك لا تترك القائمه فارغه";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      contentPadding:
                      const EdgeInsets.fromLTRB(18.0, 10.0, 18.0, 10.0),
                      hintText: ' 0',
                      hintStyle: const TextStyle(
                        fontStyle: FontStyle.italic,
                      ),
                      prefixIcon: const Icon(
                        IconBroken.Paper_Plus,
                        color: Colors.blue,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                          width: .5,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                          width: .5,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),

                  //افتتاحى دائن
                  const Text(
                    'افتتاحى دائن ',
                    style: TextStyle(fontSize: 15.0),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: creditorController,
                    keyboardType: TextInputType.phone,
                    enabled: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "من فضلك لا تترك القائمه فارغه";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      contentPadding:
                      const EdgeInsets.fromLTRB(18.0, 10.0, 18.0, 10.0),
                      hintText: ' 0',
                      hintStyle: const TextStyle(
                        fontStyle: FontStyle.italic,
                      ),
                      prefixIcon: const Icon(
                        IconBroken.Paper_Negative,
                        color: Colors.blue,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                          width: .5,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                          width: .5,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),

                  //مورد رئيسي
                  const Text(
                    'مورد رئيسي ',
                    style: TextStyle(fontSize: 15.0),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: majorResourceController,
                    keyboardType: TextInputType.name,
                    enabled: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "من فضلك لا تترك القائمه فارغه";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      contentPadding:
                      const EdgeInsets.fromLTRB(18.0, 10.0, 18.0, 10.0),
                      hintText: ' مورد رئيسي',
                      hintStyle: const TextStyle(
                        fontStyle: FontStyle.italic,
                      ),
                      prefixIcon: const Icon(
                        Icons.man_outlined,
                        color: Colors.blue,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                          width: .5,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                          width: .5,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),

                  //حاله المورد
                  const Text(
                    'حاله المورد',
                    style: TextStyle(fontSize: 15.0),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Center(
                    child: Container(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      decoration: BoxDecoration(
                          border:
                          Border.all(
                              color: Colors.blue,
                              width: 0.5),
                          borderRadius: BorderRadius.circular(15.0)),
                      child: DropdownButton<String>(
                        hint: const Text(
                          'حاله المورد',
                          style: TextStyle(fontSize: 15.0),
                        ),
                        dropdownColor: Colors.white,
                        icon: const Icon(
                          IconBroken.Arrow___Down_2,
                          color: Colors.blue,
                        ),
                        iconSize: 20,
                        isExpanded: true,
                        underline: const SizedBox(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                        ),
                        value: condition,
                        onChanged: (newValue) {
                          setState(() {
                            condition = newValue;
                            conditionController.text=newValue!;
                          });
                        },
                        items: listActivity.map((valueItem) {
                          return DropdownMenuItem(
                            value: valueItem,
                            child: Text(
                              valueItem,
                              style: const TextStyle(fontSize: 15.0),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),

                  //التاثير على الحسابات العامه
                  const Text(
                    ' التاثير على الحسابات العامه',
                    style: TextStyle(fontSize: 15.0),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Center(
                    child: Container(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      decoration: BoxDecoration(
                          border:
                          Border.all(
                              color: Colors.blue,
                              width: 0.5),
                          borderRadius: BorderRadius.circular(15.0)),
                      child: DropdownButton<String>(
                        hint: const Text(
                          'التاثير',
                          style: TextStyle(fontSize: 15.0),
                        ),
                        dropdownColor: Colors.white,
                        icon: const Icon(
                          IconBroken.Arrow___Down_2,
                          color: Colors.blue,
                        ),
                        iconSize: 20,
                        isExpanded: true,
                        underline: const SizedBox(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                        ),
                        value: effect,
                        onChanged: (newValue) {
                          setState(() {
                            effect = newValue;
                            effectController.text=newValue!;
                          });
                        },
                        items: listEffect.map((valueItem) {
                          return DropdownMenuItem(
                            value: valueItem,
                            child: Text(
                              valueItem,
                              style: const TextStyle(fontSize: 15.0),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),

                  ConditionalBuilder(
                    condition:state is! CreateSupplierLoadingState ,
                    builder:(context)=> Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        child: const Text(
                          'حفظ',
                        ),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            AppCubit.get(context).createSupplier(
                                name: nameController.text,
                                branch: branchController.text,
                                region: regionController.text,
                                phoneNumber: phoneController.text,
                                debtor: debtorController.text,
                                creditor: creditorController.text,
                                majorResource: majorResourceController.text,
                                status: statusController.text,
                                condition: conditionController.text,
                                effect: effectController.text
                            );
                            navigateAndFinish(context, GetNewSupplier());
                          }
                        },
                      ),
                    ),
                    fallback: (context)=>const Center(child:  CupertinoActivityIndicator()),
                  ),

                ],
              ),
            ),
          ),
        ),
      );

    },
    );
  }
}
