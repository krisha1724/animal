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


Introduction
Welcome to Animal Biography, a beautifully crafted Flutter application that brings the animal kingdom to your fingertips. Designed for learners, explorers, and nature lovers of all ages, this app offers a rich and immersive experience to discover and learn about animals from around the world.

With categorized sections, stunning visuals, and educational content, Wildopedia makes learning about animals not just informative—but fun and engaging. Whether you're curious about the graceful flight of birds, the mysterious depths of aquatic life, or the unique behaviors of mammals and reptiles, this app provides everything in a clean, modern, and interactive package. The design uses a consistent warm brown color theme for a clean and natural look.
Key Features
 1. Animal Categories
●	Birds: Discover a wide variety of bird species with rich descriptions.

●	Fish: Dive into the underwater world and learn about unique fish types.

●	Mammals: Explore land mammals from all corners of the globe.

●	Reptiles: Uncover the mysterious and diverse realm of reptiles.

2. Animal Details
●	High-Resolution Images: Stunning visuals to help users connect with each animal.

●	In-Depth Biographies: Insightful details on each animal’s behavior, habitat, and traits.

●	Interactive Experience: Engaging animations and smooth transitions for a fluid experience.

●	Favorites: Easily save and revisit your favorite animals with one tap.

 3. User Interface
●	Modern Aesthetic: Minimalistic, nature-themed design for a visually pleasing experience.

●	Responsive Design: Optimized layouts for phones and tablets of all screen sizes.

●	Seamless Navigation: Effortless browsing between categories and animal profiles.
UI Components Overview
●	Dynamic AppBar: Features a collapsible AppBar with Hero animations for seamless image transitions, enhancing visual appeal during navigation.

●	Modern Card Layout: Uses elegant and intuitive card-based design for displaying animal details, creating a clean and organized user interface.

●	Smooth Animations: Implements fluid and engaging transitions between screens for a polished user experience.

●	Responsive Grid System: Adapts effortlessly to various screen sizes and orientations, ensuring a consistent and user-friendly layout across all devices.
Data Management
●	Local Persistence: Utilizes SharedPreferences to store and retrieve favorite animals, ensuring quick access and offline availability.

●	Optimized Asset Handling: Efficiently organizes and loads a large library of animal images, minimizing memory usage and enhancing performance.

●	State Retention: Preserves user preferences and app state across sessions for a seamless and personalized experience.
Dependencies
●	cupertino_icons: ^1.0.8
 Provides beautiful iOS-style icons for a consistent cross-platform UI.

●	shared_preferences: ^2.5.2
 Enables lightweight local storage to persist user settings and favorite animals.

●	google_fonts: ^6.1.0
 Allows the use of custom fonts to enhance the app's typography and design.

●	image_picker: ^1.0.7
 Facilitates selecting images from the device’s gallery or camera for animal profiles.

●	path_provider: ^2.1.2
 Grants access to commonly used file system directories for storing image data.

●	path: ^1.8.3
 Offers utilities for manipulating file and directory paths seamlessly.
