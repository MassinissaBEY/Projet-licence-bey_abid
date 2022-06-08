

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_6/model/api.dart';
import 'package:flutter_application_6/screens/espace_client/offer_detail.dart';
import 'package:flutter_application_6/screens/espace_client/switching_page.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:location/location.dart';
import 'package:url_launcher/url_launcher.dart';






class all_offers_map extends StatefulWidget {
  @override
  _all_offers_mapState createState() => _all_offers_mapState();
  final offers;
  all_offers_map({this.offers});
}

class _all_offers_mapState extends State<all_offers_map> {
  GoogleMapController mapController;
  final Set<Marker> markers = new Set();
  final LatLng _center = const LatLng(36, 6);
  LatLng lastPosition;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }










      var offer;
      String number2;

  bool _serviceEnabled = false;
   PermissionStatus _permissionGranted;
   LocationData _userLocation;
   var _offers = [];

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
    _getUserLocation();
   getmarkers();
   _loadOffers();
  //  _setPosition(LatLng(null,null));
  
    print(_offers);
     
  }




  




   
  

int id;

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
          
        },
      ),
      Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[  
              InkWell(
                onTap: (){
                   Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              switching_page()
                                              
                                              ));
                },
                child:
              Container(
              margin: EdgeInsets.only(top:10),
              width: 105,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          
          color: Color.fromARGB(197, 54, 119, 231),),
              
              child: 
            Row(children: [
              Icon(Icons.map,color: Colors.white,),
              SizedBox(width: 5,),
              Text("View list",style: TextStyle(color: Colors.white),)
            ],),)
              )
            ],)

      ],)


    
    );
  }




  Set<Marker> getmarkers() {
    //markers to place on map
    setState(() {
      
     Marker(
  markerId: MarkerId("id"), // a string for marker unique id
  icon: BitmapDescriptor.defaultMarker, // options for hues and custom imgs
  position: LatLng(36.2430738, 6.5645261), // lat and long doubles

  onTap: () {
    //this is what you're looking for!
  }

);


      //add more markers here
    });

    return markers;
  }

  _setPosition(LatLng pos, int index) {
    lastPosition = pos;
  
    setState(() {
     build(ctx)=>Container(
       height: 40,
       width: 40,
       color: Colors.green,);
      //markers.clear();
      markers.add(Marker(
        onTap: () {
          _loadOfferDetails(widget.offers[index]['id'].toString());
          print(widget.offers[index]['id']);
          
          showModalBottomSheet(
          shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(10),
        ),
      ),
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return 
       
         Container(
           height: 500,
            margin: EdgeInsets.only(top: 40,left: 0,right: 0),
            child:
            Column(
              
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
          Container(
            margin: EdgeInsets.only(left: 20,right: 20),
            child:Text(widget.offers[index]['title'].toString(), style: TextStyle(fontSize: 32),)),

            SizedBox(height: 10,),

        Container(
            margin: EdgeInsets.only(left: 20,right: 20),
        child:  Row(children: [ Text(widget.offers[index]['category']['Name'].toString(), style: TextStyle(fontSize: 20,)),      
           SizedBox(width: 10,),
            Text("A vendre"),
             ],),

        ),

        
            SizedBox(height: 10,),
        
        Container(
            margin: EdgeInsets.only(left: 20,right: 20),child:  Text(widget.offers[index]['price'].toString(), style: TextStyle(fontSize: 20,color: Colors.greenAccent))),
        
            SizedBox(height: 15,),
        
     Container(
            margin: EdgeInsets.only(left: 20,right: 20),
            child:
             Text(widget.offers[index]['user']['name'].toString(), style: TextStyle(fontSize: 20,))),

             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [ TextButton(
                 onPressed: (() {
                   print("HI");
                    Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      OfferDetailsView(offer_id:widget.offers[index]['id'])));
                 }),
                 child: Text("voir plus de details", style: TextStyle(fontSize: 12,)),) ]),
                
               offer==null? Container()
               :offer['images'].isEmpty ? Expanded(child:  Container(child: Center(child: Text("L'offre ne contient pas des images")),))

               :Expanded(child:  ListView.builder(
                 scrollDirection: Axis.horizontal,
                  itemBuilder: images,
                    // itemCount:widget.offers[index]['images'].length,
                     itemCount:offer['images'].length,
                    //comments.length,
                            padding: const EdgeInsets.only(
                              top: 0,
                              left: 8,
                              right: 8,
                            ),
                      
                      
                            )),

                           
                                Container(
                height: 70,
        padding: EdgeInsets.only(bottom: 10,top: 10),
        decoration: BoxDecoration(
          color: Colors.white, 
            boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 2,
        blurRadius: 2,
        offset: Offset(0, 3), // changes position of shadow
      ),
    ],
        ),

        child: 
        Row(children: [
         
          SizedBox(width: 10,),

        Expanded(child: 


        InkWell(
          onTap: () async{
            _callNumber();
            const url = 'tel:';
    if( await canLaunch(url)){
      await launch(url+'0'+number2);
    }else{
      throw 'Could not launch $url';
    }
          },
          child:
        Container(
          height: 40,
          
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue,),
          child: Row(children: [
           Expanded(child:  SizedBox(),),
            Icon(Icons.phone,color: Colors.white,),
            SizedBox(width: 10,),
            Text("Telephone",style:  TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
          Expanded(child:  SizedBox(),)
          ],),
        )),
        ),

           SizedBox(width: 10,),



          Expanded(child: 
          InkWell(
            onTap: ()  async {
    final Uri _emailurl = Uri(
scheme: 'mailto',
path: offer['user']['email'],
query: 
    'subject=A propos de l\'offre '.replaceAll(" ", "%20")+offer['title']
);

  
      if( await canLaunch(_emailurl.toString())){
      await launch(_emailurl.toString());
    }else{
      throw 'Could not launch $_emailurl';
    }


              },
            child: 

            
          Container(
            
           decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(10),
            color: Colors.greenAccent),
            height: 40,
          child: Row(children: [
            Expanded(child:  SizedBox(),),
            Icon(Icons.email,color: Colors.white,),
            SizedBox(width: 10,),
            Text("Email",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
           Expanded(child:  SizedBox(),)
          ],),
        )),
          ),
          SizedBox(width: 10,),

      ],),),
                            
                             
              ])                
            
            );}
            );
        },
        markerId: MarkerId(pos.toString()),
        position: pos, //position of marker
        infoWindow: InfoWindow(
            //popup info
            // title: 'Marker Title Second ',
            // snippet: 'My Custom Subtitle',
            ),
         
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));
     
     
    });
     
    
   
  }




  
