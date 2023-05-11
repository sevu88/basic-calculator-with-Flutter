import 'package:flutter/material.dart';

// Program initiates at main and executes the app
void main() => runApp(SampleBasicApp());

class SampleBasicApp extends StatefulWidget {
  @override
  _CalculatorAppState createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<SampleBasicApp> {
  
var output = "0";
var output2 = "0";
var num1 = 0;
var num2 = 0;
var operand = "";

buttonPressed(String buttonText) {
  
  if (buttonText == "CLEAR"){
    output2 = "0";
    num1 = 0;
    num2 = 0;
    operand = "";
    
  }
  
  else if (buttonText == "+" || buttonText == "-") {
    
    num1 = int.parse(output);
    operand = buttonText;
    output2 = "0"; 
  }
  
  else if (buttonText == "=") {
    
    num2 = int.parse(output);
    
    if (operand == "+") {
      output2 = (num1 + num2).toString();
    }
    if (operand == "-") {
      output2 = (num1 - num2).toString();
    }
    
    num1 = 0;
    num2 = 0;
    operand = ""; 
   }
    else {
    output2 = output2 + buttonText;
  }
  
  print(output2);
  
  setState(() {
    output = double.parse(output2).toString();
  });
}

Widget buildButton(String buttonText){
  return new Expanded(
    child: new MaterialButton(
      shape: const CircleBorder(),
      padding: new EdgeInsets.all(35.0),
      color: Colors.lightBlue,
      child: new Text(buttonText,
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold
      ),
      ),
      onPressed: () => 
        buttonPressed(buttonText)
      ,
    ),
  );
}

Widget buildButton2(String buttonText){
  return new Expanded(
    child: new MaterialButton(
      padding: new EdgeInsets.all(25.0),
      color: Colors.purple,
      child: new Text(buttonText,
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold
      ),
      ),
      onPressed: () => 
        buttonPressed(buttonText)
      ,
    ),
  );
}

// The main app, as it is
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Calculator'),
        ),
        body: new Container(
            child: new Column(
            children: <Widget>[
              new Container(
                color: Colors.purple,
                alignment: Alignment.center,
                margin: new EdgeInsets.all(35.0),
                  width: 300,
                  height: 100,
                child: new Text(output, style: new TextStyle(
                 fontSize: 40.0,
                ))),
                
              new Expanded(
                child: new Divider(),
              ),
          new Column(children: [
          new Row(children: [
            buildButton("1"),
            buildButton("2"),
            buildButton("3"),
            buildButton2("+"),
           ]),
          new Row(children: [
            buildButton("4"),
            buildButton("5"),
            buildButton("6"),
            buildButton2("-"),
           ]),
          new Row(children: [
            buildButton("7"),
            buildButton("8"),
            buildButton("9"),
            buildButton2("="),
           ]),
          new Row(children: [
            buildButton("0"),
            buildButton2("CLEAR"),
           ]),
        ])
      ],
    ))));
}
}