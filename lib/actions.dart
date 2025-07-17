import 'package:supabase_flutter/supabase_flutter.dart';

  final response = Supabase.instance.client;


Future<void> createNote(String title, String content) async {
    try{
    response
    .from('notes')
    .insert({'title': title,
    'content': content});
    } catch (e) {
        throw Exception('Error Adding Note: $e');
    }
}

Future<List<Map<String, dynamic>>> fetchNotes() async {
    try{
     final response = await Supabase.instance.client
    .from('notes')
    .select();
    return List<Map<String, dynamic>>.from(response);
    }catch (e) {
      throw Exception('Error Fetching Note: $e');
    }
}

Future<void> updateNote(String id, String newTitle, String newContent) async{
 try{
  response
  .from('notes')
  .update({
    'title': newTitle,
    'content': newContent,
    'LastUpdated': DateTime.now().toIso8601String()
  })
  .eq('id', id);
 }catch(e){
  throw Exception('Error Updating Note: $e');
 }
}

Future<void> deleteNote(String id) async {
  try{
    response
    .from('notes')
    .delete()
    .eq('id', id);
  }catch(e){
    throw Exception('Error Deleting Note: $e');
  }
}

//add delete feature
//add trash feature where you can recover your old notes within 30 days

