import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutterapp/pages/game_page.dart';
import 'package:flutterapp/utils/nav.dart';

class Game{
  String nome;
  String foto;

  Game(this.nome, this.foto);
}



class HelloListView extends StatefulWidget {

  @override
  _HelloListViewState createState() => _HelloListViewState();
}

class _HelloListViewState extends State<HelloListView> {
  bool _gridView = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.list), onPressed: () {
            print("Lista");
            setState(() {
              _gridView = false;
            });
          },),
          IconButton(icon: Icon(Icons.grid_on), onPressed: () {
            print("Grid");
            setState(() {
              _gridView = true;
            });
          },)
        ],
      ),
      body: _body(),
    );
  }


  _body() {
    List<Game> games = [
      Game("God of War", "assets/images/game1.jpg"),
      Game("Zelda", "assets/images/game2.jpg"),
      Game("Resident Evil 3", "assets/images/game3.jpg"),
      Game("The Evil Whithin", "assets/images/game4.jpg"),
      Game("Metro 2033 Redux", "assets/images/game5.jpg")
    ];

    if (_gridView) {
      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2),
        itemCount: games.length,
        itemBuilder: (context, index) {
          return _itemView(games, index);
        },
      );
    } else {
      return ListView.builder(
        itemExtent: 350,
        itemCount: games.length,
        itemBuilder: (context, index) {
          return _itemView(games, index);
        },
      );
    }
  }

  _itemView(List<Game> games, int index) {
    Game game = games[index];

    return GestureDetector(
      onTap: (){
        push(context, GamePage(game));
      },
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          _img(game.foto),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              margin: EdgeInsets.all(12),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.circular(16)
              ),
              child: Text(
                game.nome,
                style: TextStyle(fontSize: 26, color: Colors.blue),
              ),
            ),
          )
        ],
      ),
    );
  }

  _img(String img) {
    return Image.asset(
      img,
      fit: BoxFit.cover,
    );
  }
}