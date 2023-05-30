
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/Section.dart';


class SectionDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> section;
  SectionDetailsScreen({required this.section});

  @override
  Widget build(BuildContext context) {
    final int count = section['count'] ?? 0;
    // Build the screen using the provided section data
    return Scaffold(
      appBar: AppBar(
        title: Text(
          section['name'] ?? '',
          style: TextStyle(fontFamily: 'Tajawal'),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 30,vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(section['name'] ?? '' ,textDirection: TextDirection.rtl,style: TextStyle(wordSpacing:2,height: 2,fontSize: 28,fontFamily:'Tajawal',color: Colors.teal),),
              SizedBox(height: 20,),
              Container(child: Align(alignment:Alignment.bottomCenter,child: Text(section['content'] ?? '',textDirection: TextDirection.rtl,style: TextStyle(color:Colors.grey,fontSize: 20,height: 2,fontFamily:'Tajawal')))),
              SizedBox(height: 20,),
              Text(count.toString(), style: TextStyle(fontFamily: 'Tajawal', fontSize: 20)),
              SizedBox(height: 20,),
              Text(section['ref'] ?? '', style: TextStyle(fontFamily: 'Tajawal', fontSize: 20)),
            ],
          ),
        ),
      ),
    );
  }
}