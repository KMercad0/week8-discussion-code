import 'package:exerc04/radio_sample.dart';
import 'package:exerc04/slider_sample.dart';
import 'package:flutter/material.dart';
import 'textfield_sample.dart';
import 'dropdown_sample.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "The Tita Slambook",
      theme: ThemeData(
        primaryColor: const Color(0xFFFF6F61), // Coral Red
        hintColor: const Color(0xFFFFCC5C), // Light Beige
        scaffoldBackgroundColor: const Color(0xFFF4EAD3),
        appBarTheme: const AppBarTheme(
          color: Color(0xFFFF6F61), // Coral Red
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Color(0xFF333333), // Dark Gray
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          titleMedium: TextStyle(
            color: Color(0xFF333333), // Dark Gray
            fontSize: 16,
          ),
        ),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.orange,
          backgroundColor: const Color(0xFFF4EAD3), // Light Beige
          cardColor: Colors.white,
          errorColor: Colors.red,
          brightness: Brightness.light,
        ).copyWith(background: const Color(0xFFF4EAD3)),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "The Tita Slambook",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
          margin: const EdgeInsets.all(20),
          child: const FormSample(),
        ),
      ),
    );
  }
}

class FormSample extends StatefulWidget {
  const FormSample({super.key});

  @override
  State<FormSample> createState() => _FormSampleState();
}

class _FormSampleState extends State<FormSample> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String nameValue = '';
  String nicknameValue = '';
  String ageValue = '';
  bool relationshipValue = false;
  double _sliderValue = 1.0;
  String dropdownValue = 'Makalipad';
  String defaultDropdownValue = 'Makalipad';
  String radioValue = 'Haters gonna hate';
  bool showValues = false;
  String hasRelationship = '';

  void _handleSliderChanged(double value) {
    setState(() {
      _sliderValue = value;
    });
  }

  void _handleDropdownChanged(String? value) {
    setState(() {
      dropdownValue = value ?? 'Makalipad';
    });
  }

  void _handleSwitchValueChanged(bool value) {
    setState(() {
      relationshipValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formkey,
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "The Tita Slambook",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormFieldSample(
              onChanged: (value) {
                // Update the text field value
                setState(() {
                  nameValue = value['name'] ?? nameValue;
                  nicknameValue = value['nickname'] ?? nicknameValue;
                  ageValue = value['age'] ?? ageValue;
                });
              },
              switchValue: relationshipValue, 
              onSwitchChanged: _handleSwitchValueChanged, 
            ),

            //const CheckBoxSample();
            const SizedBox(
              height: 20,
            ),
            SliderSample(
              sliderValue: _sliderValue,
              onChanged: _handleSliderChanged,
            ),
            DropdownSample(
              selectedValue: dropdownValue,
              onValueChanged: _handleDropdownChanged,
            ),
            const SizedBox(
              height: 20,
            ),

            RadioSample(
              value: radioValue,
              onValueChanged: (value) {
                if (value != null) {
                  setState(() {
                    radioValue = value;
                  });
                }
              },
            ),
            const SizedBox(
              height: 10,
            ),
            OutlinedButton(
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    print("Success");
                    formkey.currentState!.save();
                    setState(() {
                      showValues = true;
                    });
                  } else {
                    setState(() {
                      showValues = false;
                    });
                    print("Failed");
                  }
                },
                style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.deepPurpleAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                child: const Text(
                  "Done",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),

            if (showValues) ...[
              Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(thickness: 0.5, color: Colors.black),
                    const Text(
                      "Summary",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Name:',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text('Nickname:',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text('Age:',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text('Relationship:',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text('Happiness Level:',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text('Super Power:',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text('Motto in life:',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(nameValue),
                              Text(nicknameValue),
                              Text(ageValue),
                              Text(relationshipValue ? 'Yes' : 'No'),
                              Text(_sliderValue.toString()),
                              Text(dropdownValue),
                              Text(radioValue),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],

            const SizedBox(
              height: 10,
            ),
            const Divider(thickness: 0.5, color: Colors.black),
            const SizedBox(
              height: 10,
            ),
            OutlinedButton(
              onPressed: () {
                setState(() {
                  relationshipValue = false;
                  _sliderValue = 1.0;
                  dropdownValue = defaultDropdownValue;
                  radioValue = 'Haters gonna hate';
                  showValues = false;
                  hasRelationship = '';
                  showValues = false;
                });
                formkey.currentState!.reset();
              },
              style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
              child: const Text(
                "Reset",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        )));
  }
}
