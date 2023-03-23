import 'package:flutter/material.dart';
import 'old.dart';

class FourthPage extends StatefulWidget {
  final String name;
  final String gender;
  final int height;
  final String userKey;

  FourthPage({required this.name, required this.gender, required this.height, required this.userKey});

  @override
  _FourthPageState createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  double _weight = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ขั้นตอนที่ 4: ใส่น้ำหนักของคุณ'),
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
                    'น้ำหนักของคุณ',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: Text(
                    '${_weight.toInt()} กิโลกรัม',
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
                    value: _weight,
                    min: 30,
                    max: 200,
                    onChanged: (double value) {
                      setState(() {
                        _weight = value;
                      });
                    },
                    activeColor: Colors.green,
                    inactiveColor: Colors.grey,
                    label: '${_weight.toInt()} กิโลกรัม',
                    divisions: 170,
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    child: Text('ต่อไป'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FifthPage(
                              name: widget.name,
                              userKey: widget.userKey,
                              gender: widget.gender,
                              height: widget.height,
                              weight: _weight.toInt()),
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
                    'ขั้นตอนที่ 4/8',
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
