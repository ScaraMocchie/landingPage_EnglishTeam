import 'package:flutter/material.dart';


class TextFieldCustom{
  static Container TemplateTF(var controller, String name) {
    return Container(
      height: 55,
      padding: EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 10),
      child: TextFormField(
        maxLength: 24,
        controller: controller,
        decoration: InputDecoration(
          counterText: '',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          hintText: name,
          label: Text(name),
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}