import 'package:flutter/material.dart';

void main() {
  runApp(const IOSCalculatorApp());
}

class IOSCalculatorApp extends StatelessWidget {
  const IOSCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Display hasil
          Padding(
            padding: const EdgeInsets.all(20),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                '0',
                style: const TextStyle(
                  fontSize: 70,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          
          // Tombol Kalkulator
          Column(
            children: [
              buildButtonRow(['C', '±', '%', '÷']),
              buildButtonRow(['7', '8', '9', '×']),
              buildButtonRow(['4', '5', '6', '-']),
              buildButtonRow(['1', '2', '3', '+']),
              buildButtonRow(['0', '.', '='], isZeroButton: true),
            ],
          ),
        ],
      ),
    );
  }

  // Membuat baris tombol
  Widget buildButtonRow(List<String> labels, {bool isZeroButton = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: labels.map((label) {
        return CalculatorButton(
          text: label,
          isZeroButton: isZeroButton && label == '0',
        );
      }).toList(),
    );
  }
}

// Widget untuk tombol kalkulator
class CalculatorButton extends StatelessWidget {
  final String text;
  final bool isZeroButton;

  const CalculatorButton({
    required this.text,
    this.isZeroButton = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isZeroButton ? 160 : 80,
      height: 80,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: _buttonColor(),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 28,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  // Fungsi untuk mengatur warna tombol
  Color _buttonColor() {
    if (text == '÷' || text == '×' || text == '-' || text == '+') {
      return Colors.orange;
    } else if (text == 'C' || text == '±' || text == '%') {
      return Colors.grey;
    } else {
      return Colors.black54;
    }
  }
}
