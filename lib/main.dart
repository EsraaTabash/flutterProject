import 'package:flutter/material.dart';
import 'package:project/view/splash_screen.dart';
import 'controller/db_controller.dart';
import 'package:provider/provider.dart';
import 'model/db_helper.dart';
import 'model/sp_helper.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await SpHelper.spHelper.initSharedPreferances();
  await SpHelper.initSharedPreferances();
  await DbHelper.initDb();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DbController>(
      create: (context)=>DbController(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home : SplachScreen(),
        theme: ThemeData(
            textTheme: const TextTheme(
                titleSmall: TextStyle(
                  fontFamily: 'Tajawal',
                  fontSize: 22.0,
                )
            ),
            appBarTheme: const AppBarTheme(
                backgroundColor: Colors.teal,
                centerTitle: true
            )
        ),
      ),
    );
  }
}



