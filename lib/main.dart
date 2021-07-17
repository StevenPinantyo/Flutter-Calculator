import 'package:flutter/material.dart';
import 'package:dicoding2/binary.dart';
import 'package:dicoding2/bmi.dart';
void main() {
  runApp(CalculatorApp());
}
class CalculatorApp extends StatelessWidget {
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
