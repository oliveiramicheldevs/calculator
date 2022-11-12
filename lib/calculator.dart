import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  Widget calcbutton(String btntxt, Color btncolor, Color txtcolor){
    return Container(
      child: TextButton(
        onPressed: () {  }, 
        child: Text(
          btntxt,
          style: TextStyle(
            fontSize: 35,
            color: txtcolor
          ),
        ),
        
 
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Calculadora'),
        backgroundColor: Colors.black,
      ),
      body:  Padding(padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          //Display
     Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: const[
             Padding(  padding: EdgeInsets.all(10),
          child: Text('0',
          textAlign: TextAlign.left,
          style: TextStyle(color: Colors.white, fontSize: 100),),)
      ],
     ),
     Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        //Buttons
        calcbutton("AC", Colors.grey, Colors.black)

      ],

     )
        ],
      ),

      ),
    );
  }
}