import 'package:flutter/widgets.dart';

class MakeNoteProvider extends ChangeNotifier {
  final TextEditingController controllerNote = TextEditingController();

  MakeNoteProvider() {
    controllerNote.addListener(_onNoteChanged);
  }
  @override
  void dispose() {
    controllerNote.removeListener(_onNoteChanged);
    controllerNote.dispose();
    super.dispose();
  }

  void _onNoteChanged() {
    notifyListeners();
  }
}
