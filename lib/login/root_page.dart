import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modu/login/loading_page.dart';
import 'package:modu/login/login_page.dart';
import 'package:modu/main_pages/tab_page.dart';

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('root_page created');
    return _handleCurrentScreen();
  }

  Widget _handleCurrentScreen() {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        // 연결 상태가 기다리는 중이라면 로딩 페이지를 반환
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingPage();
        } else {
          // 연결 되었고 데이터가 있다면
          if (snapshot.hasData) {
            return TabPage(snapshot.data!);
          }
          return LoginPage();
        }
      },

    );
  }
}