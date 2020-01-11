import 'package:flutter/material.dart';
import 'package:flutter_notes/inherited_widgets/note_inherited_widget.dart';
import 'package:flutter_notes/views/note_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Notes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NoteInheritedWidget(
          child:MaterialApp(
              title: 'Notes',
              home: NoteList(),
          )
      ),
    );
  }
}
