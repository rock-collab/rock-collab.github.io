import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  debugPaintSizeEnabled = true;
  runApp(MySecureApp());
}

class MySecureApp extends StatefulWidget {
  @override
  State<MySecureApp> createState() => _MySecureAppState();
}

class _MySecureAppState extends State<MySecureApp> with WidgetsBindingObserver {
  bool _isInBackground = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    // Secure screen on Android
    secureScreenAndroid();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // if (!Platform.isIOS) return;

    setState(() {
      _isInBackground = state != AppLifecycleState.resumed;
    });
  }

  Future<void> secureScreenAndroid() async {
    // if (Platform.isAndroid) {
    //   await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Stack(
        children: [
          HomePage(),
          if (_isInBackground)
            Scaffold(
              body: Container(
                color: Colors.black,
                child: Center(
                  child: Text(
                    'Privacy Screen',
                    style: TextStyle(color: Colors.white,
                    fontSize: 50),
                  ),
                ),
              ),
            ),

        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Secure App")),
      // body: Center(child: Text("This is your secure content.")),
      body: Column(children: [
        TextButton(onPressed: (){print("jhbjyjgh");}, child: Text("ghjekdfvgyiu"))
      ],),
    );
  }
}