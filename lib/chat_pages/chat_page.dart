import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:modu/chat_pages/chat_message.dart';

class ChatPage extends StatefulWidget {

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(0xff, 242, 223, 188),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
                'images/modu_icon.png',
                fit: BoxFit.contain,
                height: 70),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView(
                children: [
                  ChatMessage("testing message"),
                  ChatMessage("this is the message"),
                ],
          )),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Expanded(
                    child: TextField(
                      decoration: InputDecoration(hintText: "메시지 입력창"),
                      controller: _textEditingController,
                      onSubmitted: _handleSubmitted,
                    ),
                ),
                SizedBox(
                  width: 8.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    _handleSubmitted(_textEditingController.text);
                  },
                  child: Text("Send"),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.amberAccent
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _handleSubmitted(String text){
    Logger().d(text);
    _textEditingController.clear();
  }
}