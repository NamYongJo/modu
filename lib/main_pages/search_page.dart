import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../create_page.dart';
import '../detail_post_page.dart';

class SearchPage extends StatelessWidget {
  final User user;

  SearchPage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar() as PreferredSizeWidget?,
      body: _buildBody(context),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
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
            '강사 검색',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBody(context) {
    print('search_page created');
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('post').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator(),);
            }

            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.0,
                  mainAxisSpacing: 1.0,
                  crossAxisSpacing: 1.0),
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (BuildContext context, int index) {
                return _buildListItem(context, snapshot.data!.docs[index]);
              },
            );
          }
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        child: Icon(Icons.create),
        onPressed: () {
          print('눌림');
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => CreatePage(user)));
        },
      ),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return Hero(
      tag: document.id,
      child: Material(
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DetailPostPage(document, user)),
            );
          },
          child: Image.network(
            document['photoUrl'],
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}