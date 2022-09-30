import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AccountPage extends StatelessWidget {
  final User user;

  AccountPage(this.user, {super.key});

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar() as PreferredSizeWidget?,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          _buildProfile(),
        ],
      ),
    );
  }

  Widget _buildProfile() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                SizedBox(
                  width: 80.0,
                  height: 80.0,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(user.photoURL!),
                  ),
                ),
                Container(
                  width: 80.0,
                  height: 80.0,
                  alignment: Alignment.bottomRight,
                  child: Stack(
                    alignment: Alignment.center,
                    children: const <Widget>[
                      SizedBox(
                        width: 28.0,
                        height: 28.0,
                        child: FloatingActionButton(
                          onPressed: null,
                          backgroundColor: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 25.0,
                        height: 25.0,
                        child: FloatingActionButton(
                          backgroundColor: Colors.blue,
                          onPressed: null,
                          child: Icon(Icons.add),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
            ),
            Text(
              user.displayName!,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      backgroundColor: const Color.fromARGB(0xff, 242, 223, 188),
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
            '마이 페이지',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold
            ),
          ),
        ],
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.exit_to_app),
          color: Colors.black,
          onPressed: () {
            // 로그아웃
            FirebaseAuth.instance.signOut();
            _googleSignIn.signOut();
          },
        )
      ],
    );
  }

  // 내 게시물 가져오기
  Stream<QuerySnapshot> _postStream() {
    return FirebaseFirestore.instance
        .collection('post')
        .where('email', isEqualTo: user.email)
        .snapshots();
  }
}