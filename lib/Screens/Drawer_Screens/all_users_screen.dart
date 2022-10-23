import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:systemk/Data/Cubit/Home_Cubit/app_cubit.dart';
import 'package:systemk/Data/Cubit/Home_Cubit/app_states.dart';
import 'package:systemk/Data/Models/el3mlaa_model.dart';

class AllUsers extends StatelessWidget {
  const AllUsers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit ,AppStates>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [


              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context ,index)=> buildClintItem(AppCubit.get(context).clint[index],context,),
                separatorBuilder: (context ,index)=>const SizedBox(height: 8.0,),
                itemCount: AppCubit.get(context).clint.length,
              ),
              const SizedBox(
                height: 8.0,
              )
            ],
          ),
        );
      },
    );
  }

  Widget buildClintItem(ClintModel model ,context)=> Card(
    clipBehavior: Clip.antiAliasWithSaveLayer,
    elevation: 5.0,
    margin: const EdgeInsets.symmetric(
        horizontal: 8.0
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [

          //الاسم والرقم
          Row(
            children: [
              Text('${model.phoneNumber}',
                style: TextStyle(
                    color: Colors.blue
                ),),
              Spacer(),
              Text(
                '${model.name}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,),
            ],
          ),


          //عنوان و حاله
          Row(
            children: [
              Text(
                '${model.status}',
                style: TextStyle(
                    color: Colors.blue
                ),),
              Spacer(),
              Text(
                '${model.region}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,),
            ],
          ),


          //المدين والدائن
          Row(
            children: [
              Text(
                '${model.creditor}',
                style: TextStyle(
                    color: Colors.blue
                ),),
              SizedBox(width: 10,),
              Text(
                'ليه',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,),

              Spacer(),
              Text(
                '${model.debtor}',
                style: TextStyle(
                    color: Colors.blue
                ),),
              SizedBox(width: 10,),

              Text('عليه',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,),
            ],
          ),




        ],
      ),
    ),
  );

}
