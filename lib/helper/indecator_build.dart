import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Indcator extends StatelessWidget {
  final int currentPage;

  const Indcator({this.currentPage});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildIndcator(0),
        buildIndcator(1),
        buildIndcator(2),
        buildIndcator(3),
        buildIndcator(4),
        buildIndcator(5),
        buildIndcator(6),
      ],
    );
  }

  buildIndcator(int i) {
    return currentPage == i
        ? Container(
            child: Icon(Icons.star),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          )
        : Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: 15,
            height: 15,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white54,
            ),
          );
  }
}
