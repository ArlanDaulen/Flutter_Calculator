import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String output = "0";
  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonPressed(String buttonText){

    if(buttonText == "C"){

      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";

    } else if(buttonText == "x" || buttonText == "-" || buttonText == "/" || buttonText == "+"){

      num1 = double.parse(output);
      operand = buttonText;
      _output = "0";

    } else if(buttonText == "."){

      if(_output.contains(".")){

        print("Already contains a decimals");
        return;

      } else {

        _output = _output + buttonText;

      }

    }else if(buttonText == "="){

      num2 = double.parse(output);
      if(operand == "+"){
        _output = (num1 + num2).toString();
      }
      if(operand == "-"){
        _output = (num1 - num2).toString();
      }
      if(operand == "x"){
        _output = (num1 * num2).toString();
      }
      if(operand == "/"){
        _output = (num1 / num2).toString();
      }
      if(operand == "%"){
        _output = (num1 % num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operand = "";

    } else {

      _output = _output + buttonText;

    }

    print(_output);

    setState(() {
      output = double.parse(_output).toString();
    });
  }

  Widget buildButton(String buttonText){
    return new Expanded(
      child: new OutlineButton(
        padding: new EdgeInsets.all(20.0),
        child: new Text(buttonText,
        style: TextStyle(
          fontSize: 38.0,
          fontWeight: FontWeight.normal
        ),
        ),
        onPressed: () => {
          buttonPressed(buttonText)
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: new Container(

        child: new Column(children: <Widget>[
          new Container(
            alignment: Alignment.centerRight,
            padding: new EdgeInsets.symmetric(
              vertical: 24.0,
              horizontal: 12.0
        ),
              child: new Text(output, style: TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.normal
              ))),
          new Expanded(
            child: new Divider(),
          ),



          Column(children: [
              new Row(
                children: [
                  buildButton("C"),
                  buildButton("+/-"),
                  buildButton("%"),
                  buildButton("/")
                ]),
            new Row(
                children: [
                  buildButton("7"),
                  buildButton("8"),
                  buildButton("9"),
                  buildButton("x")
                ]),
            new Row(
                children: [
                  buildButton("4"),
                  buildButton("5"),
                  buildButton("6"),
                  buildButton("-")
                ]),
            new Row(
                children: [
                  buildButton("1"),
                  buildButton("2"),
                  buildButton("3"),
                  buildButton("+")
                ]),new Row(
                children: [
                  buildButton("0"),
                  buildButton("."),
                  buildButton("=")
                ]),
            ])

        ],)

      )
    );
  }
}
