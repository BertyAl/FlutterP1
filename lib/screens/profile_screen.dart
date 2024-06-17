// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_project1/utils/colors.dart';
// import 'package:flutter_project1/screens/profile_extension_screen/settings_screen.dart';
//
// class ProfileScreen extends StatefulWidget {
//   const ProfileScreen({super.key});
//
//   @override
//   _ProfileScreenState createState() => _ProfileScreenState();
// }
//
// class _ProfileScreenState extends State<ProfileScreen> {
//   User? _currentUser;
//   String? _displayName;
//   String? _photoUrl;
//
//   @override
//   void initState() {
//     super.initState();
//     _getCurrentUser();
//   }
//
//   Future<void> _getCurrentUser() async {
//     User? user = FirebaseAuth.instance.currentUser;
//     if (user != null) {
//       setState(() {
//         _currentUser = user;
//         _displayName = user.displayName;
//         _photoUrl = user.photoURL ??
//             'https://media.istockphoto.com/id/1337144146/id/vektor/vektor-ikon-profil-avatar-default.jpg?s=612x612&w=0&k=20&c=oMrbNlS6EplbdwqmGml8h5Sbk33Pu3FHQRJ7OyRro2o=';
//       });
//     }
//   }
//
//   Future<void> _logout() async {
//     await FirebaseAuth.instance.signOut();
//     Navigator.pushReplacementNamed(context, '/login'); // Adjust the route name as needed
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: main1,
//         title: Center(
//           child: const Text('Profile'),
//         ),
//       ),
//       body: ListView(
//         children: <Widget>[
//           Container(
//             height: 285,
//             decoration: BoxDecoration(
//               color: middle1,
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: <Widget>[
//                     CircleAvatar(
//                       backgroundColor: lower1,
//                       minRadius: 55.0,
//                       child: CircleAvatar(
//                         radius: 50.0,
//                         backgroundImage: NetworkImage(_photoUrl ?? ''),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Text(
//                   _displayName ?? 'Name Here',
//                   style: TextStyle(
//                     fontSize: 35,
//                     fontWeight: FontWeight.bold,
//                     color: lower1,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             color: Colors.white,
//             child: Column(
//               children: <Widget>[
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => SettingsScreen()),
//                     );
//                   },
//                   child: ListTile(
//                     title: Text(
//                       'Settings ',
//                       style: TextStyle(
//                         color: upper1,
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     trailing: Icon(
//                       Icons.settings,
//                       color: upper1,
//                       size: 30,
//                     ),
//                   ),
//                 ),
//                 Divider(),
//                 GestureDetector(
//                   onTap: () {
//                     print("Purchase History Clicked");
//                   },
//                   child: ListTile(
//                     title: Text(
//                       'Purchase History ',
//                       style: TextStyle(
//                         color: upper1,
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     trailing: Icon(
//                       Icons.history_outlined,
//                       color: upper1,
//                       size: 30,
//                     ),
//                   ),
//                 ),
//                 Divider(),
//                 GestureDetector(
//                   onTap: () {
//                     print("Privacy Clicked");
//                   },
//                   child: ListTile(
//                     title: Text(
//                       'Privacy ',
//                       style: TextStyle(
//                         color: upper1,
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     trailing: Icon(
//                       Icons.privacy_tip_outlined,
//                       color: upper1,
//                       size: 30,
//                     ),
//                   ),
//                 ),
//                 Divider(),
//                 GestureDetector(
//                   onTap: () {
//                     print("Help & Support Clicked");
//                   },
//                   child: ListTile(
//                     title: Text(
//                       'Help & Support ',
//                       style: TextStyle(
//                         color: upper1,
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     trailing: Icon(
//                       Icons.help_outline,
//                       color: upper1,
//                       size: 30,
//                     ),
//                   ),
//                 ),
//                 Divider(),
//                 GestureDetector(
//                   onTap: () {
//                     _logout();
//                   },
//                   child: ListTile(
//                     title: Text(
//                       'Logout ',
//                       style: TextStyle(
//                         color: upper1,
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     trailing: Icon(
//                       Icons.logout,
//                       color: upper1,
//                       size: 30,
//                     ),
//                   ),
//                 ),
//                 Divider(),
//               ],
//             ),
//           )
//         ],
//       ),
//       backgroundColor: Colors.white,
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_project1/utils/colors.dart';
import 'package:flutter_project1/screens/profile_extension_screen/settings_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  User? _currentUser;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _imageController = TextEditingController(); // For image URL

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
  }

  Future<void> _getCurrentUser() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        _currentUser = user;
        _nameController.text = user.displayName ?? '';
        _emailController.text = user.email ?? '';
        _imageController.text = user.photoURL ?? '';
      });
    }
  }

  Future<void> _updateProfile() async {
    try {
      if (_currentUser != null) {
        await _currentUser!.updateDisplayName(_nameController.text);
        await _currentUser!.updateEmail(_emailController.text);
        await _currentUser!.updatePhotoURL(_imageController.text); // Update photo URL

        await FirebaseFirestore.instance
            .collection('users')
            .doc(_currentUser!.uid)
            .update({
          'displayName': _nameController.text,
          'email': _emailController.text,
          'photoURL': _imageController.text, // Update photo URL in Firestore
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Profile updated successfully')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update profile: $e')),
      );
    }
  }

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
              color: middle1,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: _changeProfileImage, // Function to change image
                  child: CircleAvatar(
                    backgroundColor: lower1,
                    minRadius: 55.0,
                    child: CircleAvatar(
                      radius: 50.0,
                      backgroundImage: NetworkImage(
                          _imageController.text.isNotEmpty
                              ? _imageController.text
                              : 'https://media.istockphoto.com/id/1337144146/id/vektor/vektor-ikon-profil-avatar-default.jpg?s=612x612&w=0&k=20&c=oMrbNlS6EplbdwqmGml8h5Sbk33Pu3FHQRJ7OyRro2o='),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  _currentUser?.displayName ?? 'Name Here',
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SettingsScreen()),
                    );
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

  void _changeProfileImage() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Change Profile Image'),
          content: TextFormField(
            controller: _imageController,
            decoration: InputDecoration(
              labelText: 'Image URL',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              fillColor: Colors.white,
              filled: true,
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text('Save'),
              onPressed: () {
                _updateProfile(); // Save changes to profile image
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
