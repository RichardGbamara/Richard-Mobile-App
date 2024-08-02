// ignore_for_file: library_private_types_in_public_api, unused_import

import 'package:flutter/material.dart';
import 'components/bottom_buttons.dart';
import 'components/categories.dart';
import 'components/custom_app_bar.dart';
import 'components/houses.dart'; // Ensure this is imported
import '../../constants/constants.dart';
import '../maps/ghana_properties_map.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = 'All';

  void _handleCategorySelected(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  void _navigateToMap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const GhanaPropertiesMap(), // Your map screen
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(),
          Categories(onCategorySelected: _handleCategorySelected),
          Expanded(
            child: Houses(category: selectedCategory),
          ),
          BottomButtons(onMapViewPressed: _navigateToMap), // Updated
        ],
      ),
    );
  }
}
