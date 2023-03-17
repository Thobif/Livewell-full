import 'package:flutter/material.dart';
import 'other.dart';

class SeventhPage extends StatefulWidget {
  final String name;
  final String gender;
  final int height;
  final int weight;
  final int age;
  final Map<String, bool> allergens;
  final Map<String, bool> diseases; // ปรับปรุงตัวแปร diseases ที่นี่

  SeventhPage({
    required this.name,
    required this.gender,
    required this.height,
    required this.weight,
    required this.age,
    required this.allergens,
    required this.diseases, // ปรับปรุง diseases ในคอนสตรัคเตอร์
  });
  _SeventhPageState createState() => _SeventhPageState();
}


class _SeventhPageState extends State<SeventhPage> {
  bool _hasDisease = false;
  Map<String, bool> _diseases = {
    'โรคเบาหวาน': false,
    'โรคไต': false,
    'โรคเก๊าท์': false,
    'โรคหัวใจและหลอดเลือด': false,
    'ความดันโลหิตสูง': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Step 7: Diseases'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 20),
              Center(
                child: Text(
                  'มีโรคประจำตัวที่เกี่ยวกับอาหารหรือไม่?',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio(
                    value: false,
                    groupValue: _hasDisease,
                    onChanged: (bool? value) {
                      setState(() {
                        _hasDisease = value!;
                      });
                    },
                  ),
                  Text('ไม่มี'),
                  Radio(
                    value: true,
                    groupValue: _hasDisease,
                    onChanged: (bool? value) {
                      setState(() {
                        _hasDisease = value!;
                      });
                    },
                  ),
                  Text('มี'),
                ],
              ),
              if (_hasDisease)
                Column(
                  children: _diseases.entries
                      .map(
                        (entry) => CheckboxListTile(
                          title: Text(entry.key),
                          value: entry.value,
                          onChanged: (bool? value) {
                            setState(() {
                              _diseases[entry.key] = value!;
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
                        builder: (context) => EighthPage(
                          name: widget.name,
                          gender: widget.gender,
                          height: widget.height,
                          weight: widget.weight,
                          age: widget.age,
                          allergens: widget.allergens,
                          diseases: _diseases,
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
                  'Step 7/8',
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
