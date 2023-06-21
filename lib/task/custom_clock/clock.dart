import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:task_design/task/custom_clock/clock_painter.dart';
import 'package:task_design/task/shared/components/components.dart';
import 'package:task_design/task/shared/syles/Icon_broken.dart';

class Clock extends StatefulWidget {
  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  late Timer _timer;
  int selectedIndex = 0;

  @override
  void initState() {
    _timer = Timer.periodic(const Duration(minutes: 1), (timer) {
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#2060C0"),
      appBar: AppBar(
        backgroundColor: HexColor("#2060C0"),
        elevation: 0.0,
        leading: const Icon(
          Icons.arrow_back_sharp,
          color: Colors.white,
        ),
        title: const Text(
          "Today",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SearchIcon(),
          ),
          const SizedBox(
            width: 10,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(IconBroken.Document, color: Colors.white),
          )
        ],
      ),
      body: Stack(children: [
        descriptionWidget(),
        drawCustomClock(),
        writeClock(),
        //Page View
        Container(
          margin: const EdgeInsetsDirectional.only(bottom: 15),
          child: PageView(
            onPageChanged: (idx) {
              selectedIndex = idx;
              setState(() {});
            },
            children: [
              Align(alignment: Alignment.bottomCenter, child: pageViewItem()),
              Align(alignment: Alignment.bottomCenter, child: pageViewItem()),
              Align(alignment: Alignment.bottomCenter, child: pageViewItem()),
              Align(alignment: Alignment.bottomCenter, child: pageViewItem()),
            ],
          ),
        ),
        //indicator
        drawIndicator(),
      ]),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Widget pageViewItem() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      margin: const EdgeInsets.only(top: 50, bottom: 15),
      padding: const EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 20),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Colors.white),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 4,
                backgroundColor: HexColor("#2060C0"),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                DateFormat('hh:mm a').format(DateTime.now()),
                style: TextStyle(color: HexColor("#2060C0"), fontSize: 12),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 6, vertical: 0),
                height: 23,
                color: Colors.green.withOpacity(0.2),
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Confirmed",
                    style: TextStyle(color: Colors.green, fontSize: 8),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            "Teeth Drilling",
            style: TextStyle(color: Colors.black, fontSize: 15),
          ),
          const SizedBox(
            height: 3,
          ),
          const Text(
            "The application may be doing too much work on its main thread The application may be doing too much work on its main thread",
            maxLines: 3,
            style: TextStyle(color: Colors.grey, fontSize: 11),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              CircleAvatar(
                radius: 8,
                backgroundColor: Colors.grey.withOpacity(0.4),
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                "Arthur Clayton",
                style: TextStyle(color: Colors.black, fontSize: 12),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget pageIndicator(double width, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1),
      child: Container(
        width: width,
        height: 8.0,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }

  Widget descriptionWidget() {
    return const Padding(
      padding: EdgeInsetsDirectional.only(top: 30, start: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Office N0. 248",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          Text(
            "3 Patients",
            style: TextStyle(color: Colors.white, fontSize: 11),
          ),
        ],
      ),
    );
  }

  Widget drawCustomClock() {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(bottom: 55),
        child: Transform.rotate(
          angle: -(ClockPainter.oneDegreeInRadian * 90),
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomPaint(
                willChange: true,
                size: const Size.square(170),
                painter: ClockPainter(),
              ),
              Container(
                margin: EdgeInsets.only(bottom: MediaQuery.sizeOf(context).width*0.59,right: 135),
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    backgroundColor:HexColor("#2060C0") ,
                    radius: 15,
                    child: Transform.rotate(
                      angle: -80,
                      child: const CircleAvatar(
                        backgroundImage: AssetImage("assets/images/tooth.png"),
                        radius: 10,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: MediaQuery.sizeOf(context).width*0.7),
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    backgroundColor:HexColor("#2060C0") ,
                    radius: 15,
                    child: Transform.rotate(
                      angle: -80,
                      child: const CircleAvatar(
                        backgroundImage: AssetImage("assets/images/implant.png"),
                        radius: 10,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: MediaQuery.sizeOf(context).width*0.59,left: 140),
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    backgroundColor:HexColor("#2060C0") ,
                    radius: 15,
                    child: Transform.rotate(
                      angle: -80,
                      child: const CircleAvatar(
                        backgroundImage: AssetImage("assets/images/injection.png"),
                        radius: 10,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget writeClock() {
    return Container(
      margin: const EdgeInsets.only(bottom: 55),
      child: Center(
          child: Text(
        "${DateTime.now().hour} : ${DateTime.now().minute}\n    pm",
        style: const TextStyle(color: Colors.white, fontSize: 18),
      )),
    );
  }

  Widget drawIndicator() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 3,
        margin: const EdgeInsetsDirectional.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            selectedIndex == 0
                ? pageIndicator(23.0, HexColor("#084090"))
                : pageIndicator(15.0, Colors.grey.withOpacity(0.2)),
            selectedIndex == 1
                ? pageIndicator(23.0, HexColor("#084090"))
                : pageIndicator(15.0, Colors.grey.withOpacity(0.2)),
            selectedIndex == 2
                ? pageIndicator(23.0, HexColor("#084090"))
                : pageIndicator(15.0, Colors.grey.withOpacity(0.2)),
            selectedIndex == 3
                ? pageIndicator(23.0, HexColor("#084090"))
                : pageIndicator(15.0, Colors.grey.withOpacity(0.2)),
          ],
        ),
      ),
    );
  }
}
