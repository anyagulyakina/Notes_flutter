import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  final PageController _controller = PageController(initialPage: 0);

  Color thistleColor = const Color(0xFFD8BFD8); // Thistle цвет в формате ARGB
  List notes = ['Note 1', 'Note 2', 'Note 3'];
  List noteId = [];
  List noteName = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80.0),
          child: AppBar(
              backgroundColor: thistleColor,
              title: const Text('All notes'),
              centerTitle: false,
              flexibleSpace: const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 30),
                        Text('3 notes', style: TextStyle(fontSize: 13,),),
                      ],
                    ),
                  )
              )
          ),
        ),


        body: GestureDetector(
          onHorizontalDragEnd: (details) {
            if (details.primaryVelocity! < 0) { // Если жест был справа налево
              Navigator.pushNamed(context, '/todo');
            }
          },
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: notes.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(notes[index]),
                      onTap: () {
                        Navigator.pushNamed(context, '/new_note', arguments: {'noteId': noteId[index], 'names': noteName[index]});
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        )
    );
  }
}
