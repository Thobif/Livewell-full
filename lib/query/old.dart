import 'package:flutter/material.dart';
import 'allergies.dart';

class FifthPage extends StatefulWidget {
  final String name;
  final String gender;
  final int height;
  final int weight;
  final String userKey;

  FifthPage(
      {required this.name,
      required this.gender,
      required this.height,
      required this.weight,
      required this.userKey
      });

  @override
  _FifthPageState createState() => _FifthPageState();
}

class _FifthPageState extends State<FifthPage> {
  double _age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Step 5: Your age'),
        backgroundColor: Colors.green,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/query1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Spacer(),
                Center(
                  child: Text(
                    'Your age',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: Text(
                    '${_age.toInt()} years',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(height: 20),
                SliderTheme(
                  data: SliderThemeData(
                    trackHeight: 2,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                  ),
                  child: Slider(
                    value: _age,
                    min: 1,
                    max: 120,
                    onChanged: (double value) {
                      setState(() {
                        _age = value;
                      });
                    },
                    activeColor: Colors.green,
                    inactiveColor: Colors.grey,
                    label: '${_age.toInt()} years',
                    divisions: 119,
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    child: Text('Next'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SixthPage(
                              name: widget.name,
                              gender: widget.gender,
                              userKey: widget.userKey,
                              height: widget.height,
                              weight: widget.weight,
                              age: _age.toInt()),
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
                    'Step 5/8',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
