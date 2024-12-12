import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:live_scoree/constant/color.dart';

import 'details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List ballImg = [ball1, ball2, ball3, ball4];
  List date = [
    "01 OCT",
    "02 OCT",
    "03 OCT",
    "04 OCT",
    "05 OCT",
    "06 OCT",
    "07 OCT",
    "08 OCT",
    "09 OCT",
    "10 OCT",
  ];
  List ballHeight = [10.0, 8.0, 13.0, 6.0];
  int selected = 0;
  int dateSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 27, 82, 103),
              Color.fromARGB(255, 42, 67, 82),
              Color(0xff7a8690),
              Color(0xff8f9596),
              Color(0xff989a9c),
              Color(0xffbdb5af),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                const SizedBox(height: 100.0),
                Row(
                  children: [
                    Container(
                      height: 50.0,
                      width: 72.0,
                      decoration: const BoxDecoration(
                        color: kSkyBlueColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(100.0),
                        ),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.menu,
                          color: kWhiteColor,
                        ),
                      ),
                    ),
                    Container(
                      height: 50.0,
                      width: 288.0,
                      color: Colors.transparent,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: ballImg.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selected = index;
                              });
                            },
                            child: Container(
                              height: 50.0,
                              width: 72.0,
                              decoration: BoxDecoration(
                                color: selected == index
                                    ? kWhiteColor
                                    : kSkyBlueColor,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(100.0),
                                ),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.all(ballHeight[index]),
                                  child: Image.asset(
                                    ballImg[index],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30.0),
                  height: 30.0,
                  width: double.infinity,
                  color: Colors.transparent,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: date.length,
                    itemBuilder: (context, index) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                dateSelected = index;
                              });
                            },
                            child: Text(
                              date[index],
                              style: TextStyle(
                                  color: dateSelected == index
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
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  height: 555.0,
                  width: double.infinity,
                  color: Colors.transparent,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      child: Column(
                        children: [
                          details("Group B"),
                          bigDetail("Club Brugge", "Atletico Madrid", "2", "0"),
                          bigDetail(
                              "Arsenal FC", "Bayern Leverkusen", "2", "1"),
                          details("Group C"),
                          bigDetail(
                              "Fc Bayern Munchen", "Viktoria Plazen", "5", "0"),
                          bigDetail(
                              "Arsenal FC", "Bayern Leverkusen", "2", "1"),
                          details("Group B"),
                          bigDetail("Club Brugge", "Atletico Madrid", "2", "0"),
                          bigDetail(
                              "Fc Bayern Munchen", "Viktoria Plazen", "5", "0"),
                          const SizedBox(height: 5.0),
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
    );
  }

  Widget details(String title) {
    return Container(
      margin: const EdgeInsets.only(top: 5.0),
      height: 40.0,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.all(
          Radius.circular(15.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          children: [
            Container(
              height: 30.0,
              width: 30.0,
              decoration: const BoxDecoration(
                  color: kLightCircleColor, shape: BoxShape.circle),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Image.asset(
                  ball1,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: kBlackColor,
                        fontFamily: "Poppins-Bold",
                        fontSize: 11.0,
                      ),
                    ),
                  ),
                  const Text(
                    "Champion League",
                    style: TextStyle(
                      color: kLightGreyColor,
                      fontFamily: "Poppins-Medium",
                      fontSize: 8.0,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Container(
              height: 30.0,
              width: 30.0,
              decoration: const BoxDecoration(
                  color: kLightCircleColor, shape: BoxShape.circle),
              child: const Center(
                child: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: kLightGreyColor,
                  size: 10.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bigDetail(
      String firstName, String secondName, String firstNo, String secondNo) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return DetailsScreen(
                firstName: firstName,
                secondName: secondName,
              );
            },
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(top: 5.0),
        height: 110.0,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Row(
                  children: [
                    Container(
                      height: 30.0,
                      width: 30.0,
                      decoration: const BoxDecoration(
                          color: kLightCircleColor, shape: BoxShape.circle),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Image.asset(
                          volleyball1,
                        ),
                      ),
                    ),
                    Container(
                      height: 30.0,
                      width: 30.0,
                      decoration: const BoxDecoration(
                          color: kLightCircleColor, shape: BoxShape.circle),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Image.asset(
                          volleyball2,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    const Text(
                      "60'",
                      style: TextStyle(
                        color: kLightRedColor,
                        fontFamily: "Poppins-Medium",
                        fontSize: 12.0,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      height: 30.0,
                      width: 100.0,
                      decoration: const BoxDecoration(
                        color: kLightCircleColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          "View Detail",
                          style: TextStyle(
                            color: kBlackColor,
                            fontFamily: "Poppins-Medium",
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        SystemNavigator.pop();
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 7.0),
                        height: 30.0,
                        width: 30.0,
                        decoration: const BoxDecoration(
                            color: kBlackColor, shape: BoxShape.circle),
                        child: const Center(
                          child: Icon(
                            Icons.notifications_outlined,
                            color: kWhiteColor,
                            size: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Text(
                    firstName,
                    style: const TextStyle(
                      color: kBlackColor,
                      fontFamily: "Poppins-Medium",
                      fontSize: 18.0,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    firstNo,
                    style: const TextStyle(
                      color: kBlackColor,
                      fontFamily: "Poppins-Medium",
                      fontSize: 18.0,
                    ),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                ],
              ),
              const SizedBox(
                height: 2.0,
              ),
              Row(
                children: [
                  Text(
                    secondName,
                    style: const TextStyle(
                      color: kBlackColor,
                      fontFamily: "Poppins-Medium",
                      fontSize: 18.0,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    secondNo,
                    style: const TextStyle(
                      color: kBlackColor,
                      fontFamily: "Poppins-Medium",
                      fontSize: 18.0,
                    ),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
