import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:systemk/Data/Cubit/Home_Cubit/app_cubit.dart';
import 'package:systemk/Data/Cubit/Home_Cubit/app_states.dart';
import 'package:systemk/Data/Shared/Component/reusable_component.dart';
import 'package:systemk/Data/Shared/Styles/icon_broken.dart';
import 'package:systemk/Screens/Home_Screens/Basics_Screens/Alasnaf_Screens/get_new_items_or_not.dart';
import 'package:systemk/Screens/Home_Screens/home_screen.dart';



class TypesScreen extends StatefulWidget {
  const TypesScreen({Key? key}) : super(key: key);

  @override
  State<TypesScreen> createState() => _TypesScreenState();
}

class _TypesScreenState extends State<TypesScreen> {


  //نوع الصنف
  var typeController = TextEditingController();
  String? typeChoose;
  List<String> listItem = [
    'مخزنى',
    'خدمى - بنود اعمال',
    'مجمع',
    'منتج تام',
    'متعدد'
  ];



  //الوحده الصغرى

  var smallUnitController = TextEditingController();
  String? smallUnit;
  List<String> listSmallUnit = ['قطعه', 'كرتونه', 'متر', 'متر طولى', 'م تكعيب'];


  //الوحده الكبرى
  var bigUnitController = TextEditingController();
  String? bigUnit;
  List<String> listBigUnit = [
    'قطعه', 'كرتونه', 'متر', 'متر طولى', 'م تكعيب'
  ];


  //المخزن

  var storeController = TextEditingController();
  String? store;
  List<String> listStore = [
    'المخزن الرئيسي', 'مخزن اخر',
  ];


  //وحده البيع الافتراضيه
  var virtualSalesUnitController = TextEditingController();
  String? virtualSalesUnit;
  List<String> listSellUnit = ['قطعه', 'كرتونه', 'متر', 'متر طولى', 'م تكعيب'];



  //وحده الشراء الافتراضيه
  var virtualPurchaseUnitController = TextEditingController();
  String? virtualPurchaseUnit;
  List<String> listBuyUnitUnit = [
    'قطعه', 'كرتونه', 'متر', 'متر طولى', 'م تكعيب'
  ];


  //وحده قياس المخزون
  var measurementUnitController = TextEditingController();
  String? measurementUnit;
  List<String> listSToreUnit = ['قطعه', 'كرتونه', 'متر', 'متر طولى', 'م تكعيب'];

  //حاله الصنف

  var itemConditionController = TextEditingController();
  String? itemCondition;
  List<String> listActivity = [
    'نشط',
    'غير نشط',
  ];



  //التاثير
  TextEditingController effectController = TextEditingController();
  String? effect;
  List<String> listEffect = [
    'نعم ',
    'لا',
  ];

  var formKey = GlobalKey<FormState>();





  var idController = TextEditingController();

  var typeNameController = TextEditingController();
  var dateController = TextEditingController();
  var costController = TextEditingController();
  var opiningCostStoreController = TextEditingController();
  var limitController = TextEditingController();

