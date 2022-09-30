import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void add() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); //Firebase 초기화
}

//할 일 클래스
class Todo{
  bool isDone = false;
  String title;

  Todo(this.title, {this.isDone = false});
}

//TodoListPage 클래스
class TodoListPage extends StatefulWidget{
  @override
  _TodoListPageState createState() => _TodoListPageState();
}

//TodoListPage의 State 클래스
class _TodoListPageState extends State<TodoListPage>{
  //할 일 문자열 조작을 위한 컨트롤러
  var _todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('남은 할일'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _todoController,
                  ),
                ),
                ElevatedButton(
                  child: Text('추가'),
                  onPressed: () => _addTodo(Todo(_todoController.text)), //추가 버튼 클릭 시 _addTodo()메서드 실행
                ),
              ],
            ),
            StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('todo').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData){
                    return CircularProgressIndicator();
                  }
                  final documents = snapshot.data!.docs;
                  return Expanded(
                    child: ListView(
                      children: documents
                          .map((doc) => _buildItemWidget(doc)).toList(), //할일 목록 UI표시
                    ),
                  );
                }
            ),
          ],
        ),
      ),
    );
  }
  //할 일 객체를 ListTile 형태로 변경하는 메서드
  Widget _buildItemWidget(DocumentSnapshot doc){ //Firestore 문서는 DocumentSnapshot 클래스의 인스턴스
    final todo = Todo(doc['title'], isDone: doc['isDone']); //Todo 객체 생성
    return ListTile(
      onTap: () => _toggleTodo(doc), //할 일 완료/미완료
      title: Text(
        todo.title, //할일
        style: todo.isDone //완료일 때는 스타일 적용
            ? TextStyle(
          decoration: TextDecoration.lineThrough, //취소선
          fontStyle: FontStyle.italic, //이탤릭체
        )
            : null, //아무 스타일도 적용 안 함
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete_forever),
        onPressed: () => _deleteTodo(doc), //할 일 삭제
      ),
    );
  }

  //할 일 추가 메서드
  void _addTodo(Todo todo){
    FirebaseFirestore.instance
        .collection('todo')
        .add({'title': todo.title, 'isDone': todo.isDone});
    _todoController.text = '';
  }

  //할 일 삭제 메서드
  void _deleteTodo(DocumentSnapshot doc){
    FirebaseFirestore.instance.collection('todo').doc(doc.id).delete();
  }

  //할 일 완료/미완료 메서드
  void _toggleTodo(DocumentSnapshot doc){
    FirebaseFirestore.instance.collection('todo').doc(doc.id).update({
      'isDone': !doc['isDone'],
    });
  }

  @override
  void dispose() {
    _todoController.dispose(); //사용이 끝나면 해제
    super.dispose();
  }
}