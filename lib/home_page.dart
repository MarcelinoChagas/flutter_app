import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutterapp/pages/hello_page1.dart';
import 'package:flutterapp/pages/hello_page2.dart';
import 'package:flutterapp/pages/hello_page3.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Seja Bem Vindo"),
        centerTitle: true,
      ),
      body: _body(context),
    );
  }


  _body(context) {
    return Container(
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _text(),
          _pageView(),
          _buttons(context)
        ],
      )
    );
  }

  _pageView() {
    return Container(
          margin: EdgeInsets.only(top:20, bottom: 20),
          height: 300,
          child: PageView(
            children: <Widget>[
              _img("assets/images/game1.jpg"),
              _img("assets/images/game2.jpg"),
              _img("assets/images/game3.jpg"),
              _img("assets/images/game4.jpg"),
              _img("assets/images/game5.jpg")
            ],
          ),
        );
  }

  _buttons(context) {
    return Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _button(context,"ListView", () => _onClickNavigator(context, HelloPage1())),
                _button(context,"Page 2",  () => _onClickNavigator(context, HelloPage2())),
                _button(context,"Page 3", () => _onClickNavigator(context, HelloPage3()))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _button(context,"Snack", _onClickSnack),
                _button(context,"Dialog", _onClickDialog),
                _button(context,"Toast", _onClickToast)
              ],
            )
          ],
        );
  }

  _button(BuildContext context, String text, Function onPressed) {
    return RaisedButton(
      color: Colors.red,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      onPressed: onPressed
      ,
    );
  }

  _img(String img) {
    return Image.asset(
      img,
      width: 300,
      height: 300,
      fit: BoxFit.cover,
    );
  }

  _text() {
    return Text(
      "Jogos",
      style: TextStyle(
        fontSize: 20,
        color: Colors.red,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        decoration: TextDecoration.underline,
        decorationColor: Colors.black,
      ),
    );
  }

  void _onClickNavigator(BuildContext context, Widget page){
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
      return page;
    }));
  }

  _onClickDialog() {
  }

  _onClickToast() {
  }

  _onClickSnack() {
  }
}
