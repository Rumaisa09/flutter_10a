import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  // Define the API endpoint
  final url = 'https://jsonplaceholder.typicode.com/posts';

  // Fetch data from the API
  final response = await http.get(Uri.parse(url));

  // Check if the request was successful
  if (response.statusCode == 200) {
    // Decode the JSON response
    List<dynamic> data = jsonDecode(response.body);

    // Print the fetched data
    for (var item in data) {
      print('Title: ${item['title']}');
      print('Body: ${item['body']}');
      print('---');
    }
  } else {
    // Handle error
    print('Failed to load data: ${response.statusCode}');
  }
}
