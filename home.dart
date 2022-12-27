import 'dart:convert';
import 'package:alifappberita/detail.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _posts = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('International Gaming and Esports News')),
      body: ListView.builder(
        itemCount: _posts.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Container(
                height: 100,
                width: 100,
                child: _posts[index]['urlToImage'] != null
                    ? Image.network(
                        _posts[index]['urlToImage'],
                        width: 100,
                        fit: BoxFit.cover,
                      )
                    : Center(),
              ),
              title: Text(
                '${_posts[index]['title']}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(
                '${_posts[index]['description']}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (c) => Detail(
                      url: _posts[index]['url'],
                      title: _posts[index]['title'],
                      content: _posts[index]['content'],
                      publishedAt: _posts[index]['publishedAt'],
                      author: _posts[index]['author'],
                      urlToImage: _posts[index]['urlToImage'],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Future _getData() async {
    try {
      final response = await http.get(Uri.parse(
          'https://newsapi.org/v2/everything?q=esports&apiKey=55e93791954346069890c0dfdaced716'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _posts = data['articles'];
        });
      }
    } catch (e) {
      print(e);
    }
  }
}
