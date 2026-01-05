import 'package:flutter/material.dart';
import 'package:katta_loyiha/Pages/Darwer/About.dart';
import 'package:katta_loyiha/Pages/Darwer/Notifications.dart';
import 'package:katta_loyiha/Pages/Darwer/Settings.dart';
import 'package:katta_loyiha/Pages/Profile.dart';
import 'package:katta_loyiha/smoothpages/FirstCart.dart';
import 'package:katta_loyiha/smoothpages/FourthCart.dart';
import 'package:katta_loyiha/smoothpages/SecondCart.dart';
import 'package:katta_loyiha/smoothpages/ThirdCart.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _currentIndex = 0;

  final List<Map<String, String>> stories = [
    {
      "image" : "assets/Elshodbek.jpg",
      "name" : "Elshodbek"
    },
    {
      "image" : "assets/Ziyodulloh.jpg",
      "name" : "Ziyodullo"
    },
    {
      "image" : "assets/Sanjarbek.jpg",
      "name" : "Sanjarbek"
    },
    {
      "image" : "assets/Ibrohimjon.jpg",
      "name" : "Ibrohimjon",
    },
    {
      "image" : "assets/Abduvali.jpg",
      "name" : "Abduvali"
    },
    {
      "image" : "assets/Yahyobek.jpg",
      "name" : "Yahyobek"
    },
    {
      "image" : "assets/Behruzbek.jpg",
      "name" : "Beckie"
    }
  ];

  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:  Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Elshodbek Abdurahimov"),
              accountEmail: Text("elshodbek@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://img.icons8.com/nolan/1200/user-default.jpg",
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.orange
              ),
            ),
            ListTile(
              leading: Icon(Icons.person_outline_outlined),
              title: Text("Profile"),
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Profile())
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.info_outline),
              title: Text("About"),
              onTap: (){
               Navigator.push(
                   context, MaterialPageRoute(
                   builder: (context) => About()
               )
               );
              },
            ),
            ListTile(
              leading: Icon(Icons.notifications_active_outlined),
              title: Text("Notifications"),
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Notifications())
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.settings_outlined),
              title: Text("Settings"),
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingsPage())
                );
              },
            ),
          ],
        ),
      ),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: AppBar(
            toolbarHeight: 105,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            elevation: 5,
            title: Padding(
              padding: EdgeInsets.only(top: 50, left: 8, right: 8, bottom: 50),
              child: SizedBox(
                height: 100,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: stories.length,
                    padding: EdgeInsets.all(8),
                    itemBuilder: (_, i){
                      final story = stories[i];
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: SizedBox(
                          width: 60,
                          child: SafeArea(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(
                                      colors: [Colors.pink, Colors.orange, Colors.red],
                                    ),
                                  ),
                                  child: CircleAvatar(
                                    radius: 25,
                                    backgroundColor: Colors.pinkAccent,
                                    backgroundImage: AssetImage(story["image"]!),
                                  ),
                                ),
                                SizedBox(
                                  width: 70,
                                  child: Text(
                                    story["name"]!,
                                    style: TextStyle(fontSize: 12),
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                ),
              ),
            ),
          )
      ),
      body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            SizedBox(
              height: 450,
              child: PageView(
                controller: _pageController,
                children: [
                  Firstcart(),
                  Secondcart(),
                  Thirdcart(),
                  Fourthcart()
                ],
              ),
            ),

            SmoothPageIndicator(
              controller: _pageController,
              count: 4,
              effect: JumpingDotEffect(
                  activeDotColor: Colors.orangeAccent,
                  dotColor: Colors.orange.shade900,
                  spacing: 18
              ),
            ),
          ],
        ),
      ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          backgroundColor: Colors.orange,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });

            if (index == 0) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profile()),
              );
            }
            else if (index == 1) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => About()
                  )
              );
            }
            else if (index == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Notifications()),
              );
            }
            else if (index == 3) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SettingsPage()
                  )
              );
            }
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_outlined),
              label: "Profile",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info_outline),
              label: "About",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications_active_outlined),
              label: "Notifications",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              label: "Settings",
            ),
          ],
        ),

      );
  }
}