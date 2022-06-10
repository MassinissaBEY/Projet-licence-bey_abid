
 //int var_index;
  import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:geocoding/geocoding.dart';


int last_acces=0;

List<bool> abc=[true,false,false];
String LGG;
 String var_image = "assets/Group-1-3-Co.png";
 double align_x=0;
 double align_y=0;
 double var_margin=0;
 bool agence_conncet = false;
 bool client_conncet = false;
//  String my_id;
 String token;
var adresseController = TextEditingController();
LatLng offer_location;
LatLng lastPosition2;
LatLng lastPosition3;




 

   func () async { 
           SharedPreferences prefs = await SharedPreferences.getInstance();
          LGG=prefs.getString('stringValue');
          if(LGG=="English"){
           abc=[false,false,true];
           align_x=-1;
           align_y=-1;
           var_margin=90;
           var_image= "assets/Group 1 (3).png";
          }
          if(LGG=="Français"){
             abc=[true,false,false];
             align_x=-1;
             align_y=-1;
             var_margin=90;
             var_image= "assets/Group 1 (3).png";
          }
          if(LGG=="Arabe"){
             abc=[false,true,false];
              align_x=1;
              align_y=-0.9;
              var_margin=115;
              var_image= "assets/Group-1-3-Co.png";
          }
          
          }

valueLang(String L) async {
 if(L=="English"){
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('stringValue', 'English');
  LGG=prefs.getString('stringValue');
   abc=[false,false,true];  
   align_x=-1;
   align_y=-1;
   var_margin=90; 
   var_image= "assets/Group 1 (3).png";
  }
  if(L=="Français"){
  SharedPreferences prefs = await SharedPreferences.getInstance();
   prefs.setString('stringValue', 'Français');
  LGG=prefs.getString('stringValue');
  abc=[true,false,false];
   align_x=-1;
   align_y=-1;
   var_margin=90; 
  var_image= "assets/Group 1 (3).png";
   
  }
  if(L=="Arabe"){
  SharedPreferences prefs = await SharedPreferences.getInstance();
   prefs.setString('stringValue', 'Arabe');
  LGG=prefs.getString('stringValue');
    abc=[false,true,false];
    align_x=0.999;
    align_y=0.9;
    var_margin=115;
    var_image= "assets/Group-1-3-Co.png";
  }
  // else{
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // prefs.setString('stringValue', 'Hello');
  // LGG=prefs.getString('stringValue');
  // }
}


 void saugarder_agence () async{
   SharedPreferences prefs = await SharedPreferences.getInstance();
   prefs.setBool('bool_agence', true);
    agence_conncet = prefs.getBool('bool_agence');
 }


void deconnexion () async{
   SharedPreferences prefs = await SharedPreferences.getInstance();
   prefs.setBool('bool_agence', false);
    agence_conncet = prefs.getBool('bool_agence');
     prefs.setBool('bool_client', false);
    client_conncet = prefs.getBool('bool_client');
     SharedPreferences pref = await SharedPreferences.getInstance();         
    await pref.setString('token', ('djdzk'));
 }


 void check_agence_connenct () async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    agence_conncet = prefs.getBool('bool_agence');
    if(agence_conncet == null){
      agence_conncet=false;
    }
     }

void sauvgarder_client () async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
   prefs.setBool('bool_client', true);
    client_conncet = prefs.getBool('bool_client');
}

void check_client_conncet () async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
 
     client_conncet = prefs.getBool('bool_client');
    if(client_conncet==null){
      client_conncet=false;
    }
    print( client_conncet);

     }





     Future<String> get_adresse(double lat, double lang) async {
    
 if (lat == null || lang == null) return "";
List<Placemark> placemarks = await placemarkFromCoordinates(lat, lang);
       
        Placemark placeMark  = placemarks[0];
       String name = placeMark.name;
  String subLocality = placeMark.subLocality;
  String locality = placeMark.locality;
  String administrativeArea = placeMark.administrativeArea;
  String postalCode = placeMark.postalCode;
  String country = placeMark.country;
  String address = "${name}, ${subLocality}, ${locality}, ${administrativeArea} ${postalCode}, ${country}";
        adresseController.text = address;
        }






  