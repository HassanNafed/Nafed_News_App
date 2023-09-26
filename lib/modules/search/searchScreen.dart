import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebasecourse/components/components.dart';
import 'package:firebasecourse/layout/newsApp/cuipt/cuipt.dart';
import 'package:firebasecourse/layout/newsApp/cuipt/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


// ignore: must_be_immutable
class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  var searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){
        var list= NewsCubit.get(context).search;

        return  Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              onChanged: (value){
                NewsCubit.get(context).getSearch(value);
              },
             decoration: const InputDecoration(
              border: OutlineInputBorder(),
              prefix: Icon(Icons.search),
              labelText: 'Search',
            ),
              controller:searchController ,
              keyboardType: TextInputType.text,
              validator:( value){
                if (value!.isEmpty) {
                  return 'search must not be empty';
                }
                return null;
              } ,
              
              
            ),
          ),
         
         Expanded(
           child: ConditionalBuilder(
            condition:list.length>0,
            builder: (context) => ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context,index)=>buildArticalItem(list[index],context),
             separatorBuilder:(context,index)=>myDivider(),
             itemCount: 10),
            fallback: (context) => Center(child: CircularProgressIndicator()),
           
                 ),
         ),
        // Expanded(child:buildArticalItem(list, context),),
             
        ]),
      );

      },

    
    );
  }
}