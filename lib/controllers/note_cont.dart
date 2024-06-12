import 'package:complete/models/note.dart';

class NotesController {
  final List<NotesModel> _notesList = [
    NotesModel(title: "Swimming", subtitle: "go to swimming"),
    NotesModel(title: "Sleeping", subtitle: "go to bed at 00:00."),
  ];

  List<NotesModel> get notesList {
    return [..._notesList];
  }

  void deletePlan(int index) {
    _notesList.removeAt(index);
  }
}
