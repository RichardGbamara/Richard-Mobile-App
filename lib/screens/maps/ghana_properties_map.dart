import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../data/data.dart';
import '../../model/house.dart'; // Adjust the import path as necessary

class GhanaPropertiesMap extends StatefulWidget {
  const GhanaPropertiesMap({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _GhanaPropertiesMapState createState() => _GhanaPropertiesMapState();
}

class _GhanaPropertiesMapState extends State<GhanaPropertiesMap> {
  final CameraPosition _initialPosition = const CameraPosition(
    target: LatLng(5.6037, -0.1870), // Central location in Ghana (Accra)
    zoom: 10.0,
  );

  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _addMarkers();
  }

  void _addMarkers() {
    for (House house in houseList) {
      // Assuming houseList is globally accessible
      _markers.add(
        Marker(
          markerId: MarkerId(house.address),
          position: LatLng(house.latitude, house.longitude),
          infoWindow: InfoWindow(
            title: house.address,
            snippet: 'Price: \$${house.price}',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Properties Map'),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _initialPosition,
        markers: _markers,
      ),
    );
  }
}
