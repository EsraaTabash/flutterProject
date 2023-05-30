
import 'package:flutter/material.dart';

import 'all_sections.dart';
import 'insert_user_screen.dart';


class NewUserScreen extends StatelessWidget {

  NavigationFunction(BuildContext context) async{
    await Future.delayed(const Duration(seconds: 5));
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
        return AllSections();
      }));
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
        child: Align(
          alignment: Alignment.center,
          child: Text("""
          مرحبـا بـك في أذكــاري
          اضــف اذكارك الخاصـة
          """,style: TextStyle(fontFamily: "Tajawal",
              fontWeight: FontWeight.bold,
              fontSize: 26,
              color: Colors.white)),
        ),
      ),
    );
  }
}