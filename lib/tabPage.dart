import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/widget/RatingBar.dart';

class Direct extends StatefulWidget {
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return Container(
//      padding: EdgeInsets.only(top: 24),
//      color: Colors.white,
//      child: Row(
//        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//        key: Key("scaffold row"),
//        children: <Widget>[
//          Column(
//            key: Key("text column"),
//            children: <Widget>[
//              //title
//              Text(
//                "Strawberry Pavlova",
//                textDirection: TextDirection.ltr,
//                style: TextStyle(
//                    fontSize: 14,
//                    color: Colors.blue,
//                    decoration: TextDecoration.none),
//              ),
//              new RatingBar(
//                value: 3,
//                count: 5,
//                normalImage: "images/star_normal.png",
//                selectedImage: "images/star.png",
//                selectable: true,
//                onRatingUpdate: (value) {
//
//                },
//              ),
//              //desc
//              new Container(
//                width: 180,
//                margin: EdgeInsets.only(top: 10),
//                child: Text(
//                  "Pavlova is asd kashdg asguuue wuuwiqe iweiwqyeq iqwueq wiuey dkajh sdgsudfdsjf basjkhs sdasdj xian ",
//                  softWrap: true,
//                  overflow: TextOverflow.ellipsis,
//                  maxLines: 7,
//                  style: TextStyle(
//                      fontSize: 12,
//                      textBaseline: TextBaseline.alphabetic,
//                      decoration: TextDecoration.none,
//                      color: Colors.red),
//                ), //text
//              ), //container
//              new Container(
//                alignment: Alignment.center,
//                child: Row(), //row
//              ) //container
//            ],
//          ),
//          Container(
//            alignment: Alignment.topLeft,
//            margin: EdgeInsets.only(top: 10),
//            child: Image.asset(
//              "images/pic1.jpg",
//              fit: BoxFit.cover,
//              alignment: Alignment.topLeft,
//            ),
//          ),
//        ],
//      ),
//    );
//  }

  @override
  _MyState createState() =>_MyState();
}

class _MyState extends State<Direct>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.only(top: 24),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        key: Key("scaffold row"),
        children: <Widget>[
          Column(
            key: Key("text column"),
            children: <Widget>[
              //title
              Text(
                "Strawberry Pavlova",
                textDirection: TextDirection.ltr,
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.blue,
                    decoration: TextDecoration.none),
              ),
              new RatingBar(
                value: 3,
                count: 5,
                normalImage: "images/star_normal.png",
                selectedImage: "images/star.png",
                selectable: true,
                onRatingUpdate: (value) {
                  setState(() {

                  });
                },
              ),
              //desc
              new Container(
                width: 180,
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  "Pavlova is asd kashdg asguuue wuuwiqe iweiwqyeq iqwueq wiuey dkajh sdgsudfdsjf basjkhs sdasdj xian ",
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 7,
                  style: TextStyle(
                      fontSize: 12,
                      textBaseline: TextBaseline.alphabetic,
                      decoration: TextDecoration.none,
                      color: Colors.red),
                ), //text
              ), //container
              new Container(
                alignment: Alignment.center,
                child: Row(), //row
              ) //container
            ],
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(top: 10),
            child: Image.asset(
              "images/pic1.jpg",
              fit: BoxFit.cover,
              alignment: Alignment.topLeft,
            ),
          ),
        ],
      ),
    );
  }
}

