import 'package:flutter/material.dart';

class SliderSample extends StatelessWidget {
  final double sliderValue;
  final Function(double) onChanged;

  const SliderSample({super.key, 
    required this.sliderValue,
    required this.onChanged,
  });

  

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Happiness Level", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
        const Text("On a scale of 1-Happy, gaano kasaya ang adulting", style: TextStyle(fontSize: 14),),
        Slider(
          value: sliderValue,
          min: 1,
          max: 10,
          divisions: 9,
          onChanged: onChanged,
        ),
        const SizedBox(height: 20),
        // Text(
        //   'Slider Value: $_sliderValue',
        //   style: const TextStyle(fontSize: 15),
        // ),
      ],
    );
  }
}