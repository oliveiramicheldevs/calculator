import 'package:calculadora/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import '../widgets/custon_button.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);
  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var previousOperand = '';
  var currentOperand = '';

  final List<String> buttons = [
    /* 
      
    Visual Representation:
    'C', 'DEL', '%', '/',
    '7', '8',   '9', 'x',
    '4', '5',   '6', '-',
    '1', '2',   '3', '+',
    '0', '00',  '.', '=',
     */

    'C',
    'DEL',
    '%',
    '/',
    '7',
    '8',
    '9',
    'x',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '0',
    '00',
    '.',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Cores.roxo1,
      body: Column(
        children: [
          Expanded(
              child: Container(
            padding: const EdgeInsets.only(right: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(12, 80, 0, 0),
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  alignment: Alignment.centerRight,
                  child: Text(
                    previousOperand,
                    style: const TextStyle(fontSize: 55, color: Colors.black87),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                Container(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    alignment: Alignment.centerRight,
                    child: Text(
                      currentOperand,
                      style: const TextStyle(fontSize: 40, color: Colors.black),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    )),
              ],
            ),
          )),
          Expanded(
              flex: 2,
              child: Container(
                  margin: const EdgeInsets.fromLTRB(12, 0, 12, 40),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color:Cores.roxo, //cor do box de numeros
                    borderRadius: BorderRadius.circular(20),
                  ),
                  
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4),
                      itemCount: buttons.length,
                      itemBuilder: (context, index) {
                       
                        if (index == 0) {
                          return CustomButton(
                              buttonTapped: () {
                                setState(() {
                                  previousOperand = '';
                                  currentOperand = '';
                                });
                              },
                              buttonText: buttons[index],
                              color: Colors.green,
                              textColor: Colors.white);
                        }
                      
                        else if (index == 1) {
                          return CustomButton(
                              buttonTapped: () {
                                setState(() {
                                  previousOperand = previousOperand.substring(
                                      0, previousOperand.length - 1);
                                });
                              },
                              buttonText: buttons[index],
                              color: Colors.blue,
                              textColor: Colors.white);
                        }
                      
                        else if (index == (buttons.length - 1)) {
                          return CustomButton(
                              buttonTapped: () {
                                setState(() {
                                  equalPressed();
                                });
                              },
                              buttonText: buttons[index],
                              color: Cores.azul,
                              textColor: Colors.white);
                        } else {
                          return CustomButton(
                            buttonTapped: () {
                              setState(() {
                                previousOperand += buttons[index];
                              });
                            },
                            buttonText: buttons[index],
                            color: isOperator(buttons[index])
                                ? Colors.deepPurple
                                : Colors.deepPurple[50],
                            textColor: isOperator(buttons[index])
                                ? Colors.white
                                : Colors.deepPurple,
                          );
                        }
                      })))
        ],
      ),
    );
  }


  bool isOperator(String x) {
    if (x == '%' || x == 'x' || x == '-' || x == '+' || x == '/' || x == '=') {
      return true;
    }
    return false;
  }

  // Function for equalPressed

  void equalPressed() {
    // Replace * with x
    String finalOperand = previousOperand;
    finalOperand = finalOperand.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finalOperand);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    currentOperand = eval.toString();
  }
}

