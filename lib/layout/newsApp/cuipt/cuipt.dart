
import 'package:firebasecourse/layout/newsApp/cuipt/network/local/cachHelper.dart';
import 'package:firebasecourse/layout/newsApp/cuipt/network/remote/dioHelper.dart';
import 'package:firebasecourse/layout/newsApp/cuipt/states.dart';
import 'package:firebasecourse/modules/business/businessScreen.dart';
import 'package:firebasecourse/modules/science/scienceScreen.dart';
import 'package:firebasecourse/modules/settings/settings.dart';
import 'package:firebasecourse/modules/sports/sportsScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class NewsCubit extends Cubit<NewsStates>
{
  NewsCubit():super (NewsInitialState());
  static NewsCubit get(context)=>BlocProvider.of(context);
  
  int currentIndex=0;
  List<BottomNavigationBarItem>bottomItems=[
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Business',
    ),

     BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'Sports'
    ),

     BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'Science'
    ),

     BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'settings'
    ),
  ];
  List<Widget>screens=[
        BusinessScreen(),
        SportsScreen(),
        ScienceScreen(),
        SettingsScreen(),


  ];

  void changeBottomNavBar(int index){
    currentIndex=index;
    if (index==1) {
      getSports();
      
    }
    if (index==2) {
      getScience();
      
    }
    emit(NewsBottomNavState());
  }
  

  List<dynamic> business=[];
  void getBusiness(){
     emit(NewsGetBusinessLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines', 
      query: {
        'country':'eg',
        'category':'business',
        'apiKey':'afb9481de12e4e688e0498ca09385446',
      },
      ).then((value) {
        ////////print(value.data['articles'][0]['title']);
        business=value.data['articles'];
        print(business[0]['title']);
        emit(NewsGetBusinessSuccessState());
      }).catchError((error){
        print(error.toString());
        emit(NewsGetBusinessErrorState(error.toString()));
      }

      );
  }
 


 List<dynamic> sports=[];
  void getSports(){
     emit(NewsGetSportsLoadingState());
     if (sports.length==0) {
            DioHelper.getData(
            url: 'v2/top-headlines', 
            query: {
              'country':'eg',
              'category':'sports',
              'apiKey':'afb9481de12e4e688e0498ca09385446',
            },
            ).then((value) {
              ////////print(value.data['articles'][0]['title']);
            sports=value.data['articles'];
              print(sports[0]['title']);
              emit(NewsGetSportsSuccessState());
            }).catchError((error){
              print(error.toString());
              emit(NewsGetSportsErrorState(error.toString()));
            }

            );
     }
     else{
      emit(NewsGetSportsSuccessState());
     }
    
  }
 

 List<dynamic> science=[];
  void getScience(){
     emit(NewsGetScienceLoadingState());
     if (science.length==0) {
                DioHelper.getData(
              url: 'v2/top-headlines', 
              query: {
                'country':'eg',
                'category':'science',
                'apiKey':'afb9481de12e4e688e0498ca09385446',
              },
              ).then((value) {
                ////////print(value.data['articles'][0]['title']);
              science=value.data['articles'];
                print(science[0]['title']);
                emit(NewsGetScienceSuccessState());
              }).catchError((error){
                print(error.toString());
                emit(NewsGetScienceErrorState(error.toString()));
              }

              );
     }else{
      emit(NewsGetScienceSuccessState());
     }
   
  }


  
 List<dynamic>search=[];
  void getSearch(String value){
     emit(NewsGetSearchLoadingState());
   // var search=[];
         DioHelper.getData(
              url: 'v2/everything', 
              query: {
                
                'q':'$value',
                'apiKey':'afb9481de12e4e688e0498ca09385446',
              },
              ).then((value) {
                ////////print(value.data['articles'][0]['title']);
                search=value.data['articles'];
                print(search[0]['title']);
                emit(NewsGetSearchSuccessState());
              }).catchError((error){
                print(error.toString());
                emit(NewsGetSearchErrorState(error.toString()));
              }

              );
   
  }

  





bool isDark=false;
void changeAppMode(bool fromShared){
  // ignore: unnecessary_null_comparison
  if (fromShared != null) {
     isDark=fromShared;
  }
  else{
    isDark=!isDark;
  }
    
  CacheHelper.putBoolean(key:'isDark',value: isDark).then((value)
  {
     emit(NewsChingeModeState());
  });
 
}


}

