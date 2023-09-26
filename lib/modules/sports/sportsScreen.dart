import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebasecourse/components/components.dart';
import 'package:firebasecourse/layout/newsApp/cuipt/cuipt.dart';
import 'package:firebasecourse/layout/newsApp/cuipt/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){ 

        var list=NewsCubit.get(context).sports;

        return ConditionalBuilder(
          condition:list.length>0,
          builder: (context) => ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context,index)=>buildArticalItem(list[index],context),
           separatorBuilder:(context,index)=>myDivider(),
           itemCount: 20),
          fallback: (context) => Center(child: CircularProgressIndicator()),
         
        );
      },
    );
  }
}