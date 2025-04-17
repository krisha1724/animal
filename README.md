# Animal Biography App

A beautiful and educational Flutter application that provides detailed information about various animals across different categories. This app is designed to help users learn about animals in an engaging and interactive way.

## Features

### 1. Animal Categories
- **Birds**: Explore various bird species with detailed information
- **Fish**: Discover different types of fish and their characteristics
- **Mammals**: Learn about mammals from around the world
- **Reptiles**: Explore the fascinating world of reptiles

### 2. Animal Details
- **High-Quality Images**: Each animal has a beautiful, high-resolution image
- **Detailed Biographies**: Comprehensive information about each animal's characteristics, habitat, and behavior
- **Interactive UI**: Smooth transitions and animations for a better user experience
- **Favorite System**: Save your favorite animals for quick access

### 3. User Interface
- **Modern Design**: Clean and intuitive interface with a nature-inspired color scheme
- **Responsive Layout**: Works seamlessly across different device sizes
- **Smooth Navigation**: Easy-to-use navigation between categories and animal details
- **Visual Feedback**: Interactive elements with appropriate visual feedback

## Technical Details

### Architecture
- Built with Flutter SDK ^3.6.2
- Uses Material Design components
- Follows a clean architecture pattern with separate UI and data layers
- Implements state management for handling user interactions

### UI Components
- **Custom AppBar**: Collapsible app bar with hero image transitions
- **Card-Based Layout**: Modern card design for animal listings
- **Custom Animations**: Smooth transitions between screens
- **Responsive Grid**: Adapts to different screen sizes

### Data Management
- **Local Storage**: Uses SharedPreferences for storing favorite animals
- **Asset Management**: Efficiently manages a large collection of animal images
- **State Persistence**: Maintains user preferences across app sessions

## Dependencies

- `cupertino_icons: ^1.0.8` - For iOS style icons
- `shared_preferences: ^2.5.2` - For local data storage
- `google_fonts: ^6.1.0` - For custom typography
- `image_picker: ^1.0.7` - For handling images
- `path_provider: ^2.1.2` - For file system access
- `path: ^1.8.3` - For path manipulation

## Getting Started

### Prerequisites
- Flutter SDK (version 3.6.2 or higher)
- Dart SDK (version 3.0.0 or higher)
- Android Studio / VS Code with Flutter extensions

### Installation
1. Clone this repository
   ```
   git clone https://github.com/yourusername/animal-biography.git
   ```
2. Navigate to the project directory
   ```
   cd animal-biography
   ```
3. Install dependencies
   ```
   flutter pub get
   ```
4. Run the app
   ```
   flutter run
   ```

## Project Structure

```
lib/
├── main.dart                 # Application entry point
├── AnimalBioPage.dart        # Detailed animal information page
├── AnimalDetailPage.dart     # Category-specific animal listing page
├── CategoryPage.dart         # Main category selection page
├── page.dart                 # Category-specific data
└── theme/
    └── app_theme.dart        # App-wide theme configuration

assets/
└── images/                   # Animal images and app assets
```

## Usage Guide

### Browsing Animals
1. Launch the app and select a category (Birds, Fish, Mammals, or Reptiles)
2. Browse through the animal cards in the selected category
3. Tap on an animal card to view detailed information

### Managing Favorites
1. Open any animal's detailed page
2. Tap the heart icon in the app bar to add/remove from favorites
3. Access all your favorite animals from the favorites page

### Navigation
- Use the back button to return to the previous screen
- The floating action button provides quick navigation
- Swipe gestures are supported for smooth navigation

## Design Philosophy

The app follows a nature-inspired design language with:
- Earthy color palette (browns and greens)
- Organic shapes and rounded corners
- Smooth transitions and animations
- High-quality imagery
- Clear typography for readability

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

- All animal images are sourced from public domain or licensed sources
- Special thanks to the Flutter community for their excellent documentation and packages
- Inspired by the need for accessible animal education
