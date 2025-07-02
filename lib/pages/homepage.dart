import 'package:flutter/material.dart';
import 'package:landil/actions.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  List<Map<String, dynamic>> _notes = []; 

  void initState(){
    super.initState();
    loadNotes();
  }


  void loadNotes() async {
    final notes = await fetchNotes();
    setState(() {
      _notes = notes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: titleController,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: contentController,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextButton
                      (onPressed: (){
                        createNote(titleController.text, contentController.text);
                      },
                      child: Text('Create Note')
                     ),
                    ],
                  ),
                ),
              );
            },
          );
        }
      ),
      body: ListView.builder(
        itemCount: _notes.length,
        itemBuilder: (context, index) {
          final note = _notes[index];
          return ListTile(
            title: Text(note['title']),
            subtitle: Text(note['content']),
          );
        }
      ),
    );
  }
}