import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';
import 'package:bmi_calculator/ResultPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //required fields
  int age = 17;
  int weight = 50;
  int height = 170;
  double maxHeight = 220;
  double minHeight = 90;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALC"),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 5.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.pink),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'assets/man.png',
                          height: 100.0,
                          width: 100.0,
                        ),
                        Padding(padding: EdgeInsets.only(top: 10)),
                        Text(
                          'Male',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              fontStyle: FontStyle.italic),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.pink),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'assets/girl.png',
                          height: 100.0,
                          width: 100.0,
                        ),
                        Padding(padding: EdgeInsets.only(top: 10)),
                        Text(
                          'Female',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              fontStyle: FontStyle.italic),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.pink),
                      child: Column(
                        children: [
                          Padding(padding: EdgeInsets.all(10)),
                          Text(
                            '       HEIGHT - $height cm ',
                            style: TextStyle(
                                fontSize: 20,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold),
                          ),
                          Slider(
                            value: height.toDouble(),
                            min: minHeight,
                            max: maxHeight,
                            activeColor: Colors.black,
                            inactiveColor: Colors.white,
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            },
                          ),
                          Padding(padding: EdgeInsets.all(10))
                        ],
                      )),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                    child: Container(
                        margin: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.pink),
                        child: Column(
                          children: [
                            Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 10)),
                            Text(
                              '  WEIGHT - $weight KG ',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 10)),
                            Container(
                              width: 150.0,
                              child: RaisedButton(
                                  color: Colors.orange,
                                  child: Text(
                                    "Pick Your Weight",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () => showMaterialNumberPicker(
                                        context: context,
                                        title: "Pick Your Age",
                                        maxNumber: 250,
                                        minNumber: 10,
                                        selectedNumber: weight,
                                        onChanged: (value) =>
                                            setState(() => weight = value),
                                      )),
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                            ),
                          ],
                        ))),
                Expanded(
                    child: Container(
                        margin: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.pink),
                        child: Column(
                          children: [
                            Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 10)),
                            Text(
                              '  AGE - $age year ',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 10)),
                            Container(
                              width: 150.0,
                              child: RaisedButton(
                                  color: Colors.orange,
                                  child: Text(
                                    "Pick Your Age",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () => showMaterialNumberPicker(
                                        context: context,
                                        title: "Pick Your Age",
                                        maxNumber: 100,
                                        minNumber: 14,
                                        selectedNumber: age,
                                        onChanged: (value) =>
                                            setState(() => age = value),
                                      )),
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                            ),
                          ],
                        ))),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 16)),
            Row(
              children: <Widget>[
                Expanded(
                    child: Container(
                        margin: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.yellow),
                        child: MaterialButton(
                          child: Text("Calculate",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 23)),
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ResultPage(
                                        height,
                                        weight,
                                      ))),
                        ))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
