import 'dart:math';
import 'package:flutter/material.dart';

class BmiScreen extends StatefulWidget{
  @override
  _BmiScreenState createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  double _result, _weight, _height = 0;
  TextEditingController _weightController = TextEditingController();
  TextEditingController _heightController = TextEditingController();

  void bmiCalculation(var weight, var height){
    this._weight = double.parse(weight);
    this._height = double.parse(height);
    this._result = this._weight / pow(this._height, 2.0);
  }

  double getBMI(){
    if(this._result==null){
      this._result=0;
    }
    return this._result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigoAccent,
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context){
            return IconButton(
              icon: Icon(
                // Icons.access_alarms,
                Icons.arrow_back_ios_new,
                color: Colors.white,
              ),
              // tooltip: 'close',
              onPressed: () {
                Navigator.pop(context);
              },
            );
          },
        ),
        title: Text('BMI Calculator'),
        backgroundColor: Colors.deepPurple,
      ),

      body:SafeArea(
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(top:40.0,left: 10.0 ,right: 10.0,bottom: 20.0),
                  decoration:BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(6,5),
                        blurRadius: 0,
                      ),
                    ],
                    border: Border.all(color: Colors.black,width: 0),
                    borderRadius: BorderRadius.circular(10),
                  ),

                  child: TextField(
                    controller: _weightController,
                    decoration: InputDecoration(
                      hintText: "Input your weight (kg)",
                      labelText: "Weight",
                      labelStyle: TextStyle(
                        fontSize: 20,
                      ),
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,

                  ),
                ),

                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(left: 10.0 ,right: 10.0,bottom: 10.0),
                  decoration:BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(6,5),
                        blurRadius: 0,
                      ),
                    ],
                    border: Border.all(color: Colors.black,width: 0),
                    borderRadius: BorderRadius.circular(10),
                  ),

                  child: TextField(
                    controller: _heightController,
                    decoration: InputDecoration(
                      hintText: "Input your height (m)",
                      labelText: "Height",
                      labelStyle: TextStyle(
                        fontSize: 20,
                      ),
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,

                  ),
                ),

                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(top: 50.0,left: 10.0 ,right: 10.0,bottom: 10.0),
                  child: ElevatedButton(
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          bmiCalculation(_weightController.text, _heightController.text);
                        });
                      },
                      child: Text('Result')
                  ),
                ),

                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(top: 50.0,left: 10.0 ,right: 10.0,bottom: 10.0),
                  color: Colors.deepPurple,
                  child: Text(
                    getBMI().toStringAsFixed(1),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ],
        )
      ),
    );
  }
}