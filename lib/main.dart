import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      home: CalculatorMenu(),// Menu kalkulator mula-mula
    );
  }
}

class CalculatorMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigoAccent,
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context){
            return IconButton(
              icon: Icon(
                Icons.calculate,
                color: Colors.white,
              ),
              onPressed: () {
              },
            );
          },
        ),
        title: Text('Calculator'),
        backgroundColor: Colors.deepPurple,
      ),

      body:SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10.0),
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
                      border: Border.all(color: Colors.black,width: 3),
                      borderRadius: BorderRadius.circular(10),
                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Icon(Icons.calculate, size: 40.0, color: Colors.deepPurple,),
                        SizedBox(height: 8.0),
                        TextButton(
                          style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                          ),
                          child: Text("BMI Calculator"),
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => BmiScreen()),
                            );
                          },
                        ),
                      ],
                    ),
                  ),


                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10.0),
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
                      border: Border.all(color: Colors.black,width: 3),
                      borderRadius: BorderRadius.circular(10),

                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Icon(Icons.calculate, size: 40.0, color: Colors.deepPurple,),
                        SizedBox(height: 8.0),
                        TextButton(
                          style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                          ),
                          child: Text("Binary Calculator"),
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => BinaryScreen()),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BinaryScreen extends StatefulWidget{
  @override
  _BinaryScreenState createState() => _BinaryScreenState();
}

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
        child: Column(
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
                this._result.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

//Binary Section
class _BinaryScreenState extends State<BinaryScreen> {
  var _result;
  TextEditingController _inputController = TextEditingController();

  void binaryCalculation(var input){
    if(!RegExp("01").hasMatch(input)) {
      this._result = (int.parse(input)).toRadixString(2);
    }
    else{
      this._result = (int.parse(input));
    }
  }
  void denaryCalculation(var input){
    if(RegExp("01").hasMatch(input)){
      this._result = int.parse(input, radix: 2);
    }
    else {
      this._result = int.parse(input);
    }
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
                Icons.arrow_back_ios_new,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            );
          },
        ),
        title: Text('Binary Calculator'),
        backgroundColor: Colors.deepPurple,
      ),

      body:SafeArea(
        child: Column(
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
                controller: _inputController,
                decoration: InputDecoration(
                  hintText: "Input binary / denary",
                  labelText: "Input",
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
              margin: EdgeInsets.only(top: 50.0,left: 10.0 ,right: 10.0,),
              child: ElevatedButton(
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      binaryCalculation(_inputController.text);
                    });
                  },
                  child: Text('Binary Result')
              ),
            ),

            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(top: 0.0,left: 10.0 ,right: 10.0,bottom: 10.0),
              child: ElevatedButton(
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      denaryCalculation(_inputController.text);
                    });
                  },
                  child: Text('Denary Result')
              ),
            ),

            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(top: 50.0,left: 10.0 ,right: 10.0,bottom: 10.0),
              color: Colors.deepPurple,
              child: Text(
                this._result.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
