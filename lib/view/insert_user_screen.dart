import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/view/all_sections.dart';
import 'package:provider/provider.dart';
import '../controller/db_controller.dart';
import '../model/Section.dart';
import '../model/db_helper.dart';
import '../widget/custom_text_field.dart';
class InsertUserScreen extends StatefulWidget {
  @override
  State<InsertUserScreen> createState() => _InsertUserScreenState();
}

class _InsertUserScreenState extends State<InsertUserScreen> {


  TextEditingController nameController = TextEditingController();

  TextEditingController contentController = TextEditingController();

  TextEditingController referanceController = TextEditingController();

  TextEditingController countController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
            appBar: AppBar(title: Text("اذكــاري")),
            body: Container(
              margin: EdgeInsets.all(20),
              child: ListView(
                children: [
                  CustomTextfield("اسـم الذكــر", nameController),
                  CustomTextfield("محتـوى الذكـر", contentController),
                  CustomTextfield("مصـدر الذكـر", referanceController),
                  CustomTextfield("عدد مرات الذكـر", countController),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 25),
                    child: ElevatedButton(
                      onPressed: () async {
                        String countText = countController.text;
                        int count = 0;
                        if (countText.isNotEmpty) {
                          if (int.tryParse(countText) != null) {
                            count = int.parse(countText);
                          }
                        }
                        Section section = Section(
                          Name:nameController.text,
                          Count:count,
                          Ref: referanceController.text,
                          Content: contentController.text,
                        );
                        await DbHelper.insertNewSection(section);
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
                          return AllSections();
                        })); // Go back to the previous screen
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.teal,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                          side: BorderSide(color: Colors.white),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 25),
                        child: const Text(
                          "اضــافة الذكــر",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontFamily: 'Tajawal', fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
