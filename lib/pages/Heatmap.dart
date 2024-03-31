import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shieldy/resources/firestore_methods.dart';
import 'package:shieldy/utils/colors.dart';
import 'package:geolocator/geolocator.dart';

class Heatmap extends StatefulWidget {
  final LatLng? initialPosition;
  final bool isSpecificPostLocation;

  const Heatmap({
    Key? key,
    this.initialPosition,
    this.isSpecificPostLocation = false,
  }) : super(key: key);

  @override
  _HeatmapState createState() => _HeatmapState();
}

class _HeatmapState extends State<Heatmap> {
  Set<Marker> _markers = {};
  late GoogleMapController mapController;
  late LatLng _initialPosition;
  Marker? _specificPostMarker;

  @override
  void initState() {
    super.initState();
    _initialPosition = widget.initialPosition ?? const LatLng(6.899764025046091, 79.85366283963823);
    _getUserLocation();

    if (widget.isSpecificPostLocation == true) {
      _specificPostMarker = Marker(
        markerId: const MarkerId('specificPostLocation'),
        position: _initialPosition,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      );
    } else {
      _fetchPostLocations();
    }
  }


  //get user location
    Future<void> _getUserLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    final position = await Geolocator.getCurrentPosition();
    setState(() {
      _initialPosition = LatLng(position.latitude, position.longitude);
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            mobileBackgroundColor, // Ensure this color is defined or use a Color value directly
        centerTitle: false,
        title: Image.asset(
          'images/logo1.png',
          width: 100,
          height: 50,
          fit: BoxFit.contain,
        ),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _initialPosition,
          zoom: 14.4746,
        ),
        markers: Set.from(_markers)
          ..addAll(_specificPostMarker != null ? [_specificPostMarker!] : []),
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  //fetch post locations from firestore and set the markers
  void _fetchPostLocations() async {
    final postLocations = await FirestoreMethods().getAllPostLocations();
    final newMarkers = <Marker>{};

    for (final location in postLocations) {
      final marker = Marker(
        markerId: MarkerId(location.toString()),
        position: location,
        infoWindow: const InfoWindow(title: 'Post Location'),
      );
      newMarkers.add(marker);
    }

    setState(() {
      _markers = newMarkers;
    });
  }
}