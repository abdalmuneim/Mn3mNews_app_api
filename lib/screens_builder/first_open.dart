import 'dart:async';
import '../widget_builder/indecator_build.dart';

import '../screens_builder/home_page.dart';
import '../get_some_data/pview_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class FirstOpen extends StatefulWidget {
  @override
  _FirstOpenState createState() => _FirstOpenState();
}

class _FirstOpenState extends State<FirstOpen> {
  int _currentPage = 0;
  PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    Timer.periodic(Duration(seconds: 6), (timer) {
      if (_currentPage < 6) _currentPage++;
      _controller.animateToPage(_currentPage,
          duration: Duration(milliseconds: 300), curve: Curves.ease);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        // alignment: Alignment.center,
        children: [
          Builder(
            builder: (context) => PageView(
              children: pageViewList.map((item) {
                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(item.img),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    color: Colors.white38,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          item.iconData,
                          size: 100,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          item.title,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            item.det,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
              onPageChanged: (val) {
                setState(() {
                  _currentPage = val;
                });
              },
              controller: _controller,
            ),
          ),
          Align(
            alignment: Alignment(0, .7),
            child: Indcator(
              currentPage: _currentPage,
            ),
          ),
          Builder(
            builder: (context) => Align(
                alignment: Alignment(0, .9),
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: ElevatedButton(
                    onPressed: () async {
                      Navigator.of(context)
                          .pushReplacementNamed(HomePage.routName);
                      SharedPreferences preferences =
                          await SharedPreferences.getInstance();
                      preferences.setBool('view', true);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        'GET START',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.red),
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
