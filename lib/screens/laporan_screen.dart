import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import '../responsive/navbar.dart';
import '../utils/colors.dart';

class MissingPerson {
  final String name;
  final String description;
  final String? imageUrl;
  String? imageStorageUrl;

  MissingPerson({
    required this.name,
    required this.description,
    this.imageUrl,
    this.imageStorageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
      'imageStorageUrl': imageStorageUrl,
    };
  }

  static MissingPerson fromMap(Map<String, dynamic> map) {
    return MissingPerson(
      name: map['name'],
      description: map['description'],
      imageUrl: map['imageUrl'],
      imageStorageUrl: map['imageStorageUrl'],
    );
  }
}

class MissingPersonScreen extends StatefulWidget {
  @override
  _MissingPersonScreenState createState() => _MissingPersonScreenState();
}

class _MissingPersonScreenState extends State<MissingPersonScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final ImagePicker _picker = ImagePicker();
  List<MissingPerson> _allPersons = [];
  List<MissingPerson> _filteredPersons = [];

  @override
  void initState() {
    super.initState();
    _fetchMissingPersons();
  }

  void _fetchMissingPersons() async {
    QuerySnapshot snapshot = await _firestore.collection('missingPersons').get();
    List<MissingPerson> persons = snapshot.docs.map((doc) {
      return MissingPerson.fromMap(doc.data() as Map<String, dynamic>);
    }).toList();

    setState(() {
      _allPersons = persons;
      _filteredPersons = persons;
    });
  }

  void _filterPersons() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      _filteredPersons = _allPersons.where((person) {
        return person.name.toLowerCase().contains(query) ||
            person.description.toLowerCase().contains(query);
      }).toList();
    });
  }

  Future<String?> _uploadImageToStorage(File imageFile) async {
    try {
      firebase_storage.Reference storageRef = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('missing_persons_images')
          .child(DateTime.now().millisecondsSinceEpoch.toString() + '.jpg');

      firebase_storage.UploadTask uploadTask = storageRef.putFile(imageFile);

      firebase_storage.TaskSnapshot taskSnapshot = await uploadTask;
      String downloadUrl = await taskSnapshot.ref.getDownloadURL();

      return downloadUrl;
    } catch (e) {
      print('Error uploading image to Firebase Storage: $e');
      return null;
    }
  }

  void _addMissingPerson(MissingPerson person, File? imageFile) async {
    if (imageFile != null) {
      String? downloadUrl = await _uploadImageToStorage(imageFile);
      person.imageStorageUrl = downloadUrl;
    }

    await _firestore.collection('missingPersons').add(person.toMap());
    _fetchMissingPersons(); // Refresh the list
  }

  void _showAddPersonDialog() {
    String name = '';
    String description = '';
    File? imageFile;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Missing Person'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: InputDecoration(hintText: 'Name'),
                  onChanged: (value) {
                    name = value;
                  },
                ),
                TextField(
                  decoration: InputDecoration(hintText: 'Description'),
                  onChanged: (value) {
                    description = value;
                  },
                ),
                Row(

                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: upper1,
                      ),
                      onPressed: () async {
                        final pickedFile =
                        await _picker.pickImage(source: ImageSource.gallery);
                        if (pickedFile != null) {
                          setState(() {
                            imageFile = File(pickedFile.path);
                          });
                        }
                      },
                      child: Text('Add Image'),
                    ),
                    SizedBox(width: 10),
                    if (imageFile != null)
                      Image.file(
                        imageFile!,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (name.isNotEmpty && description.isNotEmpty) {
                  _addMissingPerson(
                    MissingPerson(
                      name: name,
                      description: description,
                      imageUrl: null,
                    ),
                    imageFile,
                  );
                  Navigator.of(context).pop();
                }
              },
              child: Text('Add'),
            ),
          ],
          backgroundColor: Colors.white,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SimpleBottomNavigation()), // Ensure HomePage is imported
        );
        return false;
      },
      child: Scaffold(
      appBar: AppBar(
        title: Text('Laporan Orang Hilang'),
        backgroundColor: main1,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _showAddPersonDialog,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search by name or description',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                _filterPersons();
              },
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredPersons.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: upper1,
                    child: ListTile(
                      leading: _filteredPersons[index].imageStorageUrl != null
                          ? SizedBox(
                        width: 50,
                        height: 50,
                        child: Image.network(
                          _filteredPersons[index].imageStorageUrl!,
                          fit: BoxFit.cover,
                        ),
                      )
                          : SizedBox(
                        width: 50,
                        height: 50,
                        child: Icon(
                          Icons.person,
                          size: 50,
                        ),
                      ),
                      title: Text(_filteredPersons[index].name),
                      subtitle: Text(_filteredPersons[index].description),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      ),
    );
  }
}
