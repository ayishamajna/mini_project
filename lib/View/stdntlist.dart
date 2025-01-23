import 'package:flutter/material.dart';

class StudentsListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Students List'),
      ),
      body: Column(
        children: [
          ListView(
            children: const [
              SizedBox(
                height: 10,
              ),
              ListTile(
                leading: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.lightBlue,
                  child: Icon(
                    Icons.person,
                    color: Colors.blue,
                  ),
                ),
                title: Text("Name"),
                subtitle: Text(
                  'ID Number',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Divider(),
              ListTile(
                leading: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.lightBlue,
                  child: Icon(
                    Icons.person,
                    color: Colors.blue,
                  ),
                ),
                title: Text("Name"),
                subtitle: Text(
                  'ID Number',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Divider(),
              ListTile(
                leading: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.lightBlue,
                  child: Icon(
                    Icons.person,
                    color: Colors.blue,
                  ),
                ),
                title: Text("Name"),
                subtitle: Text(
                  'ID Number',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
          Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(),
          )
        ],
      ),
    );
  }
}
