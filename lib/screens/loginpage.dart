import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:velocity_x/velocity_x.dart';

import '../constraints.dart';
import 'input.dart';
// import 'package:flutter_master/utils/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool thisButton = false;
  final _formKey = GlobalKey<FormState>();

  void moveToHome(BuildContext context) async {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      setState(() {
        thisButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.push(
          context, MaterialPageRoute(builder: (context) => InputPage()));
      setState(() {
        thisButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("BODY MASS INDEX"),
          centerTitle: true,
        ),
        backgroundColor: kActiveCardColor,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                15.heightBox,
                Image.asset(
                  "assets/icons/pngwing.com (1).png",
                  scale: 2.5,
                  fit: BoxFit.contain,
                ),
                typeAnimation(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "STAY HEALTHY $name ",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Icon(
                      CupertinoIcons.smiley,
                      color: Colors.white,
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Username",
                          labelText: "Name",
                          fillColor: kInactiveCardColor,
                        ),
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            return "Username can't be empty";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            name = value;
                          });
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Password",
                            labelText: "Password",
                            fillColor: kInactiveCardColor,
                            hoverColor: Colors.white),
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            return "Password can't be empty";
                          } else if (value!.length < 6) {
                            return "Password must contain at least 6 characters";
                          }
                          return null;
                        },
                        obscureText: true,
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () => moveToHome(context),
                  child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    width: thisButton ? 50 : 100,
                    height: 50,
                    decoration: BoxDecoration(
                      color: kInactiveCardColor,
                      borderRadius: thisButton
                          ? BorderRadius.circular(50)
                          : BorderRadius.circular(8),
                    ),
                    child: thisButton
                        ? Icon(
                            Icons.done,
                            size: 30,
                            color: Colors.green,
                          )
                        : Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                    alignment: Alignment.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget typeAnimation() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20),
    color: Colors.transparent,
    height: 50.0,
    child: Center(
      child: DefaultTextStyle(
        style: const TextStyle(
          color: Colors.white,
          fontSize: 15.0,
          fontWeight: FontWeight.bold,
        ),
        child: AnimatedTextKit(
          animatedTexts: [
            TyperAnimatedText(
                '"Health is a priceless wealth. Invest while you can." – Faheem Rao. '),
          ],
          repeatForever: true,
        ),
      ),
    ),
  );
}
