import 'package:flutter/material.dart';

class RadioSample extends StatelessWidget {
  final String value;
  final ValueChanged<String?> onValueChanged;

  const RadioSample({
    super.key,
    required this.value,
    required this.onValueChanged,
  });


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      
      children: [
        const Text("Motto", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
        ListTile(
          title: const Text('Haters gonna hate'),
          leading: Radio(
            value: 'Haters gonna hate',
            groupValue: value,
            onChanged: onValueChanged,
          ),
        ),
        ListTile(
          title: const Text('Bakers gonna Bake'),
          leading: Radio(
            value: 'Bakers gonna Bake',
            groupValue: value,
            onChanged: onValueChanged
          ),
        ),
        ListTile(
          title: const Text('If cannot be, borrow one from three'),
          leading: Radio(
            value: 'If cannot be, borrow one from three',
            groupValue: value,
            onChanged: onValueChanged
          ),
        ),
        ListTile(
          title: const Text('Less is more, more or less'),
          leading: Radio(
            value: 'Less is more, more or less',
            groupValue: value,
            onChanged: onValueChanged
          ),
        ),
        ListTile(
          title: const Text('Better late than sorry'),
          leading: Radio(
            value: 'Better late than sorry',
            groupValue: value,
            onChanged: onValueChanged
          ),
        ),
        ListTile(
          title: const Text("Don't talk to strangers when your mouth is full"),
          leading: Radio(
            value: "Don't talk to strangers when your mouth is full",
            groupValue: value,
            onChanged: onValueChanged
          ),
        ),
        ListTile(
          title: const Text("Let's burn the bridge when we get there"),
          leading: Radio(
            value: "Let's burn the bridge when we get there",
            groupValue: value,
            onChanged: onValueChanged
          ),
        ),
        const SizedBox(height: 20),
        // Text(
        //   'Selected Option: $_selectedValue',
        //   style: const TextStyle(fontSize: 20),
        // ),
      ],
    );
  }
}