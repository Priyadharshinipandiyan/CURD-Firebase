import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curd_project/sevices/firebase_curd.dart';
import 'package:flutter/material.dart';


class Notes extends StatefulWidget {
  Notes({Key? key}) : super(key: key);

  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<Notes> {
  final FireStore fireStore = FireStore();
  final TextEditingController textController = TextEditingController();

  void openNotesText() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          cursorColor: Colors.deepOrange[200],
          controller: textController,
          decoration: InputDecoration(
            hintText: "Enter note here",
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.deepOrangeAccent),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.redAccent),
            ),
          ),
        ),
        actions: [
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.deepOrange[200]),
            ),
            onPressed: () async {
              await fireStore.addNote(textController.text);
              textController.clear();
              Navigator.pop(context);
            },
            child: Text('Add'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[200],
        title: Text("Notes"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_sharp),
          onPressed: () {
            // Add functionality for the back button if needed
          },
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: fireStore.getNotes(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Something went wrong'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          final notes = snapshot.data!.docs;
          return ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) {
              final note = notes[index];
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.orange),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.deepOrange.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: ListTile(
                  title: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(note['note']),
                  ),
                  //subtitle: Text(note['timeStamp'].toDate().toString()),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit, color: Colors.deepOrange[300]),
                        onPressed: () => _editNoteDialog(context, note.id, note['note']),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => fireStore.deleteNote(note.id),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: openNotesText,
        backgroundColor: Colors.deepOrange[200],
        tooltip: 'Add Note',
        child: Icon(Icons.add),
      ),
    );
  }

  void _editNoteDialog(BuildContext context, String id, String currentNote) {
    final TextEditingController noteController = TextEditingController(text: currentNote);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Note'),
          content: TextField(
            controller: noteController,
            decoration: InputDecoration(hintText: "Edit note here"),
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Save'),
              onPressed: () {
                fireStore.updateNote(id, noteController.text);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
