
import 'package:flutter/material.dart';
import '../model/sp_helper.dart';
import 'all_sections.dart';
import 'new_user_screen.dart';
import 'insert_user_screen.dart';

class SplachScreen extends StatefulWidget {
  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  NavigationFunction(BuildContext context) async{
    await Future.delayed(const Duration(seconds: 3));
    bool isFirstTime = SpHelper.isNewUser();
    if (isFirstTime) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
        return NewUserScreen();
      }));

    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
        return AllSections();
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    NavigationFunction(context);
    return Scaffold(
      body: Container(
        alignment: AlignmentDirectional.center ,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd,
                colors: [
                  Colors.teal.shade200,
                  Colors.teal.shade900,
                ]
            )
        ),
        child: Text("أذكــاري",style: TextStyle(fontFamily: "Tajawal",
            fontWeight: FontWeight.bold,
            fontSize: 26,
            color: Colors.white)),
      ),
    );
  }
}