import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {

  List<Map<String, dynamic>> news = [
    {
      "sarlavha": "Ism va Familiya to‘g‘ri kiritildi",
      "text": "Register sahifasida ism va familiya to‘liq kiritilgan bo‘lsa, Profile sahifada to‘liq ko‘rinadi.",
      "vaqt": "1 soat oldin",
      "image": "assets/ibrat.jpg"
    },
    {
      "sarlavha": "Email manzilingizni tekshiring",
      "text": "Register sahifasida email noto‘g‘ri kiritsangiz, Profile sahifada ham xato ko‘rinadi.",
      "vaqt": "2 soat oldin",
      "image": "assets/ibrat.jpg"
    },
    {
      "sarlavha": "Parol xavfsizligi",
      "text": "Parol kamida 6 ta belgidan iborat bo‘lishi kerak. Register’da noto‘g‘ri parol kiritsangiz sahifa o‘tmaydi.",
      "vaqt": "3 soat oldin",
      "image": "assets/ibrat.jpg"
    },
    {
      "sarlavha": "Profil rasmini o‘zgartirish",
      "text": "Profile sahifada profil rasmini kamera yoki galareyadan o‘zgartirishingiz mumkin.",
      "vaqt": "Bugun",
      "image": "assets/ibrat.jpg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(
        title: Text(
          "Notifications",
        ),
        backgroundColor: Colors.orange,
        elevation: 2,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: news.length,
          itemBuilder: (context, index) {
            final item = news[index];
            return Card(
              elevation: 5,
              margin: const EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Network rasm + placeholder
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                    child: Image.network(
                      item["image"],
                      width: double.infinity,
                      height: 180,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Container(
                          width: double.infinity,
                          height: 180,
                          color: Colors.grey[300],
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: double.infinity,
                          height: 180,
                          color: Colors.grey[300],
                          child: Center(
                            child: Image(
                                image: AssetImage("assets/ibrat.jpg")
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item["sarlavha"],
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          item["text"],
                          style: const TextStyle(fontSize: 14),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          item["vaqt"],
                          style: const TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
