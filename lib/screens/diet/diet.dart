// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:diabe/theme/app_style.dart';
import 'package:flutter/material.dart';

class Diet extends StatefulWidget {
  static const routeName = "/diet";

  const Diet({Key? key}) : super(key: key);

  @override
  State<Diet> createState() => _DietState();
}

class _DietState extends State<Diet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.blueAccent),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )),
      body: SizedBox(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "7 Days Diabetic plan",
                    style: AppStyle.textstyleoutfitmedium24,
                  ),
                  SizedBox(height: 30),
                  Image.asset('assets/images/diet_plan.png',),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}