import 'package:cloud_firestore/cloud_firestore.dart';

class FireStore{

  final CollectionReference notes =
  FirebaseFirestore.instance.collection('notes');

  // Read
  Future<void> addNote(String note){
    return notes.add({
      'note' : note,
      'timeStamp' : Timestamp.now(),
    });
  }

  // write
  Stream<QuerySnapshot> getNotes() {
    return notes.orderBy('timeStamp', descending: true).snapshots();
  }

  // Update a note
  Future<void> updateNote(String id, String newNote) {
    return notes.doc(id).update({
      'note': newNote,
      'timeStamp': Timestamp.now(),
    });
  }

  // Delete a note
  Future<void> deleteNote(String id) {
    return notes.doc(id).delete();
  }

}