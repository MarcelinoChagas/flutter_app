
import 'package:flutter/material.dart';
import 'package:flutterapp/pages/hello_listview.dart';

class GamePage extends StatelessWidget {

  final Game game;
  
  GamePage(this.game);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(game.nome),
      ),
      body: Image.asset(game.foto),
    );
  }
}
