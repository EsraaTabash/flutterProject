
import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/view/insert_user_screen.dart';
import '../model/Section.dart';
import '../model/db_helper.dart';


class DbController extends ChangeNotifier {
  DbController() {
    getAllSections();
  }

  List<Section> sections = [];
  bool isLoading = false;

  void flipIsLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  Future<void> getAllSections() async {
    flipIsLoading();
    sections = (await DbHelper.getAllSections()).cast<Section>();
    notifyListeners();
    flipIsLoading();
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  TextEditingController countController = TextEditingController();
  TextEditingController referenceController = TextEditingController();

  Future<void> insertNewSection() async {
    Section section = Section(
        Name: nameController.text,
        Ref: referenceController.text,
        Content: contentController.text,
        Count: int.parse(countController.text)
    );
    await DbHelper.insertNewSection(section);
    await getAllSections();
    notifyListeners();
  }

  Future<void> deleteSection(int id) async {
    await DbHelper.deleteSection(id);
    sections.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  navigateToEditPage(Section section,BuildContext context){
    nameController.text  =  section.Name ?? "";
    referenceController.text  =  section.Ref ?? "";
    contentController.text  =  section.Content ?? "";
    contentController.text  =  section.Count.toString() ?? "0";
    Navigator.of(context).push(MaterialPageRoute(builder: (context){
      return InsertUserScreen();
    }));

  }
}
