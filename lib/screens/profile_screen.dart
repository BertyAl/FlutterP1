import 'package:flutter/material.dart';
import 'package:flutter_project1/utils/colors.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: main1,
        title: Center(
          child: const Text('Profile'),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 285,
            decoration: BoxDecoration(
              color: middle1
              // gradient: LinearGradient(
              //   colors: [main1, Colors.white],
              //   begin: Alignment.centerLeft,
              //   end: Alignment.centerRight,
              //   stops: [0, 0.4],
              // ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: lower1,
                      minRadius: 55.0,
                      child: CircleAvatar(
                        radius: 50.0,
                        backgroundImage: NetworkImage(
                            'https://media.istockphoto.com/id/1337144146/id/vektor/vektor-ikon-profil-avatar-default.jpg?s=612x612&w=0&k=20&c=oMrbNlS6EplbdwqmGml8h5Sbk33Pu3FHQRJ7OyRro2o='),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Name Here',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: lower1,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    print("Setting Clicked");
                  },
                  child: ListTile(
                    title: Text(
                      'Settings ',
                      style: TextStyle(
                        color: upper1,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Icon(
                      Icons.settings,
                      color: upper1,
                      size: 30,
                    ),
                  ),
                ),
                Divider(),
                GestureDetector(
                  onTap: () {
                    print("Purchase History Clicked");
                  },
                  child: ListTile(
                    title: Text(
                      'Purchase History ',
                      style: TextStyle(
                        color: upper1,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Icon(
                      Icons.history_outlined,
                      color: upper1,
                      size: 30,
                    ),
                  ),
                ),
                Divider(),
                GestureDetector(
                  onTap: () {
                    print("Privacy Clicked");
                  },
                  child: ListTile(
                    title: Text(
                      'Privacy ',
                      style: TextStyle(
                        color: upper1,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Icon(
                      Icons.privacy_tip_outlined,
                      color: upper1,
                      size: 30,
                    ),
                  ),
                ),
                Divider(),
                GestureDetector(
                  onTap: () {
                    print("Help & Support Clicked");
                  },
                  child: ListTile(
                    title: Text(
                      'Help & Support ',
                      style: TextStyle(
                        color: upper1,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Icon(
                      Icons.help_outline,
                      color: upper1,
                      size: 30,
                    ),
                  ),
                ),
                Divider(),
                GestureDetector(
                  onTap: () {
                    print("Logout Clicked");
                  },
                  child: ListTile(
                    title: Text(
                      'Logout ',
                      style: TextStyle(
                        color: upper1,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Icon(
                      Icons.logout,
                      color: upper1,
                      size: 30,
                    ),
                  ),
                ),
                Divider(),
              ],
            ),
          )
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}