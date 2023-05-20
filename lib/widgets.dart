import 'package:flutter/material.dart';

Widget textfied({required String title,controler,int min=1}){
  return  TextField(
    controller: controler,
    minLines: min,
    maxLines: min,
    decoration: InputDecoration(
        labelText: title,
        border: OutlineInputBorder(
        )
    ),
  );
}