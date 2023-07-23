import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/bottombutton.dart';
import '../components/card.dart';
import '../constraints.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {required this.bmi, required this.result, required this.interpretation});
  final String bmi;
  final String result;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 10.0, left: 15.0),
              child: Text(
                'Your Results',
                style: kResultsTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              color: kActiveCardColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(result.toUpperCase(), style: kResultsTextStyle),
                  Text(bmi, style: kBmiTextStyle),
                  Text(
                    interpretation,
                    style: kBmiBodyTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  Text("Thank You!",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30), ),


                ],
              ),
            ),
          ),
          PageBottomButton(
            label: 'RE-CALCULATE',
            onPress: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}