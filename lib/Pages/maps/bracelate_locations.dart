import 'dart:async';
import 'package:beyondant_new_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BracelateLocationScreen extends StatefulWidget {
  const BracelateLocationScreen({Key? key}) : super(key: key);

  @override
  _BracelateLocationScreenState createState() =>
      _BracelateLocationScreenState();
}

class _BracelateLocationScreenState extends State<BracelateLocationScreen> {
  BitmapDescriptor? markerIcon;
  final Completer<GoogleMapController> _controller = Completer();

  final Set<Marker> _markers = {};

  static const LatLng _center = LatLng(45.521563, -122.677433);
  final MapType _currentMapType = MapType.normal;

  void setCustomMapPin() async {
    markerIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(devicePixelRatio: 2.5),
      'assets/images/pin.png',
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
    setState(() {
      intilize();
    });
  }

  intilize() async {
    Marker first = Marker(
      markerId: const MarkerId('User 1'),
      position: const LatLng(45.601670, -122.677540),
      draggable: true,
      infoWindow: const InfoWindow(
        title: 'Bracelate 1',
        // snippet: "Lat 37.3797536 - Lng -122.1017334",
      ),
      icon: markerIcon!,
    );

    Marker second = Marker(
      markerId: const MarkerId('User 2'),
      position: const LatLng(45.521775, -122.687650),
      draggable: true,
      infoWindow: const InfoWindow(
        title: 'Bracelate 2',
      ),
      icon: markerIcon!,
    );

    Marker third = Marker(
      markerId: const MarkerId('User 3'),
      position: const LatLng(45.451880, -122.707860),
      draggable: true,
      infoWindow: const InfoWindow(
        title: 'Bracelate 3',
      ),
      icon: markerIcon!,
    );

    _markers.add(first);
    _markers.add(second);
    _markers.add(third);
  }

  @override
  void initState() {
    setCustomMapPin();
    super.initState();
  }

  LatLng _lastMapPosition = _center;

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: const CameraPosition(
              target: _center,
              zoom: 11.0,
            ),
            mapType: _currentMapType,
            markers: _markers,
            onCameraMove: _onCameraMove,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              boxShadow: [
                // color: Colors.white, //background color of box
                BoxShadow(
                  color: AppColors.primaryColor.withOpacity(0.3),
                  blurRadius: 90.0, // soften the shadow
                  spreadRadius: 250.0, //extend the shadow
                  // offset: Offset(
                  //   300.0, // Move to right 10  horizontally
                  //   300.0, // Move to bottom 10 Vertically
                  // ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10, top: 30),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                size: 25,
                color: Colors.black,
              ),
            ),
          ),
          // Padding(
          //   padding:
          //       const EdgeInsets.symmetric(horizontal: 30.0, vertical: 80.0),
          //   child: TextFormField(
          //     // maxLength: 8,
          //     textAlignVertical: TextAlignVertical.center,
          //     decoration: InputDecoration(
          //       // contentPadding: const EdgeInsets.all(10.0),
          //       border: OutlineInputBorder(
          //         borderSide: const BorderSide(color: Colors.black),
          //         borderRadius: BorderRadius.circular(30.0),
          //       ),
          //       focusedBorder: OutlineInputBorder(
          //         borderSide: const BorderSide(color: Colors.transparent),
          //         borderRadius: BorderRadius.circular(30.0),
          //       ),
          //       filled: true,
          //       fillColor: Colors.white,
          //       hintText: 'Search Location',
          //       hintStyle: const TextStyle(color: Colors.black),
          //       // prefixIcon: Padding(
          //       //   padding: const EdgeInsets.only(left: 15),
          //       //   child: widget.prefixIcon,
          //       // ),
          //       prefixText: '  ',
          //       suffixIcon: Padding(
          //         padding: const EdgeInsets.only(right: 15.0),
          //         child: Icon(
          //           Icons.search,
          //           color: AppColors.primaryColor,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  boxShadow: [
                    // color: Colors.white, //background color of box
                    BoxShadow(
                      color: AppColors.primaryColor.withOpacity(0.3),
                      blurRadius: 90.0, // soften the shadow
                      spreadRadius: 250.0, //extend the shadow
                      // offset: Offset(
                      //   300.0, // Move to right 10  horizontally
                      //   300.0, // Move to bottom 10 Vertically
                      // ),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
