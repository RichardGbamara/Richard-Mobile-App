class House {
  String imageUrl;
  String address;
  String description;
  double price;
  int bedRooms;
  int bathRooms;
  double sqFeet;
  int garages;
  int time;
  List<String> moreImagesUrl;
  bool isFav;
  String saleStatus; // "For Sale" or "For Rent"
  double latitude; // Latitude for the property location
  double longitude; // Longitude for the property location

  House({
    required this.imageUrl,
    required this.address,
    required this.description,
    required this.price,
    required this.bedRooms,
    required this.bathRooms,
    required this.sqFeet,
    required this.garages,
    required this.time,
    required this.moreImagesUrl,
    this.isFav = false,
    required this.saleStatus,
    required this.latitude, // Added latitude
    required this.longitude, // Added longitude
  });
}
