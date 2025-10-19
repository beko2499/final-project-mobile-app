import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../services/local_storage.dart';

class ApiIntegrationScreen extends StatefulWidget {
  @override
  _ApiIntegrationScreenState createState() => _ApiIntegrationScreenState();
}

class _ApiIntegrationScreenState extends State<ApiIntegrationScreen> {
  List<dynamic> posts = [];

  @override
  void initState() {
    super.initState();
    fetchApiData();
  }

  Future<void> fetchApiData() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts?_limit=5'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      await LocalStorage.saveData('apiData', data);
      setState(() => posts = data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('تكامل API خارجي')),
      body: ListView.builder(
        padding: EdgeInsets.all(20),
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(posts[index]['title']),
            subtitle: Text(posts[index]['body']),
          );
        },
      ),
    );
  }
}
