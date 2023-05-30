import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/db_helper.dart';
import 'insert_user_screen.dart';
import 'section_details_screen.dart'; // Import the details screen

class AllSections extends StatefulWidget {
  @override
  State<AllSections> createState() => _AllSectionsState();
}

class _AllSectionsState extends State<AllSections> {
  List<Map<String, dynamic>>? data;

  @override
  void initState() {
    super.initState();
    getAllSections();
  }

  getAllSections() async {
    await Future.delayed(Duration(seconds: 3));
    data = await DbHelper.getAllSections();
    setState(() {});
  }

  deleteSection(int id) async {
    await DbHelper.deleteSection(id);
    getAllSections();
  }

  updateSection(int index, Map<String, dynamic> updatedData) {
    setState(() {
      data![index] = updatedData;
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return InsertUserScreen();
          }));
        },
      ),
      appBar: AppBar(title: Text("اذكــاري",style: TextStyle(fontFamily: 'Tajawal'),)),
      body:  data == null
            ? Center(child: CircularProgressIndicator())
            : Padding(
          padding: const EdgeInsets.all(12),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SectionDetailsScreen(
                        section: data![index], // Pass the section data to the details screen
                      ),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsetsDirectional.only(top: 12),
                  padding: EdgeInsetsDirectional.only(end: 20),
                  width: double.infinity,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(39.0),
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.teal,
                        Colors.teal,
                        Colors.teal,
                        Colors.teal,
                        Colors.tealAccent,
                        Colors.tealAccent,
                      ],
                    ),
                  ),
                  child: ListTile(
                    title: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        data![index]['name'] ?? "es",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Tajawal',
                          fontSize: 19,
                        ),
                      ),
                    ),
                    leading: IconButton(
                      onPressed: () {
                        deleteSection(data![index]['id']);
                        setState(() {});
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Colors.teal,
                      ),
                    ),
                    trailing:IconButton(
                      onPressed: () {
                        updateSection(index, data![index]);
                      },
                      icon: Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                    ) ,
                  ),
                ),
              );
            },
            itemCount: data?.length ?? 0,
          ),
        ),
      );
  }
}
