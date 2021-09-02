import 'package:flutter/material.dart';

Widget myAppBar() => AppBar(
      title: RichText(
        text: TextSpan(
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          children: [
            TextSpan(text: 'Mn3m', style: TextStyle(color: Colors.black)),
            TextSpan(text: 'News', style: TextStyle(color: Colors.blue)),
          ],
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
    );

Widget mySharedAppBar() => AppBar(
      title: RichText(
        text: TextSpan(
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          children: [
            TextSpan(text: 'Mn3m', style: TextStyle(color: Colors.black)),
            TextSpan(text: 'News', style: TextStyle(color: Colors.blue)),
          ],
        ),
      ),
      actions: <Widget>[
        Opacity(
          opacity: 0,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(
              Icons.share,
            ),
          ),
        ),
      ],
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
    );
