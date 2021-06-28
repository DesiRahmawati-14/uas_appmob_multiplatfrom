import 'dart:html';
import 'package:flutter/material.dart';
import 'package:uas/components/customListTile.dart';
import 'package:uas/services/api_service.dart';
import 'package:uas/model/article_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  get client => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Desi Rahmawati", style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.blue,
      ),
        body: FutureBuilder(
          future: buildClient().getArticle(),
          builder: (BuildContext context, AsyncSnapshot<List<Article>> snapsht){
            var snapshot;
                        if (snapshot.hasData) {
              List<Article> articles = snapshot.data;
            return ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) =>
                  customListTile(articles[index], context),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
          },
        ),
    ) ;
  }

  buildClient() => client;
}