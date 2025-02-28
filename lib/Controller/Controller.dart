import 'package:get/get.dart';

class OrganizerController extends GetxController {
  final RxMap<String, List<String>> assignedEvents =
      <String, List<String>>{}.obs;

  void addEvent(String id, String event) {
    if (!assignedEvents.containsKey(id)) {
      assignedEvents[id] = [];
    }
    if (!assignedEvents[id]!.contains(event)) {
      assignedEvents[id]!.add(event);
    }
    update();
  }

  List<String> getEvents(String id) {
    return assignedEvents[id] ?? [];
  }
}
