import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:animal/AnimalBioPage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:google_fonts/google_fonts.dart';

class AnimalDetailPage extends StatefulWidget {
  final String category;
  final List<Map<String, String>> animals;

  AnimalDetailPage(this.category, this.animals);

  @override
  _AnimalDetailPageState createState() => _AnimalDetailPageState();
}

class _AnimalDetailPageState extends State<AnimalDetailPage> {
  List<Map<String, String>> likedAnimals = [];
  late List<Map<String, String>> animals;
  final ImagePicker _picker = ImagePicker();

  // Custom color palette
  static const Color primaryBrown = Color(0xFF8B5E3C);
  static const Color lightBrown = Color(0xFFBE8C63);
  static const Color darkBrown = Color(0xFF4A3728);
  static const Color accentBrown = Color(0xFFD4A373);
  static const Color backgroundBrown = Color(0xFFF5E6D3);

  @override
  void initState() {
    super.initState();
    animals = List.from(widget.animals);
    _loadLikedAnimals();
  }

  // Liked animals load from SharedPreferences
  Future<void> _loadLikedAnimals() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? likedData = prefs.getString('liked_animals');
    if (likedData != null) {
      setState(() {
        likedAnimals = List<Map<String, String>>.from(jsonDecode(likedData));
      });
    }
  }

  // Liked animals save in SharedPreferences
  Future<void> _saveLikedAnimals() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('liked_animals', jsonEncode(likedAnimals));
  }

  void toggleLike(Map<String, String> animal) {
    setState(() {
      if (likedAnimals.any((a) => a['name'] == animal['name'])) {
        likedAnimals.removeWhere((a) => a['name'] == animal['name']);
      } else {
        likedAnimals.add(animal);
      }
      _saveLikedAnimals(); // Data save karva
    });
  }

  void navigateToLikedAnimals() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LikedAnimalsPage(likedAnimals: likedAnimals),
      ),
    );
  }

  Future<String?> _pickAndSaveImage() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image == null) return null;

      // Get the application documents directory
      final directory = await getApplicationDocumentsDirectory();
      final String fileName = 'animal_${DateTime.now().millisecondsSinceEpoch}.jpg';
      final String filePath = path.join(directory.path, fileName);

      // Copy the image to the app's directory
      await File(image.path).copy(filePath);
      return filePath;
    } catch (e) {
      print('Error picking image: $e');
      return null;
    }
  }

  Future<void> _showAnimalDialog([Map<String, String>? animal]) async {
    final nameController = TextEditingController(text: animal?['name'] ?? '');
    final imageController = TextEditingController(text: animal?['image'] ?? '');
    final bioController = TextEditingController(text: animal?['bio'] ?? '');
    String? selectedImagePath;

    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: backgroundBrown,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(
          animal == null ? 'Add New Animal' : 'Edit Animal',
          style: GoogleFonts.poppins(
            color: darkBrown,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(color: primaryBrown),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: primaryBrown),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: imageController,
                      decoration: InputDecoration(
                        labelText: 'Image Path',
                        labelStyle: TextStyle(color: primaryBrown),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: primaryBrown),
                        ),
                      ),
                      readOnly: true,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.image, color: primaryBrown),
                    onPressed: () async {
                      final imagePath = await _pickAndSaveImage();
                      if (imagePath != null) {
                        imageController.text = imagePath;
                        selectedImagePath = imagePath;
                      }
                    },
                  ),
                ],
              ),
              if (selectedImagePath != null || imageController.text.isNotEmpty)
                Container(
                  height: 150,
                  margin: EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    border: Border.all(color: lightBrown),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: darkBrown.withOpacity(0.1),
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image.file(
                      File(selectedImagePath ?? imageController.text),
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Center(
                          child: Text(
                            'Error loading image',
                            style: TextStyle(color: primaryBrown),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              TextField(
                controller: bioController,
                decoration: InputDecoration(
                  labelText: 'Bio',
                  labelStyle: TextStyle(color: primaryBrown),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: primaryBrown),
                  ),
                ),
                maxLines: 3,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Cancel',
              style: TextStyle(color: primaryBrown),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              final newAnimal = {
                'name': nameController.text,
                'image': imageController.text,
                'bio': bioController.text,
              };

              setState(() {
                if (animal == null) {
                  animals.add(newAnimal);
                } else {
                  final index = animals.indexWhere((a) => a['name'] == animal['name']);
                  if (index != -1) {
                    animals[index] = newAnimal;
                  }
                }
              });
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryBrown,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              animal == null ? 'Add' : 'Save',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  void _deleteAnimal(Map<String, String> animal) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete Animal'),
        content: Text('Are you sure you want to delete ${animal['name']}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                animals.removeWhere((a) => a['name'] == animal['name']);
                if (likedAnimals.any((a) => a['name'] == animal['name'])) {
                  likedAnimals.removeWhere((a) => a['name'] == animal['name']);
                  _saveLikedAnimals();
                }
              });
              Navigator.pop(context);
            },
            child: Text('Delete'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundBrown,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryBrown,
        title: Text(
          "${widget.category} Details",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite, color: Colors.white),
            onPressed: navigateToLikedAnimals,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAnimalDialog(),
        backgroundColor: accentBrown,
        child: Icon(Icons.add, color: Colors.white),
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            childAspectRatio: 0.85,
          ),
          itemCount: animals.length,
          itemBuilder: (context, index) {
            final animal = animals[index];
            bool isLiked = likedAnimals.any((a) => a['name'] == animal['name']);

            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AnimalBioPage(animal),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: darkBrown.withOpacity(0.2),
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: animal['image']!.startsWith('assets/')
                                ? AssetImage(animal['image']!)
                                : FileImage(File(animal['image']!)) as ImageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              darkBrown.withOpacity(0.7),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 12,
                        left: 12,
                        right: 12,
                        child: Text(
                          animal['name']!,
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: IconButton(
                                icon: Icon(
                                  isLiked ? Icons.favorite : Icons.favorite_border,
                                  color: isLiked ? Colors.red : Colors.white,
                                  size: 20,
                                ),
                                onPressed: () => toggleLike(animal),
                              ),
                            ),
                            SizedBox(width: 8),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: IconButton(
                                icon: Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                onPressed: () => _showAnimalDialog(animal),
                              ),
                            ),
                            SizedBox(width: 8),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                onPressed: () => _deleteAnimal(animal),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
