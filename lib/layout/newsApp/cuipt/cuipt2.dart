

import 'package:firebasecourse/layout/newsApp/cuipt/network/local/cachHelper.dart';
import 'package:firebasecourse/layout/newsApp/cuipt/states2.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
class NewsCubit2 extends Cubit<NewsStates2>
{
  NewsCubit2():super (NewsInitialState());
  static NewsCubit2 get(context)=>BlocProvider.of(context);
  
  


bool isDark=false;
void changeAppMode({bool? fromShared}){
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

