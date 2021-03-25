import 'package:flutter/material.dart';

import '../components/ti_component.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState(); 
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TiComponent(
              label: "Email", 
              hint: "Input your Email",
              validate: (String value){
                if (value.isEmpty){
                  return "Please input your Email";
                }else{
                  return null;
                }
              }, 
              change: (String value){
                print("Email: $value");
              },
            ),

            SizedBox(
              height: 20.0,
            ),

            TiComponent(
              label: "Password", 
              hint: "Input your Password",
              validate: (String value){
                if (value.isEmpty){
                  return "Please input your Password";
                }else{
                  return null;
                }
              }, 
              change: (String value){
                print("Password: $value");
              },
            ), 

            SizedBox(
              height: 20.0,
            ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RaisedButton(
                  child: Text(
                    "LOGIN",
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                  color: Colors.lightBlue,
                  onPressed: (){},
                ),
                Text("data 2"),
              ],
            ),

          ],
        ),
      ),
    );
  }
}