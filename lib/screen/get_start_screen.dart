import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:three_screen_test_project/material/color.dart';
import 'login_screen.dart';

class GetStartScreen extends StatefulWidget {
  const GetStartScreen({Key? key}) : super(key: key);

  @override
  State<GetStartScreen> createState() => _GetStartScreenState();
}

class _GetStartScreenState extends State<GetStartScreen> {
  final PageController pageController = PageController();
  int currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        currentPageIndex = pageController.page!.round();
      });
    });
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.colorPrimary,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 170),
            SizedBox(
              height: 280,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: PageView(
                      controller: pageController,
                      onPageChanged: (index) {
                        setState(() {
                          currentPageIndex = index;
                        });
                      },
                      children: const [
                        Image(
                          width: 190,
                          height: 185,
                          image:
                              AssetImage("assets/images/get_start_sc_logo.png"),
                        ),
                        Image(
                          width: 190,
                          height: 185,
                          image:
                              AssetImage("assets/images/get_start_sc_logo.png"),
                        ),
                        Image(
                          width: 190,
                          height: 185,
                          image:
                              AssetImage("assets/images/get_start_sc_logo.png"),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  // Adjust as needed
                  DotsIndicator(
                    dotsCount: 3,
                    position: currentPageIndex.toDouble(),
                    decorator: const DotsDecorator(
                      color: Colors.grey, // Inactive color
                      activeColor: AppColors.colorPrimary, // Active color
                    ),
                  ),
                ],
              ),
            ),
            const Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 40, right: 40, top: 30),
                  child: Text(
                    'Suivez la localisation de votre colis',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15, left: 10, right: 10),
                  child: Text(
                    'Créer un compte ou connectez vous pour continuer',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 40, bottom: 50, left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },
                    child: Container(
                      height: 48,
                      width: 158,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.white),
                      child: const Center(
                        child: Text(
                          'Skip',
                          style: TextStyle(
                            color: AppColors.colorPrimary,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },
                    child: Container(
                      height: 48,
                      width: 158,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.colorPrimary),
                      child: const Center(
                        child: Text(
                          'Continue',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
