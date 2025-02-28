import 'package:cloud_firestore/cloud_firestore.dart';

class EventService {
  final CollectionReference _eventCollection =
      FirebaseFirestore.instance.collection('events');

  Stream<QuerySnapshot> getEvent() {
    return _eventCollection.snapshots();
  }

  Future<void> addEvent(String name, String id, String department,
      String phonenumber, String text) async {
    await _eventCollection.add({
      'name': name,
      "studentId": id,
      "department": department,
      "phonenumber": phonenumber,
    });
  }

  // // Update a todo
  // Future<void> updateEvent(String id, String name, String email) async {
  //   await _eventCollection.doc(id).update({'name': name, 'email': email});
  // }

  // // Delete a todo
  // Future<void> deleteEvent(String id) async {
  //   await _eventCollection.doc(id).delete();
  // }
}
