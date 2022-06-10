import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_application_6/model/variables.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';
//import 'package:geocode/geocode.dart';
//import 'package:geocoding/geocoding.dart';
//import 'package:frontend/variable.dart';





class Map_modify_offer extends StatefulWidget {
  @override
  _Map_modify_offerState createState() => _Map_modify_offerState();
}

class _Map_modify_offerState extends State<Map_modify_offer> {
  GoogleMapController mapController;
  final Set<Marker> markers = new Set();
  final LatLng _center = const LatLng(36, 6);
  LatLng lastPosition;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }













  bool _serviceEnabled = false;
   PermissionStatus _permissionGranted;
  LocationData _userLocation;

Future<void> _getUserLocation() async {
    Location location = Location();

    // Check if location service is enable
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    // Check if permission is granted
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    final _locationData = await location.getLocation();
    setState(() {
      //ajouter delai !!!!!!!!!
      Future.delayed(Duration(milliseconds: 10)).then((_) {
      _userLocation = _locationData;
      });
    });
  }




 @override
  void initState() {
    super.initState();
    
    if(lastPosition3!=null){
       _setPosition(LatLng(lastPosition2.latitude,lastPosition2.longitude));
      final _center=lastPosition3;
    }
  }




  




   
  



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maps View'),
        backgroundColor: Color.fromARGB(255, 73, 80, 87),
      ),
      
      body:
      Stack(children: [
       GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
        markers: markers,
        onLongPress: (LatLng pos) {
          _setPosition(pos);
        },
      ),


      Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.67, left: 20, right: 20),
        color: Color.fromARGB(68, 255, 255, 255),
        child: 
      Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
        
        Visibility(
          visible: true,
          child: 
        InkWell(
          onTap: (){

               _getUserLocation();
               if(_serviceEnabled){
                   Future.delayed(Duration(milliseconds: 10)).then((_) {
          _setPosition(LatLng(_userLocation?.latitude,_userLocation?.longitude));
                  // latitude = LatLng(_userLocation?.latitude,_userLocation?.longitude) as Double ;
                // longitude = _userLocation?.longitude as Double;
              
                   });

               }
          },
          
          child:
      Container(
        padding: EdgeInsets.all(15),
        width: 171,
          decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
        color: Colors.blueAccent,
          ),
       // margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.67, left: 20 , right: 20),
        child:
          Row(children: [
            Text("Current location", style: TextStyle(color: Colors.white),),
            SizedBox(width: 10,),
            Icon(Icons.gps_fixed)
          ],)
      
      )
        ),
      ),
      SizedBox(height: 20,),
      Visibility(
        visible: lastPosition!=null,
        child: 
       FloatingActionButton(onPressed: (){
       
       //
      // _getUserLocation();
     
     
      //print(_userLocation?.latitude);
      //print(_userLocation?.longitude);

       
     // _userLocation2 = _userLocation;
      
      //   print(_serviceEnabled);
      
      //  print(lastPosition);
         get_adresse(lastPosition.latitude, lastPosition.longitude);
          lastPosition2 = lastPosition;
         Navigator.pop(context);
      },
      child: Icon(Icons.done),
      ),
      )
      ],)
      )
      ],)
    
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
            title: 'Marker Title Second ',
            snippet: 'My Custom Subtitle',
            ),
            
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));
     // print(pos);
     

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
    });
     
    // lastPosition2 = lastPosition;
    print(lastPosition2.latitude);
  }




  





  
}
