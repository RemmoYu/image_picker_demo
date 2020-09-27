import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("DEMO"),
      ),
      body: Column(
        children: [
          FlatButton(
            child: Text("take photo"),
            onPressed: _takePhotoAction,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            margin: const EdgeInsets.all(20),
            child: TextField(
              maxLines: 20,
              style: TextStyle(
                color: Color(0xff333333),
                fontSize: 14,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Input text",
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(6.0),
            ),
          )
        ],
      ),
    );
  }

  void _takePhotoAction() async {
    final picker = ImagePicker();
    try {
      await picker.getImage(
        source: ImageSource.camera,
      );
    } catch (error) {
      print(error);
    }
  }
}
