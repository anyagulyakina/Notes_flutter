import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class NewNote extends StatefulWidget {
  final String? noteId = ModalRoute.of(context)?.settings.arguments as String?;

  NewNote({Key? key, this.noteId}) : super(key: key);

  @override
  State<NewNote> createState() => _NewNoteState();
}

class _NewNoteState extends State<NewNote> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();

    print('Note ID: ${widget.noteId}'); // проверка на правильность id

    // Загружаем текст заметки из Firestore при инициализации состояния
    if (widget.noteId != null) {
      loadNoteText();
    }
  }

  @override
  void dispose() {
    _textEditingController.dispose(); // очищаем контроллер для текстового ввода
    super.dispose();
  }

  Future<void> loadNoteText() async {
    try {
      // Получаем документ из Firestore по ID заметки
      DocumentSnapshot noteSnapshot = await FirebaseFirestore.instance.collection('notes').doc(widget.noteId).get();
      if (noteSnapshot.exists) {
        String noteText = noteSnapshot['text'] ?? '';
        // Если заметка существует, устанавливаем ее текст в TextField
        setState(() {
          _textEditingController.text = noteSnapshot['text'];
        });
      }
    } catch (e) {
      // Обработка ошибок
      print('Error loading note text: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('New note'),
          actions: [
            IconButton(
              icon: const Icon(Icons.check),
              onPressed: () async {
                String noteText = _textEditingController.text; // получаем текст заметки

                if (widget.noteId != null) {
                  await FirebaseFirestore.instance.collection('notes').doc(widget.noteId).update({
                    'text': noteText, // обновляем существующую заметку в Firestore
                  });
                } else {
                  DocumentReference newNoteRef = await FirebaseFirestore.instance.collection('notes').add({
                    'text': noteText, // Создаем новую заметку в Firestore
                  });
                  String newNoteId = newNoteRef.id; // получаем noteId
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => NewNote(noteId: newNoteId)),
                  );
                }

                Navigator.pop(context);
              },
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _textEditingController,
            maxLines: null,
            keyboardType: TextInputType.multiline,
            decoration: const InputDecoration(
              hintText: 'Enter your note here',
              border: InputBorder.none,
            ),
          ),
        )
    );
  }
}