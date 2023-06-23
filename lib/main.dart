import 'package:flutter/material.dart';
import 'package:qr_code_generator/style/style.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String data = "";
  String fieldText = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: QrImage(
            data: data,
            backgroundColor: Colors.white,
            size: 300.0,
            version: QrVersions.auto,
          )),
          SizedBox(
            height: 24,
          ),
          Container(
              width: 300,
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    fieldText = value;
                  });
                },
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Enter the Data",
                  fillColor: AppStyle.textColor,
                  filled: true,
                  border: InputBorder.none,
                ),
              )),
          SizedBox(
            height: 24,
          ),
          RawMaterialButton(
            onPressed: () {
              setState(() {
                data = fieldText;
              });
            },
            fillColor: AppStyle.accentColor,
            child: Text("Generate QR Code"),
            shape: StadiumBorder(),
            padding: EdgeInsets.symmetric(horizontal: 36.0, vertical: 16.0),
          ),
        ],
      ),
    );
  }
}
