import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolevents/Controller/Controller.dart';
import 'package:schoolevents/widgets/button.dart';

// Import your controller

class AdminOrganizerAssign extends StatefulWidget {
  final String name;
  final String id;
  final String phonenumber;

  const AdminOrganizerAssign({
    super.key,
    required this.name,
    required this.id,
    required this.phonenumber,
  });

  @override
  State<AdminOrganizerAssign> createState() => _AdminOrganizerAssignState();
}

class _AdminOrganizerAssignState extends State<AdminOrganizerAssign> {
  final _formKey = GlobalKey<FormState>();

  final List<String> _events = [
    'Mohiniyattam',
    'Oppana',
    'Kolkkali',
    'Break Dance'
  ];
  String? _selectedEvent;

  final OrganizerController _organizerController =
      Get.put<OrganizerController>(OrganizerController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: Column(
                children: [
                  SizedBox(height: size.height * 0.05),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          size: size.width * 0.06,
                        ),
                      ),
                      SizedBox(width: size.height * 0.09),
                      Text(
                        "Organizer",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: size.width * 0.05,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                  SizedBox(height: size.height * 0.05),
                  CircleAvatar(
                    radius: size.width * 0.12,
                    backgroundImage: const AssetImage('images/user.png'),
                  ),
                  SizedBox(height: size.height * 0.02),
                  Text(widget.name,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: size.width * 0.05,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(height: size.height * 0.02),
                  Row(
                    children: [
                      SizedBox(width: size.width * 0.06),
                      Text("ID Number ",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: size.width * 0.05,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                  Container(
                    width: size.width * 0.8,
                    height: size.height * 0.06,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1.5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 10),
                        Text(widget.id,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: size.width * 0.05,
                              fontWeight: FontWeight.bold,
                            )),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  Row(
                    children: [
                      SizedBox(width: size.width * 0.06),
                      Text("Phone Number ",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: size.width * 0.05,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                  Container(
                    width: size.width * 0.8,
                    height: size.height * 0.06,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1.5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 10),
                        Text(widget.phonenumber,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: size.width * 0.05,
                              fontWeight: FontWeight.bold,
                            )),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  SizedBox(
                    width: size.width * 0.8,
                    child: DropdownButtonFormField<String>(
                      value: _selectedEvent,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 12),
                      ),
                      hint: const Text('Assign Event'),
                      items: _events.map((event) {
                        return DropdownMenuItem(
                          value: event,
                          child: Text(event),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedEvent = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  SizedBox(
                    width: size.width * 0.58,
                    height: size.height * 0.04,
                    child: ElevatedButton(
                      onPressed: () => _addEvent(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 49, 52, 55),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        "Add",
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  const Text(
                    'Selected Events:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: size.height * 0.15,
                    width: size.width * 0.9,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Obx(() {
                      final selectedEvents =
                          _organizerController.getEvents(widget.id);
                      return selectedEvents.isEmpty
                          ? const Center(
                              child: Text('No events selected'),
                            )
                          : ListView.builder(
                              itemCount: selectedEvents.length,
                              itemBuilder: (context, index) {
                                return Row(
                                  children: [
                                    const Text('• ',
                                        style: TextStyle(fontSize: 16)),
                                    Expanded(
                                      child: Text(
                                        selectedEvents[index],
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                    }),
                  ),
                  SizedBox(height: size.height * 0.02),
                  CustomButton(
                    text: "Assign",
                    onpressed: () {
                      Get.back();
                    },
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _addEvent() {
    if (_selectedEvent != null) {
      _organizerController.addEvent(widget.id, _selectedEvent!);
    }
  }
}
