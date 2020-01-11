import 'package:flutter/material.dart';
import 'package:flutter_notes/views/note.dart';

class NoteList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return GestureDetector(
          onTap: (){
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Note(NoteMode.Editing)));
          },
          child: Card(
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 30, bottom: 30, left: 13, right: 22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _NoteTitle(),
                  Container(
                    height: 4,
                  ),
                  _NoteText()
                ],
              ),
            ),
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Note(NoteMode.Adding)));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class _NoteText extends StatelessWidget {
  const _NoteText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Text',
      style: TextStyle(color: Colors.grey.shade500),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class _NoteTitle extends StatelessWidget {
  const _NoteTitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Title',
      style: TextStyle(fontSize: 25),
    );
  }
}
