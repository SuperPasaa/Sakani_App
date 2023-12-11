import 'package:abdo/AddPropertypageone.dart';
import 'package:abdo/show_property.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 80,
          ),
          AnimatedTextKit(
            animatedTexts: [
              WavyAnimatedText('You can add property',
                  textStyle: TextStyle(
                    color: Colors.blue,
                    fontSize: 30,
                  )),
              WavyAnimatedText(
                'مش بس كده',
                textStyle: TextStyle(
                  color: Colors.green[600],
                  fontSize: 30,
                ),
              ),
              WavyAnimatedText(
                'You can show property',
                textStyle: TextStyle(
                  color: Colors.green[600],
                  fontSize: 30,
                ),
              ),
            ],
            repeatForever: true,
            onTap: () {
              print("Tap Event");
            },
          ),
          SizedBox(
            height: 200,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AddProOne(),)) ;
              },
              child: Container(
                height: 100, // Set the height as needed
                width: double.infinity, // Set the width as needed
                child: Card(
                  color: Color(0xfff69422),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      "Add Property",
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 150,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ShowProperty(),),);
              },
              child: Container(
                height: 100, // Set the height as needed
                width: double.infinity, // Set the width as needed
                child: Card(
                  color: Color(0xfff69422),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      "Show property",
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
