import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bem Vindo Marcelino"),
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
      color: Colors.white,
      child: SizedBox.expand(
        child: _img(),
      ),
    );
  }

  _img(){
    return Image.asset(
        "assets/images/game4.jpg",
      width: 300,
      height: 300,
      fit: BoxFit.cover,
    );
  }
  
  _text() {
    return Text(
      "Eae Marcelino, Blz ?",
      style: TextStyle(
        fontSize: 30,
        color: Colors.blue,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        decoration: TextDecoration.underline,
        decorationColor: Colors.black,
      ),
    );
  }
}