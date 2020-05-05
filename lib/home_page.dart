
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutterapp/pages/hello_listview.dart';
import 'package:flutterapp/pages/hello_page1.dart';
import 'package:flutterapp/pages/hello_page2.dart';
import 'package:flutterapp/pages/hello_page3.dart';
import 'package:flutterapp/utils/nav.dart';
import 'package:flutterapp/widgets/blue_button.dart';

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
                BlueButton("ListView", onPressed: () => _onClickNavigator(context, HelloListView())),
                BlueButton("Page 2",onPressed: () => _onClickNavigator(context, HelloPage2())),
                BlueButton("Page 3",onPressed: ()=> _onClickNavigator(context, HelloPage3()))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                BlueButton("Snack", onPressed: _onClickSnack),
                BlueButton("Dialog", onPressed: _onClickDialog),
                BlueButton("Toast", onPressed: _onClickToast)
              ],
            )
          ],
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

  void _onClickNavigator(BuildContext context, Widget page) async{

   String s = await push(context, page);

   print(">> $s");
  }

  _onClickDialog() {
  }

  _onClickToast() {
  }

  _onClickSnack() {
  }
}
