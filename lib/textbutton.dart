import 'package:flutter/material.dart';

class RawButton extends StatelessWidget {
  const RawButton({Key? key, required this.value, required this.onPressed})
      : super(key: key);
  final String value;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: RawMaterialButton(
        highlightColor: Theme.of(context).primaryColor,
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        fillColor: null,
        constraints: const BoxConstraints.tightFor(width: 50, height: 70),
        elevation: 0.0,
        child: Text(
          value,
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
