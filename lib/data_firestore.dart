import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Data_Firestore extends StatefulWidget {
  @override
  _Data_FirestoreState createState() => _Data_FirestoreState();
}

class _Data_FirestoreState extends State<Data_Firestore> {
  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: StreamBuilder<QuerySnapshot>(
          stream: db.collection('User').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var doc = snapshot.data.docs;
              return ListView.builder(
                itemCount: doc.length,
                itemBuilder: (context, index) {
                  return Center(
                    child: Text(
                      " Name : ${doc[index].get('Name')} \n Email : ${doc[index].get('Email')}",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
