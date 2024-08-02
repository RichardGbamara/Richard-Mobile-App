import 'package:flutter/material.dart';
import '../../../constants/constants.dart';

class BottomButtons extends StatelessWidget {
  final Function onMapViewPressed; // Callback for handling navigation

  const BottomButtons({super.key, required this.onMapViewPressed});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(bottom: appPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Your existing buttons...
          
          // Map view button
          InkWell(
            onTap: () => onMapViewPressed(), // Use the passed callback
            child: Container(
              width: size.width * 0.4,
              height: 60,
              decoration: BoxDecoration(
                color: darkBlue,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: darkBlue.withOpacity(0.6),
                    offset: const Offset(0, 10),
                    blurRadius: 10
                  )
                ]
              ),
              child: const Center(
                child: Text(
                  'Map View',
                  style: TextStyle(
                    color: white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
