import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pajacyk/presentation/application/app_assets.dart';
import 'package:pajacyk/presentation/application/insets.dart';
import 'package:pajacyk/presentation/application/pdf_files_https.dart';
import 'package:pajacyk/presentation/application/texts.dart';
import 'package:pajacyk/presentation/application/theme.dart';
import 'package:pajacyk/presentation/common/laucher_url.dart';
import 'package:pajacyk/presentation/screens/home/bloc/home_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> _animation;

  Future<void> _openFacebook() async {
    String fbProtocolUrl;
    if (Platform.isIOS) {
      fbProtocolUrl = PdfLauncher.profilePajacykId;
    } else {
      fbProtocolUrl = PdfLauncher.profilePajacykId;
    }

    String fallbackUrl = PdfLauncher.profilePajacykFb;

    try {
      Uri fbBundleUri = Uri.parse(fbProtocolUrl);
      var canLaunchNatively = await canLaunchUrl(fbBundleUri);

      if (canLaunchNatively) {
        launchUrl(fbBundleUri);
      } else {
        await launchUrl(
          Uri.parse(fallbackUrl),
          mode: LaunchMode.externalApplication,
        );
      }
    } catch (e, st) {
      // Handle this as you prefer
    }
  }

  @override
  void initState() {
    animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    _animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeIn,
    ));
    animationController.forward();

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  bool isPajactkPressed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[500],
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    AppTexts.homeTitle,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text(
                      AppTexts.homeDescription,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Image.asset(
                      AppAssets.podest,
                      scale: 1,
                    ),
                    GestureDetector(
                      onTap: () {
                        context.read<HomeBloc>().add(
                              RunScheduleNotificationEvent(
                                context: context,
                                clicks: 1,
                              ),
                            );
                      },
                      child: SizedBox(
                        width: 400,
                        height: 400,
                        child: FadeTransition(
                          opacity: _animation,
                          child: BlocBuilder<HomeBloc, HomeState>(
                            builder: (contex, state) => Image.asset(
                              state.isProcessing ? AppAssets.pajacykOn : AppAssets.pajacykOff,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    HomeCard(
                      headerText: AppTexts.wspomozHeaderText,
                      bodyText: AppTexts.wspomozBodyText,
                      buttonText: AppTexts.wspomozButtonText,
                      buttonColor: Colors.pink[300],
                      buttonTextColor: Colors.white,
                      headerColor: Colors.pink[300],
                    ),
                    HomeCard(
                      url: PdfLauncher.nabor,
                      headerText: AppTexts.naborHeadTitle,
                      bodyText: AppTexts.naborBodyText,
                      buttonText: AppTexts.naborButtonText,
                      buttonColor: Colors.orange[500],
                      buttonTextColor: Colors.white,
                      headerColor: Colors.orange[500],
                    ),
                    HomeCard(
                      imageIndex: 1,
                      url: PdfLauncher.stolPajacyka,
                      headerText: AppTexts.stolPajacykaTitle,
                      bodyText: AppTexts.stolPajacykaBodyText,
                      buttonText: AppTexts.stolPajacykaButtonText,
                      cardColor: Colors.yellow,
                    ),
                    HomeCard(
                      imageIndex: 2,
                      url: PdfLauncher.pajacykBezPrzerwy,
                      headerText: AppTexts.pajacykBezPrzerwyTitle,
                      bodyText: AppTexts.pajacykBezPrzerwyBodyText,
                      buttonText: AppTexts.stolPajacykaButtonText,
                      cardColor: Colors.yellow,
                    ),
                    MyCarousel(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                _openFacebook();
                              },
                              icon: Icon(
                                Icons.facebook_outlined,
                                size: 55,
                                color: context.palette.cardColor,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              AppTexts.checkFb,
                              style: context.textTheme.caption!.copyWith(
                                color: context.palette.cardColor,
                                fontSize: Insets.large,
                              ),
                            )
                          ],
                        ),
                        GestureDetector(
                          onTap: (() {
                            launchURL(PdfLauncher.pah);
                          }),
                          child: SizedBox(
                            width: 100,
                            height: 70,
                            child: Padding(
                              padding: const EdgeInsets.only(top: Insets.small),
                              child: Image.asset(AppAssets.pahLogo),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomeCard extends StatelessWidget {
  final String headerText;
  final String bodyText;
  final String buttonText;
  final String? url;
  final Color? buttonColor;
  final Color? cardColor;
  final Color? headerColor;
  final Color? buttonTextColor;
  final int? imageIndex;

  const HomeCard({
    Key? key,
    required this.headerText,
    required this.bodyText,
    required this.buttonText,
    this.url,
    this.buttonColor,
    this.cardColor,
    this.headerColor,
    this.buttonTextColor,
    this.imageIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Insets.xLarge),
      child: Container(
        padding: EdgeInsets.only(bottom: Insets.large),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Insets.large),
          ),
          color: cardColor ?? Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: Insets.large),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      imageIndex == null
                          ? SizedBox()
                          : SizedBox(
                              width: 55,
                              height: 40,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Image.asset('assets/$imageIndex.png'),
                              ),
                            ),
                      Text(
                        headerText,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: headerColor ?? Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: Insets.large),
                  child: Text(
                    bodyText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      if (url == null) {
                      } else {
                        launchURL(url!);
                      }
                    },
                    child: Text(
                      buttonText,
                      style: TextStyle(
                        color: buttonTextColor ?? Colors.black,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: buttonColor ?? Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
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
}

class MyCarousel extends StatelessWidget {
  MyCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Insets.xLarge),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Insets.large),
        ),
        color: Colors.white,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 10.0,
                  top: Insets.large,
                ),
                child: Text(
                  AppTexts.partnerzyProgramu,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              CarouselSlider.builder(
                  itemCount: AppAssets.partnerList.length,
                  itemBuilder: (
                    BuildContext context,
                    int itemIndex,
                    int pageViewIndex,
                  ) {
                    return Container(
                      child: Center(
                        child: SizedBox(
                          width: 200,
                          height: 170,
                          child: Image.asset(
                            '${AppAssets.partnerList[itemIndex]}',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    );
                  },
                  options: CarouselOptions(
                    height: 150,
                    viewportFraction: 0.67,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: false,
                    scrollDirection: Axis.horizontal,
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: Insets.large),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    AppTexts.partnerzyProgramuButtonText,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Insets.large),
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
}
