// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  int phoneno = 0;
  bool _passwordVisible = true;
  String email = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
        home: Scaffold(
      // return Scaffold(
      appBar: AppBar(
        title: const Text('', style: TextStyle(color: Color(0xFFFFFFFF))),
        // titleTextStyle: Colors.red,
        elevation: 0,
        toolbarHeight: 45,
        foregroundColor: Colors.black,
        backgroundColor: Colors.orange[900],
        actions: <Widget>[],
      ),
      body: SafeArea(
        child: Container(
          decoration: new BoxDecoration(),
          height: MediaQuery.of(context).size.height * 1,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 10),
                ),

                // SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                      fontSize: 18,
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [],
                ),

                Padding(
                  padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
                  // height: 80,

                  child: TextFormField(
                      style: TextStyle(
                        // height: 0.01,
                        color: Colors.black,
                        decorationColor: Colors.black,
                      ),
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          email = value;
                        });
                      },
                      decoration: InputDecoration(
                        // border: OutlineInputBorder(),
                        labelText: 'Email Id',
                        hintText: "Enter email",
                        labelStyle: TextStyle(color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange),
                        ),
                      ),
                      cursorHeight: 20,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      cursorColor: Colors.black,
                      autofocus: true,
                      inputFormatters: [
                        FilteringTextInputFormatter.singleLineFormatter
                      ],
                      keyboardType: TextInputType.emailAddress),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
                  // height: 80,

                  child: TextField(
                      style: TextStyle(
                        // height: 0.01,
                        color: Colors.black,
                        decorationColor: Colors.black,
                      ),
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          password = value;
                        });
                      },
                      decoration: InputDecoration(
                        // border: OutlineInputBorder(),
                        labelText: 'Password',
                        hintText: "Enter password",
                        labelStyle: TextStyle(color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            // Based on passwordVisible state choose the icon
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.orangeAccent,
                          ),
                          onPressed: () {
                            // Update the state i.e. toogle the state of passwordVisible variable
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                      ),
                      obscureText: _passwordVisible,
                      cursorHeight: 20,
                      cursorColor: Colors.black,
                      autofocus: false,
                      inputFormatters: [
                        FilteringTextInputFormatter.singleLineFormatter
                      ],
                      keyboardType: TextInputType.text),
                ),
                SizedBox(height: 40),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      // style:raisedButtonStyle,
                      style: ElevatedButton.styleFrom(
                        minimumSize:
                            Size(MediaQuery.of(context).size.width * 0.80, 40),
                        primary: Colors.orange[800],

                        // double.infinity is the width and 30 is the height
                      ),

                      onPressed: () {
                        Navigator.pushNamed(context, '/dashboard');
                        print(email);
                      },

                      child: const Text(
                        'Next',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w800),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
