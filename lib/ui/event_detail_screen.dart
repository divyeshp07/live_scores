import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:live_scoree/constant/color.dart';
import 'package:video_player/video_player.dart';


class EventDetails extends StatefulWidget {
  EventDetails({
    required this.title,
    required this.subTitle,
    required this.no1,
    required this.no2,
    Key? key,
  }) : super(key: key);

  final String title;
  final String subTitle;
  final String no1;
  final String no2;

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  late VideoPlayerController _videoPlayerController1;
  ChewieController? _chewieController;
  int? bufferDelay;
  bool fullscreen = false;
  bool flipScreen = false;

  @override
  void initState() {
    initializePlayer();
    startAnimation();
    super.initState();
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  List<String> srcs = [
    "assets/videos/football.mp4",
  ];

  Future<void> initializePlayer() async {
    _videoPlayerController1 = VideoPlayerController.asset(srcs[currPlayIndex])
      ..pause();
    await Future.wait([
      _videoPlayerController1.initialize(),
    ]);
    _createChewieController();
    setState(() {});
  }

  void _createChewieController() {
    _chewieController = ChewieController(
      fullScreenByDefault: true,
      showOptions: true,
      deviceOrientationsAfterFullScreen: [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown
      ],
      allowFullScreen: true,
      autoInitialize: true,
      videoPlayerController: _videoPlayerController1,
      autoPlay: false,
      looping: false,
      hideControlsTimer: const Duration(seconds: 10),
    );
  }

  int currPlayIndex = 0;

  Future<void> toggleVideo() async {
    await _videoPlayerController1.pause();
    currPlayIndex += 1;
    if (currPlayIndex >= srcs.length) {
      currPlayIndex = 0;
    }
    await initializePlayer();
  }

  bool animate = false;
  double opacity = 1.0;
  double secondopacity = 0.0;

  List<String> title = [
    "Ahmad Syaiful",
    "Lil Uzi Pret",
    "Robert Slavaskla",
    "Alvanso Moreno",
  ];

  List<String> about = [
    "Goll!!! MIA SAN MIA BAYERN! 🔥🔥",
    "MIA SAN MIA BAYERN! 🔥🔥",
    "MIA SAN MIA!!!DANKE for all fans! 🎉",
    "FC Holiwood is the one! 😎",
  ];

  List<String> imgList = [
    "assets/images/man.png",
    "assets/images/man2.png",
    "assets/images/girl.png",
    "assets/images/girl2.png",
  ];

  Future<void> startAnimation() async {
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

  Future<void> animationOpacity() async {
    await Future.delayed(
      const Duration(milliseconds: 500),
    );
    setState(() {
      opacity = 1;
      secondopacity = 1;
    });
  }

  final TextEditingController myController = TextEditingController();

  void addItemToList() {
    setState(() {
      about.insert(0, myController.text);
      title.insert(0, "Alvanso Moreno");
      imgList.insert(0, "assets/images/man2.png");
    });
  }

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
                    const SizedBox(height: 35),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
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
                          Container(
                            height: 60,
                            width: 60,
                            decoration: const BoxDecoration(
                              color: kSkyBlueColor,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.share_outlined,
                              color: kWhiteColor,
                              size: 25,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                            height: 60,
                            width: 60,
                            decoration: const BoxDecoration(
                              color: kSkyBlueColor,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.file_download,
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
                    AnimationConfiguration.staggeredList(
                      position: 1,
                      duration: const Duration(seconds: 2),
                      child: SlideAnimation(
                        verticalOffset: 400.0,
                        child: FadeInAnimation(
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            height: 50,
                            decoration: BoxDecoration(
                              color: kWhiteColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 160,
                                        color: Colors.transparent,
                                        child: Row(
                                          children: [
                                            Container(
                                              margin:
                                                  const EdgeInsets.only(top: 8),
                                              height: 30,
                                              width: 30,
                                              decoration: const BoxDecoration(
                                                  color: kLightCircleColor,
                                                  shape: BoxShape.circle),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(5),
                                                child: Image.asset(
                                                  ball1,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8, top: 8),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    widget.title,
                                                    style: const TextStyle(
                                                      color: kBlackColor,
                                                      fontFamily:
                                                          'Poppins-Medium',
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  Text(
                                                    widget.subTitle,
                                                    style: const TextStyle(
                                                      color: Color(0xffd6d6d6),
                                                      fontFamily:
                                                          'Poppins-Medium',
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
                                          widget.no2,
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
                                          widget.no1,
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
                        ),
                      ),
                    ),
                    AnimationConfiguration.staggeredList(
                      position: 1,
                      duration: const Duration(seconds: 3),
                      child: SlideAnimation(
                        verticalOffset: 400.0,
                        child: FadeInAnimation(
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            height: MediaQuery.of(context).size.height,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    _chewieController != null &&
                                            _chewieController!
                                                .videoPlayerController
                                                .value
                                                .isInitialized
                                        ? AspectRatio(
                                            aspectRatio: 1.78,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color: Colors.transparent),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                child: Chewie(
                                                  controller:
                                                      _chewieController!,
                                                ),
                                              ),
                                            ),
                                          )
                                        : const Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              ),
                                            ],
                                          ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, left: 10),
                                      child: Container(
                                        height: 35,
                                        width: 100,
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.5),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: const Center(
                                          child: Text(
                                            "Replay",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Poppins-Medium',
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 3),
                                  height: 40,
                                  width: 170,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: const Color(0xff939da4),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "View All Comments",
                                      style: TextStyle(
                                          color: kWhiteColor, fontSize: 13),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 20),
                                  height: 300,
                                  color: Colors.transparent,
                                  child: ListView.builder(
                                    physics: const BouncingScrollPhysics(),
                                    itemCount: title.length,
                                    padding: const EdgeInsets.all(0),
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: Row(
                                          children: [
                                            Container(
                                              height: 40,
                                              width: 40,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.transparent,
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                child: Image.asset(
                                                  imgList[index],
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 6),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    title[index],
                                                    style: const TextStyle(
                                                      color: kWhiteColor,
                                                      fontFamily:
                                                          'Poppins-Medium',
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                  Text(
                                                    about[index],
                                                    style: const TextStyle(
                                                        color: kWhiteColor,
                                                        fontFamily:
                                                            'Poppins-Medium',
                                                        fontSize: 12,
                                                        overflow:
                                                            TextOverflow.clip),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const Spacer(),
                                            Container(
                                              height: 38,
                                              width: 38,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                color: kLightColor,
                                              ),
                                              child: const Icon(
                                                Icons.favorite_border,
                                                color: kWhiteColor,
                                                size: 19,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 3,
                                            ),
                                            Container(
                                              height: 38,
                                              width: 38,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                color: kLightColor,
                                              ),
                                              child: const Icon(
                                                Icons.messenger_outline,
                                                color: kWhiteColor,
                                                size: 18,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                txtFieldRowWidget()
                              ],
                            ),
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

  Widget txtFieldRowWidget() {
    return Row(
      children: [
        Container(
          width: 284,
          color: Colors.transparent,
          child: TextField(
            style: const TextStyle(color: Colors.white),
            controller: myController,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide:
                    const BorderSide(color: Colors.transparent, width: 0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide:
                    const BorderSide(color: Colors.transparent, width: 0),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide:
                    const BorderSide(color: Colors.transparent, width: 0),
              ),
              suffixIcon: Padding(
                padding: const EdgeInsets.all(8),
                child: GestureDetector(
                  onTap: () {
                    addItemToList();
                    myController.clear();
                  },
                  child: Image.asset(
                    "assets/images/send.png",
                    height: 8,
                    color: kWhiteColor,
                  ),
                ),
              ),
              filled: true,
              hintStyle: TextStyle(
                color: kWhiteColor.withOpacity(0.6),
              ),
              hintText: "Type your comment...",
              fillColor: const Color.fromARGB(255, 14, 13, 13),
            ),
          ),
        ),
        const Spacer(),
        Container(
          height: 60,
          width: 70,
          decoration: const BoxDecoration(
              color: Color(0xffc7c1bc), shape: BoxShape.circle),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Image.asset("assets/images/gift.png"),
          ),
        ),
      ],
    );
  }
}
