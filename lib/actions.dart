import 'package:supabase_flutter/supabase_flutter.dart';


Future<void> createNote(String title, String content) async {
    try{
    final response = await Supabase.instance.client
    .from('notes')
    .insert({'title': title,
    'content': content});
    return response;
    } catch (e) {
        print('Failed: $e');
    }
    print('$title');
}

Future<List<Map<String, dynamic>>> fetchNotes() async {
    try{
    final response = await Supabase.instance.client
    .from('notes')
    .select();
    return response;
    }catch (e) {
      print('Failed: $e');
    }
    return [];
}

Future<void> updateNote(String id, String newTitle, String newContent) async{
 try{
  final response = await Supabase.instance.client
  .from('notes')
  .update({
    'title': newTitle,
    'content': newContent,
    'LastUpdated': DateTime.now().toIso8601String()
  })
  .eq('id', id);
  return response;
 }catch(e){
  throw Exception('Error Updating Note: $e');
 }
}

/*
Find a way to have a usable update, when the update icon is pressed the data from that card should still be intact
the update should automatically know which data id you pressed when you click the update button
*/
