import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<Profile> {
  String nickname = "";
  String surname = "";
  String email = "";
  String? profilePhoto;

  @override
  void initState() {
    super.initState();
    loadProfile();
  }

  Future<void> loadProfile() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      nickname = prefs.getString("name") ?? "John";
      surname = prefs.getString("surname") ?? "";
      email = prefs.getString("email") ?? "john@gmail.com";
      profilePhoto = prefs.getString("profilePhoto");
    });
  }

  Future<void> chooseImage(ImageSource source) async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: source);

    if (image != null) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("profilePhoto", image.path);
      setState(() {
        profilePhoto = image.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Stack(
              children: [
                CircleAvatar(
                  radius: 90,
                  backgroundColor: Colors.orange.shade200,
                  backgroundImage: profilePhoto != null
                      ? FileImage(File(profilePhoto!))
                      : AssetImage("assets/profilee.jpg")
                  as ImageProvider,
                ),
                Positioned(
                  right: 5,
                  bottom: 5,
                  child: InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (_) => Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              leading: Icon(Icons.camera_alt),
                              title: Text("Camera"),
                              onTap: () {
                                Navigator.pop(context);
                                chooseImage(ImageSource.camera);
                              },
                            ),
                            ListTile(
                              leading: Icon(Icons.photo),
                              title: Text("Gallery"),
                              onTap: () {
                                Navigator.pop(context);
                                chooseImage(ImageSource.gallery);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.edit, color: Colors.orange),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Text(
              "$nickname $surname",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            SizedBox(height: 5),
            Text(
              email,
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
            SizedBox(height: 25),
            Card(
              elevation: 10,
              margin: EdgeInsets.symmetric(horizontal: 20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.person_pin_rounded,
                      color: Colors.orange.shade800,
                    ),
                    title: Text("Ism",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.orange
                    ),
                    ),
                    subtitle: Text(nickname,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.orange
                      ),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.person_pin_outlined,
                      color: Colors.orange.shade800,
                    ),
                    title: Text("Familiya",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.orange
                      ),
                    ),
                    subtitle: Text(surname,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.orange
                      ),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.email_outlined,
                    color: Colors.orange.shade800,
                    ),
                    title: Text("Email",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.orange
                      ),
                    ),
                    subtitle: Text(email,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.orange
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
