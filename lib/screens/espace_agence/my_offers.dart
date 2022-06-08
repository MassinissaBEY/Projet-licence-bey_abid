import 'dart:convert';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_6/custom_image.dart';
import 'package:flutter_application_6/model/api.dart';
import 'package:flutter_application_6/model/variables.dart';
import 'package:flutter_application_6/screens/all_offers_map.dart';
import 'package:flutter_application_6/screens/espace_agence/modifier_offer.dart';
import 'package:flutter_application_6/screens/espace_agence/switching_agence.dart';
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


class my_offers extends StatefulWidget {
  const my_offers({Key key}) : super(key: key);

  @override
  State<my_offers> createState() => _my_offersState();
}

class _my_offersState extends State<my_offers> {
   var _offers = [];
    var get_offer;
  @override


  void initState(){
     
    super.initState();  
     _loadmyoffers();
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
               heroTag: "btn1",
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
                            
                            image: AssetImage("assets/top_bar_agence.png"),
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
                                          'My offers',
                                          style: TextStyle(
                                              fontSize: 18, color: Colors.grey),
                                        ),

                                      ],
                                    ))
                          ]))
                ]),
                
                Expanded(
                    child:

                        ListView.builder(
          itemBuilder: _buildOfferItem,
          itemCount: _offers.length,
                            padding: const EdgeInsets.only(
                              top: 0,
                              left: 8,
                              right: 8,
                            ),
                      

            ))
           ])  ,onRefresh:(){
            
             _loadmyoffers();
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
                      modify_offer(offer_id: _offers[index]['id'])));
    
     },
     child:
     Container(
                        margin: EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        height: 290,
                        child: Column(
                          children: [
                       _offers[index]['images'].isEmpty?   Container(
                              height: 190,
                              width: 370,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    topRight: Radius.circular(20.0)),
                                boxShadow: [
                                  BoxShadow(
                                    //    color: shadowColor.withOpacity(0.1),
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    offset: Offset(
                                        0, 1), // changes position of shadow
                                  ),
                                ],
                                image: DecorationImage(
                                    image:
                                  AssetImage("assets/image_maison.webp") ,
                                    fit: BoxFit.fill),
                                ),
                             
                            )


                            :Container(
                              height: 190,
                              width: 370,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    topRight: Radius.circular(20.0)),
                                boxShadow: [
                                  BoxShadow(
                                    //    color: shadowColor.withOpacity(0.1),
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    offset: Offset(
                                        0, 1), // changes position of shadow
                                  ),
                                ],
                                
                              
                                   image: DecorationImage(image:NetworkImage(Api().getOfferImageUrl(_offers[index]['images'][0]['id'])  ),
                                    fit: BoxFit.cover),
                                ),
                              
                            ),



                            Container(
                              height: 100,
                              width: 370,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20.0),
                                      bottomRight: Radius.circular(20.0)),
                                  color: Colors.white),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        child:  Text(_offers[index]['title'],
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            child: Text(
                                              'Adresse@adresse',
                                              style: TextStyle(),
                                            ),
                                          ),
                                          //Container(width: 100,),   /*  USE row main axis  */
                                          //  Text('Prix 1000000000000 \$', style: TextStyle(color: Colors.green),),
                                        ],
                                      ),
                                      //  Text('Prix 1000 \$', style: TextStyle(color: Colors.green),),
                                      //  SizedBox(height: 10,),

                                      //   Text('680m'),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Icon(LineIcons.clock),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text('5H'),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Icon(LineIcons.home),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text('116m'),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Icon(LineIcons.bed),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text('4'),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                           
                          ],
                        ),
     )
                      );
  }





_loadmyoffers() async {

  
     SharedPreferences pref = await SharedPreferences.getInstance();         
         token = await pref.getString('token');
         
              print(token);

      var data = new Map<String, dynamic>();
            if (token != null && token.length > 0) {
      token = token.substring(1, token.length - 1);
}


         print(token);
        data['token'] = token;
    
 
      var response = await Api().postData(data,'/get/offer_user');
    if (response.statusCode == 200) {
      Future.delayed(Duration(milliseconds: 10)).then((_) {
      setState(() {
        _offers = json.decode(response.body);
        print("cest bon");
        
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



// decoration: BoxDecoration(
//       image: DecorationImage(image: NetworkImage("urlImage"),
//       fit: BoxFit.cover)
//     ),