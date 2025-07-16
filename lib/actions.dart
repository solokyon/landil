import 'package:supabase_flutter/supabase_flutter.dart';

  final response = Supabase.instance.client;


Future<void> createNote(String title, String content) async {
    try{
    response
    .from('notes')
    .insert({'title': title,
    'content': content});
    } catch (e) {
        throw Exception('Error Updating Note: $e');
    }
}

Future<List<Map<String, dynamic>>> fetchNotes() async {
    try{
    response
    .from('notes')
    .select();
    }catch (e) {
      throw Exception('Error Updating Note: $e');
    }
    return [];
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
    throw Exception('Error Updating Note: $e');
  }
}

//add delete feature
//add trash feature where you can recover your old notes within 30 days

