import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_project1/responsive/navbar.dart';
import 'package:flutter_project1/utils/colors.dart';
import 'package:flutter_project1/screens/profile_extension_screen/settings_screen.dart';
import 'package:flutter_project1/screens/login_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  User? _currentUser;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  File? _imageFile;

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
  }

  Future<void> _getCurrentUser() async {
    User? user = FirebaseAuth.instance.currentUser;
    setState(() {
      _currentUser = user;
      if (user != null) {
        _nameController.text = user.displayName ?? '';
        _emailController.text = user.email ?? '';
      }
    });
  }

  Future<void> _updateProfile() async {
    try {
      if (_currentUser != null) {
        await _currentUser!.updateDisplayName(_nameController.text);
        await _currentUser!.updateEmail(_emailController.text);

        String? imageUrl;
        if (_imageFile != null) {
          imageUrl = await _uploadImage(_imageFile!);
          await _currentUser!.updatePhotoURL(imageUrl);
        }

        await FirebaseFirestore.instance.collection('users').doc(_currentUser!.uid).update({
          'displayName': _nameController.text,
          'email': _emailController.text,
          if (imageUrl != null) 'photoURL': imageUrl,
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

  Future<String> _uploadImage(File image) async {
    return 'https://example.com/uploaded_image.jpg'; // Placeholder URL
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  Future<void> _logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()), // Ensure LoginScreen is imported
            (route) => false,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to logout: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SimpleBottomNavigation()),
        );
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: main1,
          title: Center(
            child: const Text('Profil'),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SimpleBottomNavigation()), // Ensure HomePage is imported
              );
            },
          ),
        ),
        body: _currentUser == null ? _buildLoggedOutView() : _buildLoggedInView(),
        backgroundColor: Colors.white,
      ),
    );
  }

  Widget _buildLoggedInView() {
    return ListView(
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
                onTap: _pickImage,
                child: CircleAvatar(
                  backgroundColor: lower1,
                  minRadius: 55.0,
                  child: CircleAvatar(
                    radius: 50.0,
                    backgroundImage: _imageFile != null
                        ? FileImage(_imageFile!)
                        : NetworkImage(
                      _currentUser?.photoURL ??
                          'https://media.istockphoto.com/id/1337144146/id/vektor/vektor-ikon-profil-avatar-default.jpg?s=612x612&w=0&k=20&c=oMrbNlS6EplbdwqmGml8h5Sbk33Pu3FHQRJ7OyRro2o=',
                    ) as ImageProvider,
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
                    'Pengaturan ',
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
                    'Histori Pembelian ',
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
                    'Privasi',
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
                    'Bantuan & Dukungan',
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
                onTap: _logout,
                child: ListTile(
                  title: Text(
                    'Keluar',
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
    );
  }

  Widget _buildLoggedOutView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'You are not logged in',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: upper1,
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
                    (route) => false,
              );
            },
            child: Text('Login'),
            style: ElevatedButton.styleFrom(
              backgroundColor: upper1
            ),
          ),
        ],
      ),
    );
  }
}
