import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:systemk/Data/Cubit/Home_Cubit/app_cubit.dart';
import 'package:systemk/Data/Cubit/Home_Cubit/app_states.dart';
import 'package:systemk/Data/Shared/Component/reusable_component.dart';
import 'package:systemk/Data/Shared/Styles/icon_broken.dart';
import 'package:systemk/Screens/Home_Screens/Basics_Screens/Alasnaf_Screens/get_new_items_or_not.dart';
import 'package:systemk/Screens/Home_Screens/Basics_Screens/Almandobin_Screens/get_new_mandoob.dart';
import 'package:systemk/Screens/Home_Screens/home_screen.dart';


class RepresentativeScreen extends StatefulWidget {
  const RepresentativeScreen({Key? key}) : super(key: key);

  @override
  State<RepresentativeScreen> createState() => _RepresentativeScreenState();
}

class _RepresentativeScreenState extends State<RepresentativeScreen> {


  //الفرع
  var branchController = TextEditingController(); // branch
  String? branch;
  List<String> listStore = [
    'المخزن الرئيسي',
    'مخزن اخر',
  ];

  //نوع المندوب
  var delegateTypeController = TextEditingController();
  String? delegateType;
  List<String> listTypeS = [
    'داخلى',
    'خارجى',
  ];


  //تصنيف المندوب
  var classificationController = TextEditingController();
  String? classification;
  List<String> listTasnif = ['بيع', 'شراء', 'بيع و شراء'];


  //حاله المندوب
  var conditionController = TextEditingController();
  String? condition;
  List<String> listActivity = [
    'نشط',
    'غير نشط',
  ];


  //التاثير على الحسابات العامه
  var effectController = TextEditingController();
  String? effect;
  List<String> listEffect = [
    'نعم ',
    'لا',
  ];


  String? type;
  List<String> listType = [
    'نقدى',
    'تجارى',
  ];














  var formKey = GlobalKey<FormState>();

  var nameController = TextEditingController(); //الاسم
  var governorateController = TextEditingController(); //
  // محافظه
  var regionController = TextEditingController();

  var debtorController = TextEditingController(); //مدين
  var creditorController = TextEditingController(); //دائن
  var adminController = TextEditingController(); //منطقه
  var phoneController = TextEditingController();
  var supplierController = TextEditingController(); //هاتف

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
          title: const Text('ادخل مندوب جديد'),

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
                  //اسم المندوب
                  const Text(
                    'اسم المندوب',
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
                        return "من فضلك ادخل اسم المندوب";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      contentPadding:
                      const EdgeInsets.fromLTRB(18.0, 10.0, 18.0, 10.0),
                      hintText: 'اسم المندوب',
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

                  //نوع المندوب
                  const Text(
                    'نوع المندوب',
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
                          ' نوع المندوب',
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
                        value: delegateType,
                        onChanged: (newValue) {
                          setState(() {
                            delegateType = newValue;
                            delegateTypeController.text=newValue!;
                          });
                        },
                        items: listTypeS.map((valueItem) {
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

                  //تصنيف المندوب
                  const Text(
                    'تصنيف المندوب',
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
                          ' تصنيف المندوب',
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
                        value: classification,
                        onChanged: (newValue) {
                          setState(() {
                            classification = newValue;
                            classificationController.text=newValue!;
                          });
                        },
                        items: listTasnif.map((valueItem) {
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

                  // المشرف
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text(
                    'المشرف ',
                    style: TextStyle(fontSize: 15.0),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: adminController,
                    keyboardType: TextInputType.name,
                    enabled: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "من فضلك ادخل اسم المشرف";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      contentPadding:
                      const EdgeInsets.fromLTRB(18.0, 10.0, 18.0, 10.0),
                      hintText: ' المشرف',
                      hintStyle: const TextStyle(
                        fontStyle: FontStyle.italic,
                      ),
                      prefixIcon: const Icon(
                        Icons.man,
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

                  //حاله المندوب
                  const Text(
                    'حاله المندوب',
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
                          'حاله المندوب',
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
                    condition: state is ! CreateRepresentativeLoadingState,
                    builder:(context)=> Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        child: const Text(
                          'حفظ',
                        ),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            AppCubit.get(context).createRepresentative(
                                name: nameController.text,
                                branch: branchController.text,
                                delegateType: delegateTypeController.text,
                                classification: classificationController.text,
                                admin: adminController.text,
                                region: regionController.text,
                                phoneNumber: phoneController.text,
                                condition: conditionController.text,
                                effect: effectController.text
                            );
                            navigateAndFinish(context, GetNewRepresentative());
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
