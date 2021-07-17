import 'package:flutter/material.dart';

class BinaryScreen extends StatefulWidget{
  @override
  _BinaryScreenState createState() => _BinaryScreenState();
}

//Binary Section
class _BinaryScreenState extends State<BinaryScreen> {
  var _result;
  bool _hidden;
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

  bool isResultEmpty(){
    if(this._result==null){
      this._hidden = false;
    }
    else{
      this._hidden = true;
    }
    return this._hidden;
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
        child: ListView(
          children:[
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
                  child: Visibility(
                    visible: isResultEmpty(),
                    child: Text(
                      this._result.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}