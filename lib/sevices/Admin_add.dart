import 'package:cloud_firestore/cloud_firestore.dart';

class AdminAdd {
  final CollectionReference _eventCollection =
      FirebaseFirestore.instance.collection('addevent');

  Stream<QuerySnapshot> getEvent() {
    return _eventCollection.snapshots();
  }

  Future<void> addEvent(
      String name, String date, String stageno, String time) async {
    await _eventCollection.add({
      'name': name,
      "Date": date,
      "stageno": stageno,
      "time": time,
    });
  }
}
