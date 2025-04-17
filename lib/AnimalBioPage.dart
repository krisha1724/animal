import 'package:flutter/material.dart';
import 'package:animal/theme/app_theme.dart';
import 'dart:io';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class AnimalBioPage extends StatefulWidget {
  final Map<String, String> animal;

  AnimalBioPage(this.animal);

  @override
  _AnimalBioPageState createState() => _AnimalBioPageState();
}

class _AnimalBioPageState extends State<AnimalBioPage> {
  bool isLiked = false;
  List<Map<String, String>> likedAnimals = [];

  @override
  void initState() {
    super.initState();
    _loadLikedAnimals();
  }

  Future<void> _loadLikedAnimals() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? likedData = prefs.getString('liked_animals');
    if (likedData != null) {
      setState(() {
        likedAnimals = List<Map<String, String>>.from(jsonDecode(likedData));
        isLiked = likedAnimals.any((a) => a['name'] == widget.animal['name']);
      });
    }
  }

  Future<void> _toggleLike() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      if (isLiked) {
        likedAnimals.removeWhere((a) => a['name'] == widget.animal['name']);
      } else {
        likedAnimals.add(widget.animal);
      }
      isLiked = !isLiked;
    });
    await prefs.setString('liked_animals', jsonEncode(likedAnimals));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundBrown,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 350,
            pinned: true,
            backgroundColor: AppTheme.primaryBrown,
            actions: [
              IconButton(
                icon: Icon(
                  isLiked ? Icons.favorite : Icons.favorite_border,
                  color: isLiked ? Colors.red : Colors.white,
                ),
                onPressed: _toggleLike,
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Hero(
                    tag: 'animal_${widget.animal['name']}',
                    child: widget.animal['image']!.startsWith('assets/')
                        ? Image.asset(
                            widget.animal['image']!,
                            fit: BoxFit.cover,
                          )
                        : Image.file(
                            File(widget.animal['image']!),
                            fit: BoxFit.cover,
                          ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.7),
                        ],
                        stops: [0.5, 1.0],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 16,
                    left: 16,
                    right: 16,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.3),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.pets,
                            color: Colors.white,
                            size: 20,
                          ),
                          SizedBox(width: 8),
                          Text(
                            widget.animal['name']!,
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: Offset(0, -5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: AppTheme.primaryBrown.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: AppTheme.primaryBrown.withOpacity(0.3),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.info_outline,
                                    color: AppTheme.primaryBrown,
                                    size: 20,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    "Animal Information",
                                    style: GoogleFonts.poppins(
                                      color: AppTheme.primaryBrown,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 24),
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppTheme.backgroundBrown.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: AppTheme.primaryBrown.withOpacity(0.1),
                            ),
                          ),
                          child: Text(
                            widget.animal['bio']!,
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              height: 1.6,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        backgroundColor: AppTheme.accentBrown,
        child: Icon(Icons.arrow_back, color: Colors.white),
        elevation: 4,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}

class LikedAnimalsPage extends StatelessWidget {
  final List<Map<String, String>> likedAnimals;

  LikedAnimalsPage({required this.likedAnimals});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundBrown,
      appBar: AppBar(
        title: Text(
          "My Favorites",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        backgroundColor: AppTheme.primaryBrown,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.favorite, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: likedAnimals.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppTheme.primaryBrown.withOpacity(0.2),
                          blurRadius: 20,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.favorite_border,
                      size: 64,
                      color: AppTheme.primaryBrown,
                    ),
                  ),
                  SizedBox(height: 24),
                  Text(
                    "No favorites yet!",
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.darkBrown,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Start exploring animals and add them to your favorites",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primaryBrown,
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 4,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.explore, color: Colors.white),
                        SizedBox(width: 8),
                        Text(
                          "Explore Animals",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          : Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppTheme.backgroundBrown,
                    Colors.white,
                  ],
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "You have ${likedAnimals.length} favorite${likedAnimals.length == 1 ? '' : 's'}",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: AppTheme.darkBrown,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      itemCount: likedAnimals.length,
                      itemBuilder: (context, index) {
                        final animal = likedAnimals[index];
                        return Container(
                          margin: EdgeInsets.only(bottom: 16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AnimalBioPage(animal),
                                  ),
                                );
                              },
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                height: 160,
                                child: Row(
                                  children: [
                                    Container(
                                      width: 140,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          bottomLeft: Radius.circular(20),
                                        ),
                                        image: DecorationImage(
                                          image: AssetImage(animal['image']!),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    animal['name']!,
                                                    style: GoogleFonts.poppins(
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.bold,
                                                      color: AppTheme.darkBrown,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.all(8),
                                                  decoration: BoxDecoration(
                                                    color: AppTheme.primaryBrown.withOpacity(0.1),
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Icon(
                                                    Icons.favorite,
                                                    color: AppTheme.primaryBrown,
                                                    size: 20,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 8),
                                            Text(
                                              animal['bio']!,
                                              style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                color: Colors.black54,
                                                height: 1.4,
                                              ),
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

