import 'package:flutter/material.dart';

class DropdownSample extends StatelessWidget {
  final String selectedValue;
  final Function(String?) onValueChanged;

  const DropdownSample({super.key, 
    required this.selectedValue,
    required this.onValueChanged,
  });

   static final List<String> superpower = [
    'Makalipad',
    "Maging Invisible",
    "Mapaibig siya",
    "Mapabago ang isip niya",
    "Mapalimot siya",
    "Mapabalik ang nakaraan",
    "Mapahiwalay sila",
    "Makarma siya",
    "Mapasagasaan siya sa pison",
    "Mapaitim ang tuhod ng iniibig niya"
  ];
  

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        
        const Text(
          "Superpower",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const Text(
          "If you were to have a superpower, what would you choose?",
          style: TextStyle(fontSize: 14),
        ),
        SizedBox(
          width: 400,
          
          child: DropdownButton<String>(
          
          // validator: (value) {
          //   if (currentValue == 'Maging Invisible') return "Bawal ang flying high in the sky, I can go towards the sky";
          //   return null;
          // },
          value: selectedValue,
          onChanged: onValueChanged,
          items: superpower.map((superpowerName) {
            return DropdownMenuItem<String>(
              value: superpowerName,
              child: Text(superpowerName),
            );
          }).toList(),
         
          
        ),
        )
      ],
    );
  }
}