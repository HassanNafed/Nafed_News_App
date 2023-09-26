
import 'package:firebasecourse/layout/newsApp/cuipt/cuipt.dart';
import 'package:firebasecourse/layout/newsApp/cuipt/cuipt2.dart';
import 'package:firebasecourse/layout/newsApp/cuipt/network/local/cachHelper.dart';
import 'package:firebasecourse/layout/newsApp/cuipt/network/remote/dioHelper.dart';
import 'package:firebasecourse/layout/newsApp/cuipt/states2.dart';
import 'package:firebasecourse/modules/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
 await CacheHelper.init();
 bool isDark=CacheHelper.getBoolean(key: 'isDark',);
  runApp( MyApp(isDark));
}


class MyApp extends StatelessWidget {
  final bool isDark;

 MyApp(this.isDark);
   
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>NewsCubit()..getBusiness()..getScience()..getSports()),
        BlocProvider( create:(BuildContext context )=> NewsCubit2()..changeAppMode(
        fromShared:isDark,

      ),),
      ],
      
      child:BlocConsumer<NewsCubit2,NewsStates2>
      (listener: (context,state){},
        builder: (context,state){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.deepOrange,
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarIconBrightness: Brightness.dark,
                  statusBarColor: Colors.white,
                  ),
                backgroundColor: Colors.white,
                elevation: 0.0,
                titleTextStyle: TextStyle(
                  color:  Colors.deepOrange,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              iconTheme: IconThemeData(
                color: Colors.black,
              ), 
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
                selectedItemColor: Colors.deepOrange,
                elevation: 20,
              ),
            textTheme: TextTheme(
              bodyLarge: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              ),
            ),
            darkTheme: ThemeData(
              scaffoldBackgroundColor:HexColor('333739'),
              primarySwatch: Colors.deepOrange,
              appBarTheme: AppBarTheme(
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarIconBrightness: Brightness.light,
                  statusBarColor: HexColor('333739'),
                  ),
                backgroundColor:HexColor('333739'),
                elevation: 0.0,
                titleTextStyle: TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              iconTheme: IconThemeData(
                color: Colors.white,
              ), 
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.grey,
                elevation: 20,
                backgroundColor: HexColor('333739'),
              ),
              textTheme: TextTheme(
              bodyLarge : TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
              ),
            ),
            themeMode: NewsCubit2.get(context).isDark?ThemeMode.dark:ThemeMode.light,
            home:SplashScreen(),
    );
        }, ) ,
   
      
    );
    
  }
}




