

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:collection';

class ChatMessage{
  String messageContent;
  String messageType;
  ChatMessage({required this.messageContent, required this.messageType});
}

List<ChatMessage> messages = [

];

class MessagesPage extends StatefulWidget {
  final Color color;
  MessagesPage(this.color);
  MessagesPageState createState() => MessagesPageState();
}

class MessagesPageState extends State<MessagesPage> {

  FirebaseAuth auth = FirebaseAuth.instance;
  late User user;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  CollectionReference messages = FirebaseFirestore.instance.collection('messages');

  Future<void> addMessage() {
    Text message = Text(myController.text);
    return messages
        .add({
      'username' : user.email,
      'uid' : user.uid,
      'content' : message,
      'createdAt' : DateTime.now(),
    })
        .then((value) => print("Message Added"))
        .catchError((error) => print("Failed to add message: $error"));
  }

  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            padding: EdgeInsets.only(left: 10,bottom: 10,top: 10),
            height: 60,
            width: double.infinity,
            color: Colors.white,
            child: Row(
              children: <Widget>[
                GestureDetector(
                  onTap: (){
                  },
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Colors.lightBlue,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Icon(Icons.add, color: Colors.white, size: 20, ),
                  ),
                ),
                SizedBox(width: 15,),
                Expanded(
                  child: TextField(
                    controller: myController,
                    decoration: InputDecoration(
                        hintText: "Write message...",
                        hintStyle: TextStyle(color: Colors.black54),
                        border: InputBorder.none
                    ),
                  ),
                ),
                SizedBox(width: 15,),
                FloatingActionButton(
                  onPressed: addMessage,
                  child: Icon(Icons.send,color: Colors.white,size: 18,),
                  backgroundColor: Colors.blue,
                  elevation: 0,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
