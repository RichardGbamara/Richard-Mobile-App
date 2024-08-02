import 'package:flutter/material.dart';
import 'components/bottom_buttons.dart';
import 'components/carousel_images.dart';
import 'components/custom_app_bar.dart';
import 'components/house_details.dart';
import '../../model/house.dart';

class DetailsScreen extends StatefulWidget {
  final House house;

  const DetailsScreen({super.key, required this.house});

  @override
  // ignore: library_private_types_in_public_api
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  CarouselImages(widget.house.moreImagesUrl),
                  const CustomAppBar(),
                  const Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: BottomButtons(
                      phoneNumber: '233551732706', // Example, with actual number
                    ),
                  ),
                ],
              ),
            ),
            HouseDetails(widget.house),
          ],
        ),
      ),
    );
  }
}
