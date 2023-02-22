import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:space_timer/single_card.dart';

void main() {
  runApp(
    MaterialApp(
      home: HomeScreen(),
    ),
  );
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  CarouselController sec = CarouselController();
  CarouselController tenSec = CarouselController();
  CarouselController min = CarouselController();
  CarouselController tenMin = CarouselController();
  bool isPlaying = false;
  double rotations = 0;
  late AnimationController animationController;
  List<Widget> list = [
    SingleCard(
      number: 1,
    ),
    SingleCard(
      number: 2,
    ),
    SingleCard(
      number: 3,
    ),
    SingleCard(
      number: 4,
    ),
    SingleCard(
      number: 5,
    ),
    SingleCard(
      number: 6,
    ),
    SingleCard(
      number: 7,
    ),
    SingleCard(
      number: 8,
    ),
    SingleCard(
      number: 9,
    ),
    SingleCard(
      number: 10,
    ),
  ];
  List<Widget> minute = [
    SingleCard(
      number: 1,
    ),
    SingleCard(
      number: 2,
    ),
    SingleCard(
      number: 3,
    ),
    SingleCard(
      number: 4,
    ),
    SingleCard(
      number: 5,
    ),
    SingleCard(
      number: 6,
    ),
  ];
  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('building widget');
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/background.png"), fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            /// this is the row that holds the numbers
            Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 2,
                  child: Row(
                    children: [
                      Expanded(
                        child: CarouselSlider(
                          items: list,
                          carouselController: tenMin,
                          options: CarouselOptions(
                            height: 400,
                            aspectRatio: 16 / 9,
                            viewportFraction: 1,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            autoPlay: isPlaying,
                            autoPlayInterval: Duration(seconds: 600),
                            scrollDirection: Axis.vertical,
                          ),
                        ),
                      ),
                      Expanded(
                        child: CarouselSlider(
                          items: list,
                          carouselController: min,
                          options: CarouselOptions(
                            height: 400,
                            aspectRatio: 16 / 9,
                            viewportFraction: 1,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            autoPlay: isPlaying,
                            autoPlayInterval: Duration(seconds: 60),
                            scrollDirection: Axis.vertical,
                          ),
                        ),
                      ),
                      Text(
                        ':',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width / 8,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: CarouselSlider(
                          items: minute,
                          carouselController: tenSec,
                          options: CarouselOptions(
                            height: 400,
                            aspectRatio: 16 / 9,
                            viewportFraction: 1,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            autoPlay: isPlaying,
                            autoPlayInterval: Duration(seconds: 10),
                            scrollDirection: Axis.vertical,
                          ),
                        ),
                      ),
                      Expanded(
                        child: CarouselSlider(
                          items: list,
                          carouselController: sec,
                          options: CarouselOptions(
                            height: 400,
                            aspectRatio: 16 / 9,
                            viewportFraction: 1,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            autoPlay: isPlaying,
                            autoPlayInterval: Duration(seconds: 1),
                            scrollDirection: Axis.vertical,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  color: Colors.transparent,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 2,
                )
              ],
            ),

            /// this is the row that holds the buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () {
                    print('play was pressed');
                    isPlaying == true ? isPlaying = false : isPlaying = true;
                    isPlaying == true
                        ? animationController.forward()
                        : animationController.reverse();
                    setState(() {});
                  },
                  icon: AnimatedIcon(
                    color: Colors.white,
                    size: 40,
                    icon: AnimatedIcons.play_pause,
                    progress: animationController,
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                IconButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () {
                    print('reset was pressed');
                    isPlaying = false;
                    animationController.reverse();
                    rotations++;
                    sec.animateToPage(0);
                    tenSec.animateToPage(0);
                    min.animateToPage(0);
                    tenMin.animateToPage(0);

                    setState(() {});
                  },
                  icon: AnimatedRotation(
                    turns: rotations,
                    duration: Duration(milliseconds: 500),
                    child: Icon(
                      Icons.autorenew,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
