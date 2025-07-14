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
  final TextEditingController idController = TextEditingController();
  final TextEditingController updatetitleController = TextEditingController();
  final TextEditingController updatecontentController = TextEditingController();

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
                      (onPressed: () async {
                        createNote(titleController.text, contentController.text);
                        loadNotes();
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
          return Card(
            child: ListTile(
              trailing: IconButton(onPressed: (){
                idController.text = note['id'].toString();
                updatetitleController.text = note['title'];
                updatecontentController.text = note['content'];
                showDialog(context: context,
                builder: (context) => Dialog(
                  child:Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      TextField(  
                        controller: idController,
                        readOnly: true,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: updatetitleController,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: updatecontentController,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextButton
                      (onPressed: () async {
                        updateNote(idController.text,
                        updatetitleController.text,
                        updatecontentController.text
                      );
                        loadNotes();
                      },
                      child: Text('Update Note')
                     ),
                    ],
                  ),
                ),
                )
                );
              },
              icon: Icon(Icons.edit)
              ),
              title: Text(note['title']),
              subtitle: Text(note['content']),
            ),
          );
        }
      ),
    );
  }
}