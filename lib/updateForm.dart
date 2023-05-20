import 'package:flutter/material.dart';
import 'package:sqlite/homeScreen.dart';
import 'package:get/get.dart';
import 'package:sqlite/noteController.dart';
class UpdateForm extends StatefulWidget {
  final String name;
  final String email;
  final String note;
  final int id;
  const UpdateForm({required this.id,required this.name,required this.email,required this.note,});

  @override
  State<UpdateForm> createState() => _UpdateFormState();
}

class _UpdateFormState extends State<UpdateForm> {
  NoteController noteController=Get.put(NoteController());
  TextEditingController name=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController note=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              controller: name,
              decoration: InputDecoration(
                  labelText: widget.name,
                  border: OutlineInputBorder(
                  )
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: email,
              decoration: InputDecoration(
                  labelText: widget.email,
                  border: OutlineInputBorder(
                  )
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: note,
              decoration: InputDecoration(
                  labelText: widget.note,
                  border: OutlineInputBorder(
                  )
              ),
            ),
            SizedBox(height: 10,),

            OutlinedButton(onPressed: (){
              print(name.text);
              print(email.text);
              print(note.text);
              print(widget.id);
              noteController.updateNote(id: widget.id,name: name.text, email: email.text, note: note.text,);
              Get.to(()=>HomeScreen());

            }, child: Text("Update"))

          ],),
      ),



    );
  }
}
