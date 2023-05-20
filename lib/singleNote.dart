import 'package:flutter/material.dart';
class SingleNote extends StatefulWidget {
  final String email; 
  final String name; 
  final String note; 
  const SingleNote({required this.name,required this.email,required this.note});

  @override
  State<SingleNote> createState() => _SingleNoteState();
}

class _SingleNoteState extends State<SingleNote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body:Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(widget.name),
              Text(widget.email),
              Text(widget.note),
            ],
          ),
        ),
      ), 
      
      
      
          );
  }
}
