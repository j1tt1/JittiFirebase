import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
// Explicit
  final formKey = GlobalKey<FormState>();
  String nameString, emailString, passwordString;

  Widget passwordTextField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(width: 1.0, color: Colors.blue)),
          labelText: 'Password :',
          hintText: 'Type Your Password',
          icon: Icon(Icons.lock, color: Colors.red[200])),
      validator: (String value) {
        if (value.length < 6) {
          return 'รหัสผ่านน้อยกว่า 6 ตัวอักษร';
        }
      },
      // เก็บค่าตัวแปร passwordString
      onSaved: (String value) {
        passwordString = value;
      },
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
      validator: (String value) {
        if (value.length == 0) {
          return 'กรุณากรอก Email Address!';
        } else if (!((value.contains('@')) && (value.contains('.')))) {
          return 'Email Address ไม่ถูกต้อง!';
        }
      },
      // เก็บค่าตัวแปร emailString
      onSaved: (String value) {
        emailString = value;
      },
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
      validator: (String value) {
        if (value.length == 0) {
          return 'Please Fill Name!';
        }
      },
      // เก็บค่าตัวแปร nameString
      onSaved: (String value) {
        nameString = value;
      },
    );
  }

  Widget uploadButton() {
    return IconButton(
      icon: Icon(Icons.cloud_upload),
      tooltip: 'Upload To Firebase',
      onPressed: () {
        print('You click upload');
        // validate passed
        if (formKey.currentState.validate()) {
          formKey.currentState.save(); // เก็บค่าตัวแปรทั้งหมด
          print(
              'name = $nameString, email = $emailString, password = $passwordString');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          backgroundColor: Colors.purple[400],
          title: Text('Register'),
          actions: <Widget>[uploadButton()],
        ),
        body: Form(
          key: formKey,
          child: Container(
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
        ));
  }
}
