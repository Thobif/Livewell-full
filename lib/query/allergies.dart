import 'package:flutter/material.dart';
import 'disease.dart';

class SixthPage extends StatefulWidget {
  final int age;
  final String name;
  final String gender;
  final int height;
  final int weight;

  SixthPage(
      {required this.age,
      required this.name,
      required this.gender,
      required this.height,
      required this.weight});
  _SixthPageState createState() => _SixthPageState();
}

class _SixthPageState extends State<SixthPage> {
  bool _hasAllergy = false;
  Map<String, bool> _allergens = {
    'ไข่': false,
    'ปลา': false,
    'นม': false,
    'ถั่วเหลือง': false,
    'ถั่วลิสง': false,
    'แป้งสาลีและกลูเต็น': false,
    'สัตว์น้ำเปลือกแข็ง': false,
    'ถั่วตระกูล Tree Nuts': false,
    'ผักและผลไม้': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Step 6: Allergies'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Add this line
            children: [
              SizedBox(height: 20),
              Center(
                child: Text(
                  'คุณมีอาการแพ้อาหารใดๆหรือไม่?',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio(
                    value: false,
                    groupValue: _hasAllergy,
                    onChanged: (bool? value) {
                      setState(() {
                        _hasAllergy = value!;
                      });
                    },
                  ),
                  Text('ไม่มี'),
                  Radio(
                    value: true,
                    groupValue: _hasAllergy,
                    onChanged: (bool? value) {
                      setState(() {
                        _hasAllergy = value!;
                      });
                    },
                  ),
                  Text('มี'),
                ],
              ),
              if (_hasAllergy)
                Column(
                  children: _allergens.entries
                      .map(
                        (entry) => CheckboxListTile(
                          title: Text(entry.key),
                          value: entry.value,
                          onChanged: (bool? value) {
                            setState(() {
                              _allergens[entry.key] = value!;
                            });
                          },
                        ),
                      )
                      .toList(),
                ),
              Center(
                child: ElevatedButton(
                  child: Text('Next'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SeventhPage(
                          name: widget.name,
                          gender: widget.gender,
                          height: widget.height,
                          weight: widget.weight,
                          age: widget.age,
                          allergens: _allergens,
                          diseases: {
                            'โรคเบาหวาน': false,
                            'โรคไต': false,
                            'โรคเก๊าท์': false,
                            'โรคหัวใจและหลอดเลือด': false,
                            'ความดันโลหิตสูง': false,
                          },
                        ),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(vertical: 15, horizontal: 50)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50),
              Center(
                child: Text(
                  'Step 6/8',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
