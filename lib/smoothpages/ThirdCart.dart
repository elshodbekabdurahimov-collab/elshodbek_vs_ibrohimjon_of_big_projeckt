import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class Thirdcart extends StatefulWidget {
  const Thirdcart({super.key});

  @override
  State<Thirdcart> createState() => _FirstcartState();
}

class _FirstcartState extends State<Thirdcart> {
  bool liked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xffFF512F), Color(0xffF09819)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(25),
        boxShadow: const [
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
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// IMAGE
              CircleAvatar(
                radius: 65,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage:
                  const AssetImage("assets/Ibrohimjon.jpg"),
                ),
              ),

              const SizedBox(height: 18),

              /// TITLE
              const Text(
                "Ibrat Academy",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 8),

              /// DESCRIPTION
              const Text(
                "Ibrohimjon Yetovqo'ziyev| 20.06.2013",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                ),
              ),

              const SizedBox(height: 15),

              /// PROGRESS
              LinearProgressIndicator(
                value: 0.7,
                backgroundColor: Colors.white24,
                color: Colors.greenAccent,
                minHeight: 6,
              ),

              const SizedBox(height: 15),

              /// ACTIONS
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  /// LIKE
                  IconButton(
                    icon: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
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

                  /// SHARE (PASTDAN OCHILADI)
                  IconButton(
                    icon: const Icon(
                      Icons.share,
                      color: Colors.white,
                      size: 26,
                    ),
                    onPressed: () {
                      Share.share(
                        'Ibrat Academy\n'
                            'Ibrohimjon | 20.06.2012\n'
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
