import 'package:flutter/material.dart';
import 'package:sqlite/noteController.dart';
import 'package:sqlite/widgets.dart';
import 'package:get/get.dart';
class CreatingNote extends StatefulWidget {
  const CreatingNote({Key? key}) : super(key: key);

  @override
  State<CreatingNote> createState() => _CreatingNoteState();
}

class _CreatingNoteState extends State<CreatingNote> {
  NoteController note=Get.put(NoteController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
        margin: EdgeInsets.all(8),
    padding: EdgeInsets.all(8),
    child: ListView(
    children: [
    textfied(title: "email",controler: note.email),
    SizedBox(height: 10,),
    textfied(title: "Name",controler: note.name),
    SizedBox(height: 10,),
    textfied(title: "Note",min: 2,controler: note.note),

    OutlinedButton(onPressed: (){note.insertdata();}, child: Text("add")),
    OutlinedButton(onPressed: (){note.getdata();}, child: Text("get")),
    ],
    ),
    )
    );
  }
}
