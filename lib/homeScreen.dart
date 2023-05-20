import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqlite/CreatingNote.dart';
import 'package:path/path.dart';
import 'package:sqlite/noteController.dart';
import 'package:sqlite/singleNote.dart';
import 'package:sqlite/updateForm.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> list = [];
  NoteController _noteController=Get.put(NoteController());

  Future<void> fetchNotes() async {
    List<Map<String, dynamic>> notes = await _noteController.getdata();

    setState(() {
      list = [...notes];
      list=notes;
    });
  }

  @override
  
  void initState(){
    // TODO: implement initState
    super.initState();
    fetchNotes();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Notes"),
      ),
      body: ListView(
        children: [
        for(var note in list)
          Container(
            child: ListTile(
              title: Text(note['name']),
              subtitle: Text(note['note']),
              trailing: Container(
                color: Colors.lightBlueAccent,
                  width:MediaQuery.of(context).size.width/3+7,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(onPressed: (){
                        Get.to(()=>
                            SingleNote(name: note['name'],email: note['email'],note: note['note'],));
                      }, icon: Icon(Icons.remove_red_eye),color: Colors.white,),

                      IconButton(onPressed: (){
                        print(note['id']);
                        _noteController.deleterecord(note['id']);
                        fetchNotes();
                        }, icon: Icon((Icons.delete),color: Colors.red,)),

                      IconButton(onPressed: (){
                        Get.to(()=>UpdateForm(name: note['name'],email: note['email'],note: note['note'],id: note['id'],));

                      }, icon: Icon((Icons.update),color: Colors.yellow,)),
                  ],)),
            ),
          )
        ],
      ),

      floatingActionButton: FloatingActionButton(onPressed: (){Get.to(()=>CreatingNote());},child: Icon(Icons.add),),
    );
  }
}
