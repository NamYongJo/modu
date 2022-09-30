import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modu/chat_pages/message_list_screen.dart';
import 'package:modu/main_pages/home_page.dart';


class ChatingPage extends StatelessWidget {
  final User user;

  ChatingPage(this.user);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromARGB(0xff, 242, 223, 188),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                    'images/modu_icon.png',
                    fit: BoxFit.contain,
                    height: 60),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  '커뮤니티',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
            bottom: const TabBar(
              tabs: [
                Tab(text: ('전체'),),
                Tab(text: ('꿀팁'),),
                Tab(text: ('질문'),),
                Tab(text: ('자유'),),
              ],
            ),
          ),
          body: _buildBody()
      ),
    );
  }

  Widget _buildBody() {
    return TabBarView(
      children: [
        HomePage(user),
        MessageListScreen(),
        Icon(Icons.directions_car, size: 350),
        Icon(Icons.directions_transit, size: 350),
      ],
    );
  }
}
