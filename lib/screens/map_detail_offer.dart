import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_application_6/model/variables.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';
//import 'package:geocode/geocode.dart';
//import 'package:geocoding/geocoding.dart';
//import 'package:frontend/variable.dart';





class detail_offer_map extends StatefulWidget {
  @override
  _detail_offer_mapState createState() => _detail_offer_mapState();
  final String latitude;
  final String longitude;
  detail_offer_map({this.latitude, this.longitude});
}

class _detail_offer_mapState extends State<detail_offer_map> {
  GoogleMapController mapController;
  final Set<Marker> markers = new Set();
  LatLng _center = const LatLng(36, 6);
  LatLng lastPosition;
  LatLng offer_position;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }













  
  




 @override
  void initState() {
    
    super.initState();
    double latitude = double.parse(widget.latitude);
    double logitude = double.parse(widget.longitude);
 LatLng location = new LatLng(latitude,logitude);
    _setPosition(location);
    _center=location;
  }




  




   
  



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maps View'),
        backgroundColor: Color.fromARGB(255, 73, 80, 87),
      ),
      
      body:
      
       GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
        markers: markers,
      
      ),
      
    );
  }




  Set<Marker> getmarkers() {
    //markers to place on map
    setState(() {
      markers.add(Marker(
        //add first marker
        markerId: MarkerId(_center.toString()),
        position: _center, //position of marker
        infoWindow: InfoWindow(
          //popup info
          title: 'Marker Title First ',
          snippet: 'My Custom Subtitle',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));

      markers.add(Marker(
        //add second marker
        markerId: MarkerId(_center.toString()),
        position: LatLng(35.0099116, 6.3132343), //position of marker
        infoWindow: InfoWindow(
          //popup info
          title: 'Marker Title Second ',
          snippet: 'My Custom Subtitle',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));

      //add more markers here
    });

    return markers;
  }

  _setPosition(LatLng pos) {
    lastPosition = pos;
     
    setState(() {
     
      markers.clear();
      markers.add(Marker(
        markerId: MarkerId(pos.toString()),
        position: pos, //position of marker
        infoWindow: InfoWindow(
            //popup info
            // title: 'Marker Title Second ',
            // snippet: 'My Custom Subtitle',
            ),
            
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));
     // print(pos);
     
    });
     
    // lastPosition2 = lastPosition;
   
  }




  





  
}
