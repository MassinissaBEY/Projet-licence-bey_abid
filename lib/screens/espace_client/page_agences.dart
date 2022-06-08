import 'dart:convert';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_6/custom_image.dart';
import 'package:flutter_application_6/localization/language/languages.dart';
import 'package:flutter_application_6/model/api.dart';
import 'package:flutter_application_6/model/variables.dart';
import 'package:flutter_application_6/screens/all_offers_map.dart';
import 'package:flutter_application_6/screens/espace_agence/switching_agence.dart';
import 'package:flutter_application_6/screens/espace_client/agence_profile.dart';
import 'package:flutter_application_6/screens/espace_client/offer_detail.dart';
import 'package:flutter_application_6/screens/home.dart';
import 'package:flutter_application_6/screens/espace_client/page_agences.dart';
import 'package:flutter_application_6/screens/espace_client/page_param.dart';
import 'package:flutter_application_6/screens/espace_client/pagefiltre.dart';
import 'package:flutter_application_6/screens/espace_client/pages_favoris.dart';
import 'package:flutter_application_6/screens/espace_client/switching_page.dart';
import 'package:line_icons/line_icons.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class page_agences extends StatefulWidget {
  const page_agences({Key key}) : super(key: key);

  @override
  State<page_agences> createState() => _page_agencesState();
}

class _page_agencesState extends State<page_agences> {
   var _agence = [];
    var get_offer;
  @override


  void initState(){
     
    super.initState();  
    _loadlistagences();
    check_agence_connenct();
    check_client_conncet();
  }

  @override
  Widget build(BuildContext context) {
    return 
    // new WillPopScope(
    //    onWillPop: () async {
    //      return false;
    //     },
    //     child: 
        Scaffold(
            backgroundColor: Colors.white,
            resizeToAvoidBottomInset: false,
           floatingActionButton:  
            Visibility(
              visible: agence_conncet ,
              child: 
            Container(
              margin: EdgeInsets.only(bottom: 15),
              child:
            FloatingActionButton(
              backgroundColor: Color.fromARGB(255,222, 226, 230),
              child: Icon(Icons.real_estate_agent, color:Color.fromARGB(255, 73, 80, 87)),
            onPressed:(){
              Navigator.push(context,MaterialPageRoute(builder: (context) =>switching_agence()));
              print(agence_conncet);
              }
            ),
            ),
            
            ),
         
            body: 
            RefreshIndicator(
              
              child: Column(
              children: [
                Stack(children: [
                  
                  
                  Container(
                      height: 76,
                      
                      //color: Colors.red,),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            
                            image: AssetImage("assets/top_bar.png"),
                            fit:BoxFit.cover
                          ),
                          //color: Color(0xffE5E7F3),
                            
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                          ))
                          
                          ),
                        
                  Container(
                      // width: 90,
                     // color: Colors.red,
                     // height: 90,
                     
                  
                      margin: EdgeInsets.only(top: 56),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                           Container(
                                     
                                    height: 38,
                                    width: 250,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        color:
                                            Color.fromARGB(192, 158, 158, 158),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                       Text(
                                          Languages.of(context).liste_agc,
                                          style: TextStyle(
                                              fontSize: 18, color: Colors.grey),
                                        ),

                                      
                                      ],
                                    ))
                          ]))
                ]),
                SizedBox(height: 20,),
                Expanded(
                    child:

                        ListView.builder(
          itemBuilder: _buildOfferItem,
          itemCount: _agence.length,
                            padding: const EdgeInsets.only(
                              top: 0,
                              left: 8,
                              right: 8,
                            ),
                      

            ))
           ])  ,onRefresh:(){
            
             _loadlistagences();
             return Future<void>.delayed(const Duration(seconds: 2));
           })

     //) 
     );
  }



Widget _buildOfferItem(BuildContext context, int index) {
     return   
     InkWell(onTap:() {
       
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      agence_profile(user_id: _agence[index]['id'])));
    
     },
     child:Container(
        height: 90,
      decoration: BoxDecoration(
            color: Colors.white,
             borderRadius: BorderRadius.circular(8), //border corner radius
             boxShadow:[ 
               BoxShadow(
                  color: Colors.grey.withOpacity(0.5), //color of shadow
                  spreadRadius: 2, //spread radius
                  blurRadius: 2, // blur radius
                  offset: Offset(0, 2), // changes position of shadow
                 
               ),
               //you can set more BoxShadow() here
              ],
          ),
       padding: EdgeInsets.all(10),
       margin: EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 10),
       child: Row(
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [
          Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                      //borderRadius: BorderRadius.circular(100),
                      color: Color.fromARGB(87, 209, 206, 206),),
                      
                       child:
                        ClipOval(child:
                      
                         Icon(Icons.person_outlined,size: 40,)
                    )),
                    SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    Expanded(child:  SizedBox()),
                      Text(_agence[index]['name'], style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),),
                      SizedBox(height: 10,),
                      _agence[index]['adresse']==null?
                      Row(children: [
                        Icon(Icons.pin_drop_outlined,size: 18,),
                        SizedBox(width: 10,),
                      Text('Non disponible')
                      ],)
                      :Row(children: [
                        Icon(Icons.pin_drop_outlined,size: 18,color: Colors.blueAccent,),
                        SizedBox(width: 10,),
                        Text(_agence[index]['adresse'],style: TextStyle(color: Colors.blueAccent),)
                      ],)
                      
                    ],),
                    Expanded(child: SizedBox()),
                    Icon(Icons.arrow_forward_ios),
                    SizedBox(width: 10,)
       ],),
     )
     );
    
  }




_loadlistagences() async {

  
 
 
      var response = await Api().getData('/get/all_agences');
    if (response.statusCode == 200) {
      Future.delayed(Duration(milliseconds: 10)).then((_) {
      setState(() {
        _agence = json.decode(response.body);
       print(_agence);
        
        get_offer= json.decode(response.body);
       // print(get_offer);
       
      });
       });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error ' + response.statusCode.toString() + ': ' + response.body),
     //  content: Text('Error ' + response.statusCode + ': ' + response.body),
      ));
    }
  }











   
   
   
   }


