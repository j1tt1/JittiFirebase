import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  Widget passwordTextField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(width: 1.0, color: Colors.blue)),
          labelText: 'Password',
          hintText: 'Type Your Password',
          icon: Icon(Icons.lock, color: Colors.red[200])),
    );
  }

  Widget emailTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(width: 1.0, color: Colors.blue)),
          labelText: 'Email :',
          hintText: 'you@mail.com',
          icon: Icon(Icons.email, color: Colors.red[200])),
    );
  }

  Widget nameTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(width: 1.0, color: Colors.blue)),
          labelText: 'Name :',
          hintText: 'Type Your Name',
          icon: Icon(
            Icons.perm_identity,
            color: Colors.red[200],
          )),
    );
  }

  Widget uploadButton() {
    return IconButton(
      icon: Icon(Icons.cloud_upload),
      tooltip: 'Upload To Firebase',
      onPressed: () {
        print('You click upload');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[400],
        title: Text('Register'),
        actions: <Widget>[uploadButton()],
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: RadialGradient(
                colors: [Colors.white, Colors.blue[400]],
                radius: 2.0,
                center: Alignment(0, -1))),
        padding: EdgeInsets.all(50.0),
        child: Column(
          children: <Widget>[
            nameTextFormField(),
            Container(
              margin: EdgeInsets.only(
                top: 15.0,
                bottom: 15.0,
              ),
              child: emailTextFormField(),
            ),
            passwordTextField()
          ],
        ),
      ),
    );
  }
}
