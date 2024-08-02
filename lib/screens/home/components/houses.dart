// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import '../../../constants/constants.dart';
import '../../../data/data.dart';
import '../../../model/house.dart';
import '../../details/details_screen.dart';

class Houses extends StatefulWidget {
  final String category; // This can be "For Sale", "For Rent", or "All"

  const Houses({super.key, required this.category});

  @override
  _HousesState createState() => _HousesState();
}

class _HousesState extends State<Houses> {
  List<House> filteredHouses = [];

  @override
  void initState() {
    super.initState();
    filterHouses();
  }

  @override
  void didUpdateWidget(covariant Houses oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.category != widget.category) {
      filterHouses();
    }
  }

  void filterHouses() {
    if (widget.category == "All") {
      // Display all houses if the category is 'All'
      filteredHouses = houseList;
    } else {
      // Apply filter based on the category
      filteredHouses = houseList.where((house) {
        return house.saleStatus == widget.category;
      }).toList();
    }
    setState(() {});
  }

  Widget _buildHouse(BuildContext context, int index) {
    House house = filteredHouses[index];
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailsScreen(house: house),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: appPadding, vertical: appPadding / 2),
        child: SizedBox(
          height: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image(
                      height: 180,
                      width: size.width,
                      fit: BoxFit.cover,
                      image: AssetImage(house.imageUrl),
                    ),
                  ),
                  Positioned(
                    right: appPadding / 2,
                    top: appPadding / 2,
                    child: Container(
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(15)),
                      child: IconButton(
                        icon: Icon(
                          house.isFav
                              ? Icons.favorite_rounded
                              : Icons.favorite_border_rounded,
                          color: house.isFav ? red : black,
                        ),
                        onPressed: () {
                          setState(() {
                            house.isFav = !house.isFav;
                          });
                        },
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    '\$${house.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      house.address,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 15, color: black.withOpacity(0.4)),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text('${house.bedRooms} bedrooms / ',
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w600)),
                  Text('${house.bathRooms} bathrooms / ',
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w600)),
                  Text('${house.sqFeet} sqft',
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w600)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: filteredHouses.length,
        itemBuilder: (context, index) {
          return _buildHouse(context, index);
        },
      ),
    );
  }
}