  @override
  Widget build(BuildContext context) {



    return BlocConsumer<AppCubit, AppStates>(
      listener: (context ,state){},
      builder:(context ,state){
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  navigateAndFinish(context, HomeScreen());
                },
                icon: const Icon(IconBroken.Arrow___Left_2)),
            centerTitle: true,
            title: const Text('ادخل صنف'),
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


                    //اسم الصنف
                    const Text(
                      'اسم الصنف',
                      style: TextStyle(fontSize: 15.0),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      controller: typeNameController,
                      keyboardType: TextInputType.name,
                      enabled: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "من فضلك ادخل اسم الصنف";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        contentPadding:
                        const EdgeInsets.fromLTRB(18.0, 10.0, 18.0, 10.0),
                        hintText: 'اسم الصنف',
                        hintStyle: const TextStyle(
                          fontStyle: FontStyle.italic,
                        ),
                        prefixIcon: const Icon(
                          IconBroken.Category,
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

                    //نوع الصنف

                    const Text(
                      'نوع الصنف',
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
                            'اختر نوع الصنف',
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
                          value: typeChoose,
                          onChanged: (newValue) {
                            setState(() {
                              typeChoose = newValue;
                              typeController.text=newValue!;

                            });
                          },
                          items: listItem.map((valueItem) {
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

                    //نوع الوحده الصغرى
                    const Text(
                      'اختر الوحده الصغرى',
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
                            'اختر وحده الصغرى',
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
                          value: smallUnit,
                          onChanged: (newValue) {
                            setState(() {
                              smallUnit = newValue;
                              smallUnitController.text=newValue!;
                            });
                          },
                          items: listSmallUnit.map((valueItem) {
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

                    //نوع الوحده الكبرى

                    const Text(
                      'اختر الوحده الكبرى',
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
                            'اختر وحده الكبرى',
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
                          value: bigUnit,
                          onChanged: (newValue) {
                            setState(() {
                              bigUnit = newValue;
                              bigUnitController.text=newValue!;
                            });
                          },
                          items: listBigUnit.map((valueItem) {
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

                    //تاريخ انتهاء صلاحيه
                    const Text(
                      'تاريخ انتهاء صلاحيه المنتج',
                      style: TextStyle(fontSize: 15.0),
                    ),

                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      controller: dateController,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Should enter date';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                            color: Colors.blue,
                            width: .5,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        labelText: 'Task Date',
                        labelStyle: const TextStyle(color: Colors.blue,),
                        prefixIcon: const Icon(Icons.calendar_today,
                          size: 20.0,
                          color: Colors.blue,
                        ),
                      ),
                      onTap: () {
                        showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime.parse('2100-10-10'))
                            .then((value) {
                          dateController.text = DateFormat.yMMMd().format(value!);
                        });
                      },
                    ),

                    //تكلفه افتتاحى
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text(
                      'تكلفه افتتاحى',
                      style: TextStyle(fontSize: 15.0),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      controller: costController,
                      keyboardType: TextInputType.phone,
                      enabled: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "من فضلك ادخل تكلفه ";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        contentPadding:
                        const EdgeInsets.fromLTRB(18.0, 10.0, 18.0, 10.0),
                        hintText: '1000',
                        hintStyle: const TextStyle(
                          fontStyle: FontStyle.italic,
                        ),
                        prefixIcon: const Icon(
                          IconBroken.Discount,
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

                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text(
                      'المخزن',
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
                          value: store,
                          onChanged: (newValue) {
                            setState(() {
                              store = newValue;
                              storeController.text=newValue!;
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

                    //افتتاحى مخزون

                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text(
                      'تكلفه افتتاحى المخزون',
                      style: TextStyle(fontSize: 15.0),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      controller: opiningCostStoreController,
                      keyboardType: TextInputType.phone,
                      enabled: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "من فضلك ادخل تكلفه افتتاحى مخزون ";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        contentPadding:
                        const EdgeInsets.fromLTRB(18.0, 10.0, 18.0, 10.0),
                        hintText: '2000',
                        hintStyle: const TextStyle(
                          fontStyle: FontStyle.italic,
                        ),
                        prefixIcon: const Icon(
                          IconBroken.Discount,
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

                    //حد الطلب
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text(
                      'حد الطلب',
                      style: TextStyle(fontSize: 15.0),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      controller: limitController,
                      keyboardType: TextInputType.phone,
                      enabled: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "من فضلك ادخل حد الطلب ";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        contentPadding:
                        const EdgeInsets.fromLTRB(18.0, 10.0, 18.0, 10.0),
                        hintText: '5',
                        hintStyle: const TextStyle(
                          fontStyle: FontStyle.italic,
                        ),
                        prefixIcon: const Icon(
                          IconBroken.Info_Circle,
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

                    //وحده البيع الافتراضيه

                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text(
                      'وحده البيع الافتراضيه',
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
                            'اختر وحده البيع',
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
                          value: virtualSalesUnit,
                          onChanged: (newValue) {
                            setState(() {
                              virtualSalesUnit = newValue;
                              virtualSalesUnitController.text=newValue!;
                            });
                          },
                          items: listSellUnit.map((valueItem) {
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

                    // وحده الشراء الافتراضيه

                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text(
                      'وحده الشراء الافتراضيه',
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
                            'وحده الشراء الافتراضيه',
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
                          value: virtualPurchaseUnit,
                          onChanged: (newValue) {
                            setState(() {
                              virtualPurchaseUnit = newValue;
                              virtualPurchaseUnitController.text=newValue!;
                            });
                          },
                          items: listBuyUnitUnit.map((valueItem) {
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

                    // وحده قياس المخزون
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text(
                      'وحده قياس المخزون',
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
                            'وحده قياس المخزون',
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
                          value: measurementUnit,
                          onChanged: (newValue) {
                            setState(() {
                              measurementUnit = newValue;
                              measurementUnitController.text=newValue!;
                            });
                          },
                          items: listSToreUnit.map((valueItem) {
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

                    //حاله الصنف
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text(
                      'حاله الصنف',
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
                            'حاله الصنف',
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
                          value: itemCondition,
                          onChanged: (newValue) {
                            setState(() {
                              itemCondition = newValue;
                              itemConditionController.text=newValue!;
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
                      condition: state is! CreateItemLoadingState,
                      builder: (context)=>Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          child: const Text(
                            'حفظ',
                          ),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              AppCubit.get(context).createItems(
                                  name: typeNameController.text,
                                  id: idController.text,
                                  type: typeController.text,
                                  smallUnit: smallUnitController.text,
                                  bigUnit: bigUnitController.text,
                                  dateTime: dateController.text,
                                  openingCost: costController.text,
                                  store: storeController.text,
                                  opiningStoreCost: opiningCostStoreController.text,
                                  limit: limitController.text,
                                  virtualSalesUnit: virtualSalesUnitController.text,
                                  virtualPurchaseUnit: virtualPurchaseUnitController.text,
                                  measurementUnit: measurementUnitController.text,
                                  itemCondition: itemConditionController.text,
                                  effect: effectController.text
                              );
                              navigateAndFinish(context, GetNewItems());
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
