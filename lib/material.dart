
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TutorialHome extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: null,
          tooltip: "Navigation Menu",),
        title: Text("Example Title"),
        //菜单操作按钮
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: null,
            tooltip: "search",)
        ],
      ),
      body: Center(
        child: Text("Hello world!"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: "add",
        child: Icon(Icons.add),),
    );
  }
}

class MyButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: (){
        print("MyButton was tapped");
      },
      child: Container(
        height: 36.0,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.lightGreen[500]
        ),
        child: Center(
          child: Text("Engage"),
        ),
      ),
    );
  }

}