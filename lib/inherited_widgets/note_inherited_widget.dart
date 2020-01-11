import 'package:flutter/material.dart';

class NoteInheritedWidget extends InheritedWidget {
  final notes = [
    {'title': 'asdf', 'text': 'aszfargedf'},
    {'title': 'awfawesg', 'text': 'erfgvbedszb fzsdfrh'},
    {'title': 'fdxv', 'text': 'aszarfsedb ghezsad cdf'},
  ];

//  NoteInheritedWidget(Widget child): super(child: child);
  NoteInheritedWidget({
    Key key,
    @required Widget child,
  })  : assert(child != null),
        super(key: key, child: child);

  static NoteInheritedWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<NoteInheritedWidget>();
  }

  @override
  bool updateShouldNotify(NoteInheritedWidget old) {
    return old.notes != notes;
  }
}
