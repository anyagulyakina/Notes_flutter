import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class ToDos extends StatefulWidget {
  const ToDos({super.key});

  @override
  State<ToDos> createState() => _ToDo();
}

class _ToDo extends State<ToDos> {

  List todoList = [];
  String userToDo = '';
  Color thistleColor = const Color(0xFFD8BFD8); // Thistle цвет в формате ARGB


  @override
  void initState() {
    super.initState();
    todoList.addAll(['Buy milk', 'Wash dishes']);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: thistleColor,
        title: const Text('To-Dos'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('items').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(), // Отобразить индикатор загрузки по центру
            );
          } else if (snapshot.data != null && snapshot.data!.docs.isNotEmpty) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  key: Key(snapshot.data!.docs[index].id),
                  child: Card(
                    child: ListTile(
                      title: Text(snapshot.data!.docs[index].get('item')),
                    ),
                  ),
                  onDismissed: (direction) {
                    FirebaseFirestore.instance.collection('items').doc(snapshot.data?.docs[index].id).delete();
                  },
                );
              },
            );
          } else {
            return const Text('No notes'); // Отобразить сообщение о пустых данных
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: thistleColor,
        onPressed: () {
          showDialog(context: context, builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Add task to do'),
              content: TextField(
                onChanged: (String value) {
                  userToDo = value;
                },
              ),
              actions: [
                ElevatedButton(onPressed: () {
                  Navigator.of(context).pop();

                  FirebaseFirestore.instance.collection('items').add({'item': userToDo}); // закидываем в бд
                }, child: const Text('add'))
              ],
            );
          });
        },
        child: const Icon(Icons.add, color: Colors.white,),
      ),
    );
  }
}
