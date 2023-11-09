import 'package:arithmetic_calculator/list.dart';
import 'package:flutter/material.dart';
import '../textbutton.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
              alignment: Alignment.bottomRight,
              child: Text(
                textValue,
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            reverse: true,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              alignment: Alignment.bottomRight,
              child: Text(
                calculatorResult,
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 5,
                  maxCrossAxisExtent: 100,
                ),
                itemCount: calculatorValue.length,
                itemBuilder: (BuildContext context, int index) => RawButton(
                  value: calculatorValue[index],
                  onPressed: () {
                    setState(() {
                      updateText(calculatorValue[index]);
                    });
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
