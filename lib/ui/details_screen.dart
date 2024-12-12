// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:live_scoree/constant/color.dart';
import 'package:live_scoree/ui/event_detail_screen.dart';


class DetailsScreen extends StatefulWidget {
  DetailsScreen({required this.firstName, required this.secondName, Key? key})
      : super(key: key);

  String firstName;
  String secondName;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  List category = [
    "Info",
    "Summary",
    "Stats",
    "Line-Ups",
    "Table",
    "H2H",
  ];

  @override
  void initState() {
    startAnimation();
    super.initState();
  }

  bool animate = false;
  double opacity = 0.0;

  Future startAnimation() async {
    await Future.delayed(
      const Duration(milliseconds: 800),
    );
    await Future.delayed(
      const Duration(seconds: 3),
    );
    setState(() {});
    await Future.delayed(
      const Duration(seconds: 1),
    );
    setState(() {
      animate = true;
    });
  }

  animationOpacity() async {
    await Future.delayed(
      const Duration(milliseconds: 500),
    );
    setState(() {
      opacity = 1;
    });
  }

  List events = ["Events", "Commentary"];
  int categorySelected = 0;
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff4b6578),
                  Color(0xff5c7080),
                  Color(0xff7a8690),
                  Color(0xff8f9596),
                  Color(0xff989a9c),
                  Color(0xffbdb5af),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: AnimationLimiter(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(0),
                  children: [
                    AnimationConfiguration.staggeredList(
                      position: 1,
                      duration: const Duration(seconds: 2),
                      child: SlideAnimation(
                        verticalOffset: 50.0,
                        child: FadeInAnimation(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 35,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 3),
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        height: 60,
                                        width: 60,
                                        decoration: const BoxDecoration(
                                          color: kSkyBlueColor,
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Icon(
                                          Icons.arrow_back,
                                          color: kWhiteColor,
                                          size: 25,
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    const Column(
                                      children: [
                                        Text(
                                          "Group C",
                                          style: TextStyle(
                                            color: kWhiteColor,
                                            fontFamily: "Poppins-Bold",
                                            fontSize: 12,
                                          ),
                                        ),
                                        Text(
                                          "Champion League",
                                          style: TextStyle(
                                            color: kSkyBlueColor,
                                            fontFamily: "Poppins-Bold",
                                            fontSize: 11,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Container(
                                      height: 60,
                                      width: 60,
                                      decoration: const BoxDecoration(
                                        color: kSkyBlueColor,
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons.notifications_outlined,
                                        color: kWhiteColor,
                                        size: 25,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 2),
                                height: 100,
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  color: kWhiteColor,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          margin:
                                              const EdgeInsets.only(top: 12),
                                          height: 30,
                                          width: 30,
                                          decoration: const BoxDecoration(
                                              color: kLightCircleColor,
                                              shape: BoxShape.circle),
                                          child: Padding(
                                            padding: const EdgeInsets.all(2),
                                            child: Image.asset(
                                              volleyball2,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 50,
                                          width: 90,
                                          color: Colors.transparent,
                                          child: Center(
                                            child: Text(
                                              widget.firstName,
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                              overflow: TextOverflow.clip,
                                              style: const TextStyle(
                                                  fontFamily:
                                                      'Poppins-SemiBold',
                                                  fontSize: 12),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    const Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(top: 16),
                                          child: Text(
                                            "5 VS 0",
                                            style: TextStyle(
                                              color: kBlackColor,
                                              fontFamily: 'Poppins-Medium',
                                              fontSize: 30,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "75'",
                                          style: TextStyle(
                                            color: kLightRedColor,
                                            fontFamily: "Poppins-SemiBold",
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          margin:
                                              const EdgeInsets.only(top: 12),
                                          height: 30,
                                          width: 30,
                                          decoration: const BoxDecoration(
                                              color: kLightCircleColor,
                                              shape: BoxShape.circle),
                                          child: Padding(
                                            padding: const EdgeInsets.all(2),
                                            child: Image.asset(
                                              volleyball2,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 50,
                                          width: 90,
                                          color: Colors.transparent,
                                          child: Center(
                                            child: Text(
                                              widget.secondName,
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                              overflow: TextOverflow.clip,
                                              style: const TextStyle(
                                                  fontFamily:
                                                      'Poppins-SemiBold',
                                                  fontSize: 12),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 10, left: 10),
                                height: 30,
                                width: double.infinity,
                                color: Colors.transparent,
                                child: ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: category.length,
                                  itemBuilder: (context, index) {
                                    return Center(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 15),
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              categorySelected = index;
                                            });
                                          },
                                          child: Text(
                                            category[index],
                                            style: TextStyle(
                                                color: categorySelected == index
                                                    ? kWhiteColor
                                                    : kLightBlueColor,
                                                fontFamily: "Poppins-Medium"),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 50,
                                color: Colors.transparent,
                                width: double.infinity,
                                child: ListView.builder(
                                  itemCount: 2,
                                  scrollDirection: Axis.horizontal,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selected = index;
                                        });
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.only(right: 5),
                                        height: 35,
                                        decoration: BoxDecoration(
                                          color: selected == index
                                              ? kWhiteColor
                                              : const Color(0xff95a0a5),
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(50),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 30),
                                          child: Center(
                                            child: Text(
                                              events[index],
                                              style: TextStyle(
                                                color: selected == index
                                                    ? kBlackColor
                                                    : kWhiteColor,
                                                fontFamily: 'Poppins-SemiBold',
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              eventSchedule(
                                  "Leroy Sane", "7'", "1 - 0", "J.Musiala"),
                              eventSchedule(
                                  "S. Gnabry", "12'", "2 - 0", "L.Goretzka"),
                              eventSchedule("Sadio Mane", "21'", "3 - 0",
                                  "Kieran Tierney"),
                              eventSchedule(
                                  "T Chory", "29'", "2 - 0", "Viktoria pizen"),
                              eventSchedule(
                                  "J. Musiala", "36'", "3 - 0", "Sadio Mane"),
                              Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 2, vertical: 2),
                                height: 50,
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  color: Color(0xffbdb9b8),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                ),
                                child: const Center(
                                  child: Text(
                                    "HALF TIME",
                                    style: TextStyle(
                                        color: kWhiteColor,
                                        fontFamily: 'Poppins-Medium',
                                        fontSize: 15),
                                  ),
                                ),
                              ),
                              eventSchedule(
                                  "Leroy Sane", "50'", "4 - 0", "J.Musiala"),
                              eventSchedule("Edward Nketiah", "59'", "5 - 0",
                                  "L.Goretzka"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget eventSchedule(String title, String no1, String no2, String subTitle) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return EventDetails(
              title: title,
              subTitle: subTitle,
              no1: no1,
              no2: no2,
            );
          },
        ));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
        height: 50,
        decoration: const BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Container(
                    width: 160,
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 8),
                          height: 30,
                          width: 30,
                          decoration: const BoxDecoration(
                              color: kLightCircleColor, shape: BoxShape.circle),
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Image.asset(
                              ball1,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8, top: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title,
                                style: const TextStyle(
                                  color: kBlackColor,
                                  fontFamily: 'Poppins-Medium',
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                subTitle,
                                style: const TextStyle(
                                  color: Color(0xffd6d6d6),
                                  fontFamily: 'Poppins-Medium',
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      no2,
                      style: const TextStyle(
                          color: kBlackColor,
                          fontSize: 28,
                          fontFamily: 'Poppins-Medium'),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      no1,
                      style: const TextStyle(
                          color: kBlackColor,
                          fontSize: 28,
                          fontFamily: 'Poppins-Medium'),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
