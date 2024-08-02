import 'package:real_estate_app/model/house.dart';

final _house1 = House(
    imageUrl: 'assets/images/house1.jpeg',
    address: 'East Legon, Accra, Ghana',
    description: 'Lorem Ipsum is simply dummy text...',
    price: 200.00,
    bedRooms: 4,
    bathRooms: 2,
    garages: 2,
    sqFeet: 1.416,
    time: 20,
    isFav: false,
    moreImagesUrl: [
      'assets/images/house1.jpeg',
      'assets/images/indoor1.jpg',
      'assets/images/indoor2.jpg',
      'assets/images/indoor3.jpg',
      'assets/images/indoor4.jpg',
      'assets/images/indoor5.jpg',
    ],
    saleStatus: 'For Sale',
    latitude: 5.6404, // Fictional coordinates for East Legon
    longitude: -0.1533);

final _house2 = House(
    imageUrl: 'assets/images/house2.jpeg',
    address: 'Adenta, Accra, Ghana',
    description: 'Lorem Ipsum is simply dummy text...',
    price: 140.00,
    bedRooms: 4,
    bathRooms: 2,
    garages: 1,
    sqFeet: 1.416,
    time: 30,
    isFav: false,
    moreImagesUrl: [
      'assets/images/house2.jpeg',
      'assets/images/indoor1.jpg',
      'assets/images/indoor2.jpg',
      'assets/images/indoor3.jpg',
      'assets/images/indoor4.jpg',
      'assets/images/indoor5.jpg',
    ],
    saleStatus: 'For Rent',
    latitude: 5.7088, // Fictional coordinates for Adenta
    longitude: -0.1824);

final _house3 = House(
    imageUrl: 'assets/images/house3.jpeg',
    address: 'Tema, Ghana',
    description: 'Lorem Ipsum is simply dummy text...',
    price: 210.00,
    bedRooms: 5,
    bathRooms: 3,
    garages: 1,
    sqFeet: 1.700,
    time: 30,
    isFav: false,
    moreImagesUrl: [
      'assets/images/house3.jpeg',
      'assets/images/indoor1.jpg',
      'assets/images/indoor2.jpg',
      'assets/images/indoor3.jpg',
      'assets/images/indoor4.jpg',
      'assets/images/indoor5.jpg',
    ],
    saleStatus: 'For Sale',
    latitude: 5.6674, // Fictional coordinates for Tema
    longitude: -0.0166);

final _house4 = House(
    imageUrl: 'assets/images/house4.png',
    address: 'Kumasi, Ghana',
    description: 'Lorem Ipsum is simply dummy text...',
    price: 170.00,
    bedRooms: 2,
    bathRooms: 1,
    garages: 1,
    sqFeet: 1.210,
    time: 30,
    isFav: false,
    moreImagesUrl: [
      'assets/images/house4.png',
      'assets/images/indoor1.jpg',
      'assets/images/indoor2.jpg',
      'assets/images/indoor3.jpg',
      'assets/images/indoor4.jpg',
      'assets/images/indoor5.jpg',
    ],
    saleStatus: 'For Rent',
    latitude: 6.6885, // Fictional coordinates for Kumasi
    longitude: -1.6244);

final _house5 = House(
    imageUrl: 'assets/images/house5.jpeg',
    address: 'Takoradi, Ghana',
    description: 'Lorem Ipsum is simply dummy text...',
    price: 150.00,
    bedRooms: 3,
    bathRooms: 1,
    garages: 1,
    sqFeet: 1.42,
    time: 240,
    isFav: false,
    moreImagesUrl: [
      'assets/images/house5.jpeg',
      'assets/images/indoor1.jpg',
      'assets/images/indoor2.jpg',
      'assets/images/indoor3.jpg',
      'assets/images/indoor4.jpg',
      'assets/images/indoor5.jpg',
    ],
    saleStatus: 'For Sale',
    latitude: 4.8845, // Fictional coordinates for Takoradi
    longitude: -1.7554);

final List<House> houseList = [
  _house1,
  _house2,
  _house3,
  _house4,
  _house5,
];

List<String> categoryList = ['For Sale', 'For Rent'];
