import 'package:http/http.dart' as http;
import 'package:netflix_app_api/core/api_strings.dart';

Future<void> red()async{
  final response = await http.get(Uri.parse(nowPlayingUrl));
  if(response.statusCode == 200){

  }

  //

}