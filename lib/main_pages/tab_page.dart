import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modu/main_pages/answer_page.dart';
import 'package:modu/chat_pages/message_list_screen.dart';
import 'package:modu/main_pages/chating_page.dart';
import 'package:modu/main_pages/search_page.dart';
import 'package:modu/main_pages/account_page.dart';
import 'package:modu/main_pages/home_page.dart';

class TabPage extends StatefulWidget {
  final User user;

  TabPage(this.user);

  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int _selectedIndex = 0;

  late List _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      HomePage(widget.user),
      AnswerPage(widget.user),
      SearchPage(widget.user),
      ChatingPage(widget.user),
      AccountPage(widget.user)
    ];
  }

  @override
  Widget build(BuildContext context) {
    print('tab_page created');
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: '커뮤니티'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: '강사 검색'),
          BottomNavigationBarItem(icon: Icon(Icons.question_answer), label: '대화'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'MY'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}