import 'package:exerc04/switch_sample.dart';
import 'package:flutter/material.dart';

class TextFormFieldSample extends StatelessWidget {
  final ValueChanged<Map<String, dynamic>> onChanged;
  final bool switchValue;
  final ValueChanged<bool> onSwitchChanged;

  const TextFormFieldSample({
    super.key,
    required this.onChanged,
    required this.switchValue,
    required this.onSwitchChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          onChanged: (value) {
            onChanged({'name': value});
          },
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Enter Name",
            labelText: "Name",
          ),
        ),
        const SizedBox(height: 20),
        TextFormField(
          onChanged: (value) {
            onChanged({'nickname': value});
          },
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Enter Nickname",
            labelText: "NickName",
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 200,
              child: TextFormField(
                onChanged: (value) {
                  onChanged({'age': value});
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Age",
                  labelText: "Age",
                ),
              ),
            ),
            const SizedBox(width: 25),
            const Column(
              children: [
                SizedBox(height: 15),
                Text("In a Relationship?", style: TextStyle(fontSize: 15)),
              ],
            ),
            SwitchSample(
              switchValue: switchValue,
              onChanged: onSwitchChanged,
            ),
          ],
        ),
      ],
    );
  }
}
