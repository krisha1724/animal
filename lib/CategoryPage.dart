// Category Page
import 'package:flutter/material.dart';
import 'package:animal/page.dart';
import 'package:animal/theme/app_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryPage extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {
      'title': 'Birds',
      'icon': Icons.flutter_dash,
      'page': BirdsPage(),
      'color': AppTheme.primaryBrown,
    },
    {
      'title': 'Fish',
      'icon': Icons.water,
      'page': FishPage(),
      'color': AppTheme.lightBrown,
    },
    {
      'title': 'Mammals',
      'icon': Icons.pets,
      'page': MammalsPage(),
      'color': AppTheme.accentBrown,
    },
    {
      'title': 'Reptiles',
      'icon': Icons.pest_control,
      'page': ReptilesPage(),
      'color': AppTheme.darkBrown,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundBrown,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppTheme.primaryBrown,
        title: Text(
          'Animal Biography',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/lp bg2.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.2),
              BlendMode.darken,
            ),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Explore Animal Categories',
                style: AppTheme.headingStyle.copyWith(
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      color: Colors.black.withOpacity(0.3),
                      offset: Offset(0, 2),
                      blurRadius: 4,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 1.1,
                  ),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => category['page'],
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: category['color'].withOpacity(0.3),
                              blurRadius: 8,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: category['color'].withOpacity(0.1),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                category['icon'],
                                size: 40,
                                color: category['color'],
                              ),
                            ),
                            SizedBox(height: 12),
                            Text(
                              category['title'],
                              style: AppTheme.subheadingStyle.copyWith(
                                color: category['color'],
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Explore →',
                              style: GoogleFonts.poppins(
                                color: category['color'].withOpacity(0.7),
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}