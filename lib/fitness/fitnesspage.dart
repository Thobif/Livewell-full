import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'exer.dart';

// class FitnessScreen2 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         primarySwatch: Colors.green,
//       ),
//       home: FitnessScreen(),
//     );
//   }
// }

class FitnessScreen extends StatefulWidget {
  FitnessScreen({Key? key, }) : super(key: key);

 

  @override
  _FitnessScreenState createState() => _FitnessScreenState();
}

class _FitnessScreenState extends State<FitnessScreen> {
  late YoutubePlayerController _controller1;
  late YoutubePlayerController _controller2;
  late YoutubePlayerController _controller3;
  late YoutubePlayerController _controller4;
  late YoutubePlayerController _controller5;
  String videoUrl1 =
      "https://www.youtube.com/watch?v=SoyW4nCSP14&list=RDCMUCeLebRZ-VKfiwTXd25ojN-w&index=7";
  String videoUrl2 =
      "https://www.youtube.com/watch?v=3Oa4HISbY30&list=RDCMUCeLebRZ-VKfiwTXd25ojN-w&index=2";
  String videoUrl3 = "https://www.youtube.com/watch?v=dTqLoAElJXQ&t=117s";
  String videoUrl4 = "https://www.youtube.com/watch?v=R69fU-0l4JE";
  String videoUrl5 =
      "https://www.youtube.com/watch?v=iF9h5Q9csOI&list=RDCMUCeLebRZ-VKfiwTXd25ojN-w&index=4";

  final List<String> videoTitles = [
    '10 ท่า กระชับต้นขา แบบยืน',
    '11 ลดหน้าท้องแบบยืน ท้องล่าง',
    '10 ท่า กระชับช่วงแขนไหล่ แบบยืน',
    '10 ท่า กระชับช่วงแขนไหล่',
    'คาร์ดีโอแทนวิ่ง 15 นาที',
  ];
  final List<String> calories = [
    'เผาผลาญ 150 แคลอรี่',
    'เผาผลาญ 180 แคลอรี่',
    'เผาผลาญ 120 แคลอรี่',
    'เผาผลาญ 90 แคลอรี่',
    'เผาผลาญ 200 แคลอรี่',
  ];

  @override
  void initState() {
    super.initState();
    _controller1 = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(videoUrl1)!,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
    _controller2 = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(videoUrl2)!,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
    _controller3 = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(videoUrl3)!,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
    _controller4 = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(videoUrl4)!,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
    _controller5 = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(videoUrl5)!,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  @override
  void dispose() {
    _controller1.pause();
    _controller2.pause();
    _controller3.pause();
    _controller4.pause();
    _controller5.pause();
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _controller4.dispose();
    _controller5.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 25),
              buildVideoPlayer(_controller1, videoTitles[0], calories[0]),
              SizedBox(height: 25),
              buildVideoPlayer(_controller2, videoTitles[1], calories[1]),
              SizedBox(height: 25),
              buildVideoPlayer(_controller3, videoTitles[2], calories[2]),
              SizedBox(height: 25),
              buildVideoPlayer(_controller4, videoTitles[3], calories[3]),
              SizedBox(height: 25),
              buildVideoPlayer(_controller5, videoTitles[4], calories[4]),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => calKcal(title: 'Calorie Calculator')),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget buildVideoPlayer(
      YoutubePlayerController controller, String title, String calories) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.4,
          child: YoutubePlayer(
            controller: controller,
            showVideoProgressIndicator: true,
          ),
        ),
        SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title),
            Text(calories),
          ],
        ),
      ],
    );
  }
}
