import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String display = '0';
  double? firstNumber;
  String? operation;
  bool shouldResetDisplay = false;

  void pressNumber(String number) {
    setState(() {
      if (display == '0' || shouldResetDisplay) {
        display = number;
        shouldResetDisplay = false;
      } else {
        display += number;
      }
    });
  }

  void pressDecimal() {
    setState(() {
      if (shouldResetDisplay) {
        display = '0.';
        shouldResetDisplay = false;
      } else if (!display.contains('.')) {
        display += '.';
      }
    });
  }

  void pressOperation(String newOperation) {
    setState(() {
      firstNumber = double.tryParse(display);
      operation = newOperation;
      shouldResetDisplay = true;
    });
  }

  void calculate() {
    if (firstNumber == null || operation == null) {
      return;
    }

    final secondNumber = double.tryParse(display);

    if (secondNumber == null) {
      return;
    }

    double result;

    switch (operation) {
      case '+':
        result = firstNumber! + secondNumber;
        break;
      case '-':
        result = firstNumber! - secondNumber;
        break;
      case '×':
        result = firstNumber! * secondNumber;
        break;
      case '÷':
        if (secondNumber == 0) {
          setState(() {
            display = 'Error';
            firstNumber = null;
            operation = null;
            shouldResetDisplay = true;
          });
          return;
        }
        result = firstNumber! / secondNumber;
        break;
      default:
        return;
    }

    setState(() {
      display = result % 1 == 0 ? result.toInt().toString() : result.toString();
      firstNumber = null;
      operation = null;
      shouldResetDisplay = true;
    });
  }

  void clear() {
    setState(() {
      display = '0';
      firstNumber = null;
      operation = null;
      shouldResetDisplay = false;
    });
  }

  void delete() {
    setState(() {
      if (display.length > 1) {
        display = display.substring(0, display.length - 1);
      } else {
        display = '0';
      }
    });
  }

  Widget calculatorButton(
    String text, {
    VoidCallback? onPressed,
    Color? color,
    Color? textColor,
    int flex = 1,
  }) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            text,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Calculadora'),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              alignment: Alignment.centerRight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                display,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        calculatorButton('C', onPressed: clear),
                        calculatorButton('⌫', onPressed: delete),
                        calculatorButton(
                          '÷',
                          onPressed: () => pressOperation('÷'),
                        ),
                        calculatorButton(
                          '×',
                          onPressed: () => pressOperation('×'),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        calculatorButton(
                          '7',
                          onPressed: () => pressNumber('7'),
                        ),
                        calculatorButton(
                          '8',
                          onPressed: () => pressNumber('8'),
                        ),
                        calculatorButton(
                          '9',
                          onPressed: () => pressNumber('9'),
                        ),
                        calculatorButton(
                          '-',
                          onPressed: () => pressOperation('-'),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        calculatorButton(
                          '4',
                          onPressed: () => pressNumber('4'),
                        ),
                        calculatorButton(
                          '5',
                          onPressed: () => pressNumber('5'),
                        ),
                        calculatorButton(
                          '6',
                          onPressed: () => pressNumber('6'),
                        ),
                        calculatorButton(
                          '+',
                          onPressed: () => pressOperation('+'),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        calculatorButton(
                          '1',
                          onPressed: () => pressNumber('1'),
                        ),
                        calculatorButton(
                          '2',
                          onPressed: () => pressNumber('2'),
                        ),
                        calculatorButton(
                          '3',
                          onPressed: () => pressNumber('3'),
                        ),
                        calculatorButton('=', onPressed: calculate),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        calculatorButton(
                          '0',
                          onPressed: () => pressNumber('0'),
                          flex: 2,
                        ),
                        calculatorButton('.', onPressed: pressDecimal),
                        calculatorButton('=', onPressed: calculate),
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
