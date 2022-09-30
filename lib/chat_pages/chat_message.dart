import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget{
  final String txt;

  const ChatMessage(this.txt, {Key key, }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
      child: Row(
        children: [
          CircleAvatar(
            child: Text("N"),
          ),
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ID or Name',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('message in here'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}