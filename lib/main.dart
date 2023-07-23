import 'package:bmi_calculator_by_rao/screens/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'bmistore.dart';

void main() => runApp(VxState(
    store: BMIStore(),
    interceptors: [LogInterceptor()],
    child: BMICalculator()));

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "BMI Calculator",
      home: LoginPage(),
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Color(0xFF0F0F1E),
      ),
    );
  }
}
