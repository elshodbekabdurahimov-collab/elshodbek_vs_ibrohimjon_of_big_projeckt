import 'package:flutter/material.dart';
import 'package:katta_loyiha/Pages/Darwer/About.dart';
import 'package:katta_loyiha/Pages/Darwer/Notifications.dart';
import 'package:katta_loyiha/Pages/Profile.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool notificationsEnabled = true;
  bool darkTheme = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title: Text(
          "Settings",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white
          ),
        ),
        backgroundColor: Colors.orange.shade700,
        elevation: 2,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text(
            "Account",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black54),
          ),
          SizedBox(height: 10),
          Card(
            elevation: 8,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              leading: Icon(Icons.person_outline, color: Colors.orangeAccent),
              title: Text("Edit Profile at the photo"),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Profile()
                    )
                );
              },
            ),
          ),
           SizedBox(height: 20),
           Text(
            "Preferences",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black54),
          ),
          SizedBox(height: 10),
          Card(
            elevation: 8,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              leading: Icon(Icons.notifications_active_outlined, color: Colors.orangeAccent),
              title: Text("Go to Notifications"),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Notifications()
                    )
                );
              },
            ),
          ),
          SizedBox(height: 10),
          Card(
            elevation: 8,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              leading: Icon(Icons.info_outline, color: Colors.orangeAccent),
              title: Text("Go to the About"),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => About()
                    )
                );
              },
            ),
          ),
          SizedBox(height: 20),
          Card(
            elevation: 8,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              leading: Icon(Icons.logout, color: Colors.orangeAccent),
              title: Text("Logout"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
