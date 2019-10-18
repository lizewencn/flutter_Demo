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
  _MyState createState() => _MyState();
}

class _MyState extends State<Direct> {
  var titleStyle = TextStyle(
      fontSize: 14, color: Colors.blue, decoration: TextDecoration.none);

  var actionsDescTextStyle = TextStyle(
      fontSize: 10,
      color: Colors.black,
      letterSpacing: 0.5,
      decoration: TextDecoration.none);

  double actionTitleMarginTop = 5;
  double actionMarkMarginTop = 8;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    var titleText = Text(
      "Strawberry Pavlova",
      style: titleStyle,
    );

    var subTitle = new Container(
      width: 180,
      margin: EdgeInsets.only(top: 10),
      child: Text(
        "Pavlova is asd kashdg asguuue wuudasdadasdasdasdasdasdasdasdasdsadsadasdasdwiqe iweiwqyeq iqwueq wiuey dkajh sdgsudfdsjf basjkhs sdasdj xian ",
        softWrap: true,
        overflow: TextOverflow.ellipsis,
        maxLines: 7,
        style: TextStyle(
            fontSize: 12, decoration: TextDecoration.none, color: Colors.red),
      ), //text
    ); //container

    final ratings = Container(
      margin: EdgeInsets.only(top: 12),
      padding: EdgeInsets.only(left: 8, right: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          RatingBar(
            size: 10,
            space: 3,
            value: 6,
            count: 5,
            normalImage: "images/star_normal.png",
            selectedImage: "images/star.png",
            selectable: false,
            onRatingUpdate: (value) {
              setState(() {});
            },
          ), //ratingBar,

          Text(
            "170 Reviews",
            style: TextStyle(
                fontSize: 8,
                decoration: TextDecoration.none,
                color: Colors.black26), //reviews  Text
          ),
        ],
      ),
    );

    final iconList = DefaultTextStyle.merge(
        style: actionsDescTextStyle,
        child: Container(
          margin: EdgeInsets.only(top: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              //prep
              Column(
                children: <Widget>[
                  Icon(
                    Icons.kitchen,
                    color: Colors.green,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: actionTitleMarginTop),
                    child: Text(
                      "PREP:",
                    ),
                  ), //action title end
                  Container(
                    margin: EdgeInsets.only(top: actionMarkMarginTop),
                    child: Text(
                      "25 min",
                    ),
                  ),
                ],
              ), //prep end
              //cook
              Column(
                children: <Widget>[
                  Icon(
                    Icons.timer,
                    color: Colors.green,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: actionTitleMarginTop),
                    child: Text(
                      "COOK",
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: actionMarkMarginTop),
                    child: Text(
                      "1 hr",
                    ),
                  ),
                ],
              ), //cook  end
              //feeds
              Column(
                children: <Widget>[
                  Icon(
                    Icons.restaurant,
                    color: Colors.green,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: actionTitleMarginTop),
                    child: Text(
                      "FEEDS:",
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: actionMarkMarginTop),
                    child: Text(
                      "4-6",
                    ),
                  ),
                ],
              ), //feeds end
            ],
          ),
        ));

    final leftColume = Column(
      key: Key("text column"),
      children: <Widget>[
        //title
        titleText,
        //subTitle
        subTitle,
        //star and reviews
        ratings,
        //actions
        iconList,
        //actions end
      ],
    );

    final mainImage = Container(
      alignment: Alignment.topCenter,
      child: Image.asset(
        "images/pic1.jpg",
        fit: BoxFit.fill,
        alignment: Alignment.topLeft,
      ),
    );

    return Container(
      padding: EdgeInsets.only(top: 24, left: 14, right: 14),
      width: MediaQuery.of(context).size.width,
      height: 600,
      color: Colors.white,
      child: Card(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        key: Key("scaffold row"),
        children: <Widget>[
          //左一级大区域
          Expanded(flex: 2, child: leftColume),

          //右一级大区域
          Expanded(flex: 3, child: mainImage),
        ],
      )),
    );
  }
}
