import 'package:flutter/material.dart';
import 'weight.dart';

class ThirdPage extends StatefulWidget {
  final String name;
  final String gender;
  final String userKey;

  ThirdPage({required this.name, required this.gender,required this.userKey});

  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  double _height = 150;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Step 3: Your height'),
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
                    'Your height',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: Text(
                    '${_height.toInt()} cm',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: SliderTheme(
                      data: SliderThemeData(
                        trackHeight: 2,
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15),
                      ),
                      child: Slider(
                        value: _height,
                        min: 100,
                        max: 250,
                        onChanged: (double value) {
                          setState(() {
                            _height = value;
                          });
                        },
                        activeColor: Colors.green,
                        inactiveColor: Colors.grey,
                        label: '${_height.toInt()} cm',
                        divisions: 150,
                      ),
                    ),
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
                          builder: (context) => FourthPage(
                              name: widget.name,
                              userKey: widget.userKey,
                              gender: widget.gender,
                              height: _height.toInt()),
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
                    'Step 3/8',
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
