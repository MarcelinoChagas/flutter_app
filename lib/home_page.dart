import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutterapp/drawer_list.dart';
import 'package:flutterapp/pages/hello_listview.dart';
import 'package:flutterapp/pages/hello_page1.dart';
import 'package:flutterapp/pages/hello_page2.dart';
import 'package:flutterapp/pages/hello_page3.dart';
import 'package:flutterapp/utils/nav.dart';
import 'package:flutterapp/widgets/blue_button.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Seja Bem Vindo"),
          bottom: TabBar(tabs:[
            Tab(text: "TAB 1",),
            Tab(text: "TAB 2",),
            Tab(text: "TAB 3",),
          ]),
        ),
        body: TabBarView(children:[
          _body(context),
          _body(context),
          _body(context),
        ],),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              backgroundColor: Colors.red,
              child: Icon(Icons.add),
              onPressed: (){
                _onClickFab();
              },
            ),
            SizedBox(
              width: 10,
            ),
            FloatingActionButton(
              backgroundColor: Colors.red,
              child: Icon(Icons.favorite),
              onPressed: (){
                _onClickFab();
              }
            )
          ],
        ),
        drawer: DrawerList(),
      ),
    );
  }

  _onClickFab(){
    print("Adicionar");
  }
  
  
  _body(context) {
    return Container(
        padding: EdgeInsets.only(top:16),
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[_text(), _pageView(), _buttons(),
          ],
        ));
  }

  _pageView() {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20),
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

  _buttons() {
    return Builder(
      builder: (context) {
        return Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                BlueButton("ListView",
                    onPressed: () =>
                        _onClickNavigator(context, HelloListView())),
                BlueButton("Page 2",
                    onPressed: () => _onClickNavigator(context, HelloPage2())),
                BlueButton("Page 3",
                    onPressed: () => _onClickNavigator(context, HelloPage3()))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                BlueButton("Snack", onPressed: () => _onClickSnack(context)),
                BlueButton("Dialog", onPressed:() => _onClickDialog(context)),
                BlueButton("Toast", onPressed: _onClickToast)
              ],
            )
          ],
        );
      },
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

  void _onClickNavigator(BuildContext context, Widget page) async {
    String s = await push(context, page);

    print(">> $s");
  }

  _onClickDialog(BuildContext context) {
    showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context){
      return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          title: Text("Flutter é muito legal"),
        actions: <Widget>[
          FlatButton(
            child: Text("Cancel"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          FlatButton(
            child: Text("Ok"),
            onPressed: () {
              Navigator.pop(context);
              print("OK!!!");
            },
          )
        ],
        ),
      );
    });
  }

  _onClickToast() {
    Fluttertoast.showToast(
      msg:"Games da Hora",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 2,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0
    );
  }

  _onClickSnack(context) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text("Olá Flutter"),
      action: SnackBarAction(
        textColor: Colors.yellow,
        label: "Ok", onPressed: (){
          print("Ok");
      },
      ),
    ));
  }
}
