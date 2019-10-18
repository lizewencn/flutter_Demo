import 'package:flutter/widgets.dart';

/**
 * 模仿Android中ratingbar
 */
class RatingBar extends StatefulWidget {
  //当前评分值
  final double value;

//星星总数量
  final int count;

  //最高分
  final double maxRating;

  //未选中星星
  final String normalImage;

  //选中状态的星星
  final String selectedImage;

  //是否可以选择,默认可以
  final bool selectable;

  //单个星星的大小
  final double size;

  //每个星星之间的间隔距离
  final double space;

  final ValueChanged<double> onRatingUpdate;

  RatingBar(
      {
      //默认最多五星
      this.count = 5,
      this.maxRating = 10.0,
      this.normalImage,
      this.selectedImage,
      this.selectable = true,
      this.size = 20,
      this.space = 3,
      this.value = 0.0,
      @required this.onRatingUpdate}):assert(normalImage !=null) ,assert(selectedImage !=null);

  @override
  _RatingBarState createState() => new _RatingBarState();
}

class _RatingBarState extends State<RatingBar> {
  double value;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Listener(
      child: BuildRatingBar(),
      onPointerDown: (PointerDownEvent event) {
        var dx = event.localPosition.dx;
        print("RatingState：onPointerDown，dx = $dx");
        if (dx <= 0) dx = 0;
        calculateValue(dx);
      },
      onPointerMove: (PointerMoveEvent event) {
        var dx = event.localPosition.dx;
        print("RatingState：onPointerMove，dx = $dx");
        calculateValue(dx);
      },
      onPointerUp: (_) {},
      behavior: HitTestBehavior.deferToChild,
    );
  }

  calculateValue(double x) {
    print("calculateValue x = $x");
    if (!widget.selectable) {
      return;
    }

    var maxWidth =
        widget.size * (widget.count) + widget.space * (widget.count - 1);
    if (x >= maxWidth) {
      //超出最大
      value = widget.maxRating;
    } else {
      //在星星间隔位置，忽略
      for (int i = 1; i < widget.count + 1; i++) {
        if (x > widget.size * i + widget.space * (i - 1) &&
            x < widget.size * i + (widget.space * i)) {
          value = i * (widget.maxRating / widget.count);
          break;
        } else if (x >= widget.size * (i - 1) + widget.space * (i - 1) &&
            x <= (widget.size * i + widget.space * i)) {
          //在星星区域内

          var totalSpace = widget.space * (i - 1); //所有间隔距离之和
          value = (x - totalSpace) /
              (widget.size * widget.count) *
              widget.maxRating;
          break;
        }
      }
    }
    print("计算后, 新的 value = $value");
    //更新状态
    setState(() {
      print("setState");
      widget.onRatingUpdate(value);
    });
  }

  Widget BuildRatingBar() {
    print("BuildRatingBar");
    return new Container(
      child: new Stack(
        children: <Widget>[
          new Row(
            children: buildNormalRow(),
          ),
          new Row(
            children: buildColorStars(),
          )
        ],
      ),
    );
  }

  //计算在当前分值应该有的满星数量
  int fullStarNum() {
    print("fullStar():计算满星数量");
    if (value != null) {
      return value ~/ (widget.maxRating / widget.count);
    }
    return 0;
  }

  /**
   * 计算非完全着色的的星星的着色率
   */
  double brokenStartRate() {
    //每个星星代表的分值
    var rating = widget.maxRating / widget.count;
    //当前分值刚好是每个星代表的分值的整数倍、
    if (value % rating == 0) {
      return 0.0;
    }
    var rate = value % rating / rating;
    return rate;
  }

  /**
   * 创建星星
   */
  List<Widget> buildNormalRow() {
    print("buildNormalRow");
    List<Widget> children = [];

    for (int i = 0; i < widget.count; i++) {
      children.add(new Image.asset(
        widget.normalImage,
        width: widget.size,
        height: widget.size,
      ));

      //星星之间的间隔距离
      if (i < widget.count - 1) {
        children.add(new SizedBox(
          width: widget.space,
        ));
      }
    }
    return children;
  }

  /**
   * 构建有色星星
   */
  List<Widget> buildColorStars() {
    print("buildColorStars");
    List<Widget> children = [];
    var fullStar = fullStarNum();
    var rate = brokenStartRate();
    //构建满星
    for (int i = 0; i < fullStar; i++) {
      children.add(new Image.asset(
        widget.selectedImage,
        height: widget.size,
        width: widget.size,
      ));
      if (i < fullStar) {
        children.add(new SizedBox(
          width: widget.space,
        ));
      }
    }

    //构建未满色的星
    if (fullStar != widget.count) {
      children.add(new ClipRect(
        clipper: _RatingClipper(rating: widget.size * rate),
        child: Image.asset(
          widget.selectedImage,
          width: widget.size,
          height: widget.size,
        ),
      ));
    }
    return children;
  }
}

class _RatingClipper extends CustomClipper<Rect> {
  final double rating;

  _RatingClipper({this.rating});

  @override
  Rect getClip(Size size) {
    // TODO: implement getClip
    return new Rect.fromLTRB(0.0, 0.0, rating, size.height);
  }

  @override
  bool shouldReclip(_RatingClipper oldClipper) {
    // TODO: implement shouldReclip
    return rating != oldClipper.rating;
  }
}
