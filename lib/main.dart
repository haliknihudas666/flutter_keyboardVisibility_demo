import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

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
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: KeyboardVisibilityBuilder(
        builder: (context, isKeyboardVisible) {
          return isKeyboardVisible ? _openedKeyboard() : _closedKeyboard();
        },
      ),
    );
  }

  Widget _openedKeyboard() {
    return Container(
      child: Column(
        children: [
          _mobileNumberForm(),
        ],
      ),
    );
  }

  Widget _closedKeyboard() {
    return Container(
      child: Column(
        children: [
          FlutterLogo(),
          //When added this third column we can now see the keyboard issue
          Column(
            children: [
              _mobileNumberForm(),
            ],
          )
        ],
      ),
    );
  }

  Widget _mobileNumberForm() {
    return Column(
      children: <Widget>[
        Text('LOGIN'),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: InputDecorator(
            decoration: InputDecoration(
              labelText: 'Mobile Number',
              labelStyle: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '+63',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: TextField(
                    cursorColor: Colors.white,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      counterText: '',
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                      ),
                      hintText: "Philippine Phone Number",
                    ),
                    keyboardType: TextInputType.phone,
                    maxLines: 1,
                    maxLength: 10,
                    onChanged: (value) {},
                    textInputAction: TextInputAction.done,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
