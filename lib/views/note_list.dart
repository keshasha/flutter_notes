import 'package:flutter/material.dart';
import 'package:flutter_notes/inherited_widgets/note_inherited_widget.dart';
import 'package:flutter_notes/views/note.dart';

class NoteList extends StatefulWidget {
  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  List<Map<String, String>> get _notes => NoteInheritedWidget.of(context).notes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      body: ListView.builder(
          itemCount: _notes.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Note(NoteMode.Editing, index)));
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 30, bottom: 30, left: 13, right: 22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _NoteTitle(_notes[index]['title']),
                      Container(
                        height: 4,
                      ),
                      _NoteText(_notes[index]['text'])
                    ],
                  ),
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => Note(NoteMode.Adding, null)));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class _NoteText extends StatelessWidget {
  final String _text;

  _NoteText(this._text);

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      style: TextStyle(color: Colors.grey.shade500),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class _NoteTitle extends StatelessWidget {
  final String _title;

  _NoteTitle(this._title);

  @override
  Widget build(BuildContext context) {
    return Text(
      _title,
      style: TextStyle(fontSize: 25),
    );
  }
}
