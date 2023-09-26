import 'package:firebasecourse/layout/newsApp/cuipt/cuipt.dart';
import 'package:firebasecourse/layout/newsApp/cuipt/cuipt2.dart';
import 'package:firebasecourse/layout/newsApp/cuipt/states.dart';
import 'package:firebasecourse/modules/search/searchScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsLayout extends StatefulWidget {
  const NewsLayout({super.key});

  @override
  State<NewsLayout> createState() => _NewsLayoutState();
}

class _NewsLayoutState extends State<NewsLayout> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder:(context,state) {
        var cuipt=NewsCubit.get(context);

        return Scaffold(
          appBar: AppBar(
              title: Text("Nafed News"),
              actions: [
              IconButton(onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=> SearchScreen()));
                },
                 icon: Icon(Icons.search)),
              IconButton(
                onPressed: (){
                NewsCubit2.get(context).changeAppMode();
                setState(() {
                  
                });
                
                },
                 icon: Icon(Icons.brightness_4_outlined)) 
              ],
              ),
            bottomNavigationBar: BottomNavigationBar(
              items: cuipt.bottomItems,
              currentIndex: cuipt.currentIndex,
              onTap: (index){
                    cuipt.changeBottomNavBar(index);
              },

              ), 
        body: cuipt.screens[cuipt.currentIndex],
      );
      

      },
      
      
      );
}
}
