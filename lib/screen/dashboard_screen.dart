import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:three_screen_test_project/material/color.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'MapScreen.dart';


class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.backgroundColor,
    ));
  }

  static List<Widget> _widgetOptions = <Widget>[
    MainPage(),
    Text('Payment Page'),
    MapSample(),
    Text('Profile Page'),
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: AppColors.white,
        selectedItemColor: AppColors.colorPrimary,
        unselectedItemColor: AppColors.secondaryTextColor,
        elevation: 10,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/earning_icon.png',
              width: 20,
              height: 20,
            ),
            label: 'Payment',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/parcel_icon.png',
              width: 20,
              height: 20,
            ),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/user.png',
              width: 20,
              height: 20,
            ),
            label: 'Profile',
          ),
        ],
      ),
      body:_widgetOptions.elementAt(_selectedIndex),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: double.maxFinite,
              height: 165,
              color: AppColors.backgroundColor,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  //title bar design
                  const Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColors.white,
                        radius: 25,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Simon Etoa',
                            style: TextStyle(
                                color: AppColors.softGreen,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Customer',
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 12,
                            ),
                          )
                        ],
                      ),
                      Expanded(
                        child:
                            SizedBox(), // Placeholder to push the icon to the right
                      ),
                      Icon(
                        CupertinoIcons.bell,
                        color: AppColors.deepYellow,
                        size: 24,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //total earning card
                  SizedBox(
                    height: 136,
                    width: double.maxFinite,
                    child: Card(
                      color: AppColors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 5,
                      child: Column(
                        children: [
                          const Center(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Total Saving',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.secondaryTextColor),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              const Expanded(
                                  child: SizedBox(
                                width: 20,
                              )),
                              Column(
                                children: [
                                  Image.asset(
                                    'assets/icons/earning_icon.png',
                                    width: 24,
                                    height: 24,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text(
                                    'Earning',
                                    style: TextStyle(
                                      color: AppColors.secondaryTextColor,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text(
                                    '\$625.48',
                                    style: TextStyle(
                                        color: AppColors.deepGreen,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const Expanded(
                                  child: SizedBox(
                                width: 20,
                              )),
                              Column(
                                children: [
                                  Image.asset(
                                    'assets/icons/collection_icon.png',
                                    width: 24,
                                    height: 24,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text(
                                    'Collection',
                                    style: TextStyle(
                                      color: AppColors.secondaryTextColor,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text(
                                    '95%',
                                    style: TextStyle(
                                        color: AppColors.deepGreen,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const Expanded(
                                  child: SizedBox(
                                width: 20,
                              )),
                              Column(
                                children: [
                                  Image.asset(
                                    'assets/icons/blance_icon.png',
                                    width: 24,
                                    height: 24,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text(
                                    'Balance',
                                    style: TextStyle(
                                      color: AppColors.secondaryTextColor,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text(
                                    '\$1254.89',
                                    style: TextStyle(
                                        color: AppColors.deepGreen,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const Expanded(
                                  child: SizedBox(
                                width: 20,
                              )),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //overview text
                  Row(
                    children: [
                      const Text(
                        'Overview',
                        style: TextStyle(
                            color: AppColors.primaryTextColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      const Expanded(child: SizedBox()),
                      const Text(
                        'Monthly',
                        style: TextStyle(
                          color: AppColors.secondaryTextColor,
                          fontSize: 12,
                        ),
                      ),
                      Image.asset(
                        'assets/icons/drop_icon.png',
                        width: 24,
                        height: 24,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //card box 01
                  Row(
                    children: [
                      //1st 01 card box
                      Expanded(
                        child: Container(
                          height: 108,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: AppColors.firstBorder,
                                width: 1.0,
                              ),
                              color: AppColors.firstBorderBg),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/icons/box01_icon.png',
                                      width: 32,
                                      height: 32,
                                    ),
                                    const Expanded(child: SizedBox()),
                                    Image.asset(
                                      'assets/icons/wave01_icon.png',
                                      width: 61,
                                      height: 13,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  'Colis en traitement',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: AppColors.primaryTextColor),
                                ),
                                SizedBox(
                                  height: 1,
                                ),
                                Text(
                                  '3',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primaryTextColor),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      //1st 02 card box// Add spacing between containers
                      Expanded(
                        child: Container(
                          height: 108,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: AppColors.secondBorderBg,
                            border: Border.all(
                              color: AppColors.secondBorder,
                              width: 1.0,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/icons/box02_icon.png',
                                      width: 32,
                                      height: 32,
                                    ),
                                    const Expanded(child: SizedBox()),
                                    Image.asset(
                                      'assets/icons/wave02_icon.png',
                                      width: 60,
                                      height: 25,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  'Colis delivrer',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: AppColors.primaryTextColor),
                                ),
                                SizedBox(
                                  height: 1,
                                ),
                                Text(
                                  '10',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primaryTextColor),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //card box 02
                  Row(
                    children: [
                      //2nd 01 card box
                      Expanded(
                        child: Container(
                          height: 108,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: AppColors.thirdBorder,
                                width: 1.0,
                              ),
                              color: AppColors.thirdBorderBg),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/icons/box03_icon.png',
                                      width: 32,
                                      height: 32,
                                    ),
                                    const Expanded(child: SizedBox()),
                                    Image.asset(
                                      'assets/icons/wave03_icon.png',
                                      width: 60,
                                      height: 25,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  'Colis en cours',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: AppColors.primaryTextColor),
                                ),
                                SizedBox(
                                  height: 1,
                                ),
                                Text(
                                  '1',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primaryTextColor),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      //2nd 02 card box// Add spacing between containers
                      Expanded(
                        child: Container(
                          height: 108,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: AppColors.fourthBorderBg,
                            border: Border.all(
                              color: AppColors.fourthBorder,
                              width: 1.0,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/icons/box04_icon.png',
                                      width: 32,
                                      height: 32,
                                    ),
                                    const Expanded(child: SizedBox()),
                                    Image.asset(
                                      'assets/icons/wave04_icon.png',
                                      width: 61,
                                      height: 13,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  'Colis retourner',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: AppColors.primaryTextColor),
                                ),
                                SizedBox(
                                  height: 1,
                                ),
                                Text(
                                  '0',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primaryTextColor),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //Pending Parcels text
                  const Row(
                    children: [
                      Text(
                        'Livraison en cours',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryTextColor
                        ),
                      ),
                      Expanded(child: SizedBox()),
                      Text(
                        'View All',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: AppColors.secondaryTextColor
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  //list item design
                  SizedBox(
                    height: 88,
                    width: double.maxFinite,
                    child: Card(
                      color: AppColors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(width: 10,),
                          Image.asset(
                            'assets/images/product01_img.png',
                            height: 46,
                            width: 46,
                          ),
                          const SizedBox(width: 10,),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10,),
                              Text(
                                'Huile de cotton',
                                style: TextStyle(
                                  color: AppColors.primaryTextColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                'Taille: 34”, Poids: 2.5K',
                                style: TextStyle(
                                    color: AppColors.secondaryTextColor,
                                    fontSize: 12,
                                ),
                              ),
                              Text(
                                '1254.89FCFA',
                                style: TextStyle(
                                    color: AppColors.deepGreen,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 88,
                    width: double.maxFinite,
                    child: Card(
                      color: AppColors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(width: 10,),
                          Image.asset(
                            'assets/images/product02_img.png',
                            height: 46,
                            width: 46,
                          ),
                          const SizedBox(width: 10,),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10,),
                              Text(
                                'Boite multi-container',
                                style: TextStyle(
                                    color: AppColors.primaryTextColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                'taille: 34”, Poids: 2.5K',
                                style: TextStyle(
                                  color: AppColors.secondaryTextColor,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                '1254.89FCFA',
                                style: TextStyle(
                                    color: AppColors.deepGreen,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          )
                        ],
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
}

