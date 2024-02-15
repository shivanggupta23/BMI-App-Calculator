import 'package:flutter/material.dart';

class BMICalculator extends StatefulWidget {
  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  double _height = 0;
  double _weight = 0;
  double _bmi = 0;

  void _calculateBMI() {
    setState(() {
      _bmi = _weight / ((_height / 100) * (_height / 100));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  _height = double.parse(value);
                });
              },
              decoration: InputDecoration(labelText: 'Height (cm)'),
            ),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  _weight = double.parse(value);
                });
              },
              decoration: InputDecoration(labelText: 'Weight (kg)'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _calculateBMI();
              },
              child: Text('Calculate BMI'),
            ),
            SizedBox(height: 16.0),
            _bmi == 0
                ? Container()
                : Container(
                    padding: EdgeInsets.all(16.0),
                    color: Colors.grey[200],
                    child: Text(
                      'BMI: ${_bmi.toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
