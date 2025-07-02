import 'package:supabase_flutter/supabase_flutter.dart';


Future<void> createNote(String title, String content) async {
    try{
    final response = await Supabase.instance.client
    .from('notes')
    .insert({'title': title, 'content': content});
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
    }catch (e) {
       print('Failed: $e');
    }
    return [];
}

class UpdateNote {

}
