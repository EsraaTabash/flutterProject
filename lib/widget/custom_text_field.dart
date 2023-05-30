import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const CustomTextfield(this.label, this.controller);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 25),
        TextFormField(
          maxLines: 3,
          controller: controller,
          decoration: InputDecoration(
            label: Directionality(
              textDirection: TextDirection.rtl,
              child: Text(
                label,
                style: TextStyle(fontFamily: 'Tajawal',color: Colors.teal),
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(color: Colors.teal), // Set the border color
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(color: Colors.teal), // Set the border color
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(color: Colors.teal), // Set the border color
            ),
          ),
        ),
      ],
    );
  }
}
