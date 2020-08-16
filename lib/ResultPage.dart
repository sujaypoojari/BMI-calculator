import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  final int height;
  final int weight;

  ResultPage(this.height, this.weight);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.all(20.0),
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "$headline",
                    style: TextStyle(fontSize: 30),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      '${bmiResult(this.widget.height, this.widget.weight)}',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        'Normal BMI range',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "18.5 - 25 kg/m",
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Text(
                      '$comment',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          ),
          MaterialButton(
            color: Colors.pink,
            onPressed: () => Navigator.pop(context),
            child: Container(
              margin: EdgeInsets.only(top: 10.0),
              height: MediaQuery.of(context).size.height * 0.1,
              child: Center(
                child: Text('RE-CALCULATE',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

var comment = '';
var headline = '';
bmiResult(h, w) {
  double result = (w / (h * h)) * 10000;

  if (result < 18.5) {
    comment = "You are under Weight";
    headline = "UNDERWEIGHT";
  } else if (result >= 18.5 && result < 25) {
    comment = "You are at a healthy weight.";
    headline = "NORMAL";
  } else if (result > 25 && result <= 29.99) {
    comment = "You are at overweight.";
    headline = "OVERWEIGHT";
  } else {
    comment = "You are obese.";
    headline = "OBESE";
  }

  return result.round();
}
