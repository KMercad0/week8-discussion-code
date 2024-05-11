import 'package:flutter/material.dart';

class SwitchSample extends StatelessWidget {
  final bool switchValue;
  final ValueChanged<bool> onChanged;

    const SwitchSample({
    super.key,
    required this.switchValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: switchValue,
      onChanged: onChanged,
      activeTrackColor: Colors.lightGreenAccent,
      activeColor: Colors.green,
    );
  }
}