_loadOffers()  {

 

        //   double latitude = double.parse( _offers[35]['latitude']);
        //   double logitude = double.parse( _offers[35]['logitude']);
        //   LatLng location = new LatLng(latitude,logitude);
        // _setPosition(location);
      
     
      
    
            for(int i=0; i<widget.offers.length; i++){
             if(widget.offers[i]['latitude']!=null){
               print(widget.offers[i]['longitude']);
          double latitude = widget.offers[i]['latitude'];
          double longitude = widget.offers[i]['longitude'];
        _setPosition(LatLng(latitude, longitude),i);
               
             }
            }


        
           // _setPosition(LatLng(latitude,logitude));
 
      

  }

    






  Widget images (BuildContext context, int index) {
   return 
   
       
        Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        //     border: Border.all(color: Color.fromARGB(255, 2, 62, 138),)
        ),
          //ClipRRect for image border radius
          margin: EdgeInsets.all(10),
          width: 200,
          height: 200,
          child:
          
             Image.network(Api().getOfferImageUrl(offer['images'][index]['id']),
            
            fit: BoxFit.cover,
            ),
          );
   }





  _loadOfferDetails(String id ) async {
     
    var response = await Api().getData('/offer/' + id);
    if (response.statusCode == 200) {
      setState(() {
        offer = json.decode(response.body);
           
           
        
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
            'Error ' + response.statusCode.toString() + ': ' + response.body),
      ));
    }

        
        number2 = offer['user']['Phone'].toString();
       
     
      setState(() {});
    
   
  
  }




 _callNumber() async{
  //const number =  number2.toString(); //set the number here
  bool res = await FlutterPhoneDirectCaller.callNumber('0'+number2.toString());
}

  
  
}
