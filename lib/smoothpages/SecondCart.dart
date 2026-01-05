import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class Secondcart extends StatefulWidget {
  const Secondcart({super.key});

  @override
  State<Secondcart> createState() => _FirstcartState();
}

class _FirstcartState extends State<Secondcart> {
  bool liked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xffFF512F), Color(0xffF09819)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: Offset(3, 3),
          )
        ],
      ),
      child: Card(
        color: Colors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 65,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage:
                  AssetImage("assets/Ziyodulloh.jpg"),
                ),
              ),

              SizedBox(height: 18),
              Text(
                "Ibrat Academy",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              SizedBox(height: 8),
              Text(
                "Ziyodullo Usmonjonov| 02.06.2012",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                ),
              ),

               SizedBox(height: 15),
              LinearProgressIndicator(
                value: 0.7,
                backgroundColor: Colors.white24,
                color: Colors.greenAccent,
                minHeight: 6,
              ),

              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: AnimatedSwitcher(
                      duration: Duration(milliseconds: 200),
                      child: Icon(
                        liked
                            ? Icons.favorite
                            : Icons.favorite_border,
                        key: ValueKey(liked),
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                    onPressed: () {
                      setState(() => liked = !liked);
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.share,
                      color: Colors.white,
                      size: 26,
                    ),
                    onPressed: () {
                      Share.share(
                        'Ibrat Academy\n'
                            'Ziyodullo | 02.06.2012\n'
                            'https://ibratfarzandlari.uz',
                      );
                    },
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
