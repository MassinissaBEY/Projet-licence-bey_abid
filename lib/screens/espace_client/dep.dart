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


class pointdep extends StatefulWidget {
  const pointdep({Key key}) : super(key: key);

  @override
  State<pointdep> createState() => _pointdepState();
}

class _pointdepState extends State<pointdep> {
   var _offers = [];
    var get_offer;
    var favoris;
  @override


  void initState(){
     
    super.initState();  
    _loadOffers();
    check_agence_connenct();
    check_client_conncet();
    check_token();
    get_favoris();

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
              visible: agence_conncet,
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
                        
                  // Container(
                  //     // width: 90,
                  //    // color: Colors.red,
                  //    // height: 90,
                     
                  
                  //     margin: EdgeInsets.only(top: 56),
                  //     child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         children: [
                  //           InkWell(
                  //               onTap: () {
                  //                 last_acces=0;
                  //                 Navigator.push(
                  //                     context,
                  //                     MaterialPageRoute(
                  //                         builder: (context) =>
                  //                            // switching_page()
                  //                             all_offers_map(offers: _offers)
                  //                             ));
                  //               },
                                // child: Container(
                                     
                                //     height: 38,
                                //     width: 250,
                                //     decoration: BoxDecoration(
                                //       color: Colors.white,
                                //       border: Border.all(
                                //         color:
                                //             Color.fromARGB(192, 158, 158, 158),
                                //         width: 1,
                                //       ),
                                //       borderRadius: BorderRadius.circular(12),
                                //       boxShadow: [
                                //         BoxShadow(
                                //           color: Colors.grey.withOpacity(0.5),
                                //           spreadRadius: 5,
                                //           blurRadius: 7,
                                //           offset: Offset(0,
                                //               3), // changes position of shadow
                                //         ),
                                //       ],
                                //     ),
                                //     child: Row(
                                //       children: [
                                //         SizedBox(
                                //           width: 8,
                                //         ),
                                       
                                //        Expanded(child:  SizedBox(),),
                                //         Text(
                                //           'View in map',
                                //           style: TextStyle(
                                //               fontSize: 18, color: Colors.grey),
                                //         ),

                                //        Expanded(child:  SizedBox(),),
                                //         Icon(
                                //           Icons.map_outlined,
                                //           size: 30,
                                //           color: Colors.grey,
                                //         ),
                                //        Expanded(child:  SizedBox(),),
                                //       ],
                                    
                          
                ]),
                
                Expanded(
                    child:
                               Stack(children: [
                        ListView.builder(
          itemBuilder: _buildOfferItem,
          itemCount: _offers.length,
                            padding: const EdgeInsets.only(
                              top: 0,
                              left: 8,
                              right: 8,
                            ),
                      

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
                                             // switching_page()
                                              all_offers_map(offers: _offers)
                                              ));
                },
                child:
              Container(
              margin: EdgeInsets.only(top:10),
              width: 90,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          
          color: Color.fromARGB(197, 54, 119, 231),),
              
              child: 
            Row(children: [
              Icon(Icons.map,color: Colors.white,),
              SizedBox(width: 5,),
              Text(Languages.of(context).map,style: TextStyle(color: Colors.white),)
            ],),)
              )
            ],)
            ])
            )
           ])  ,onRefresh:(){
            
             _loadOffers();
             return Future<void>.delayed(const Duration(seconds: 2));
           })

     //) 
     );
  }



Widget _buildOfferItem(BuildContext context, int index,) {
     return   
   
     InkWell(onTap:() {
       
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      OfferDetailsView(offer_id: _offers[index]['id'])));
    
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
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                      highlightColor: Colors.white,
                                      onTap: () {
                                      favoris_add_supp(_offers[index]['id']);
                                      setState(() {
                                        
                                      });
                                      },
                                      child: Container(
                                        // color: Colors.red,
                                        padding: EdgeInsets.only(
                                            top: 10, left: 10, right: 10),
                                        // margin: EdgeInsets.only(top: 5,  right: 0),
                                        child: 
                                        client_conncet==false?  Icon(Icons.favorite,color: Color.fromARGB(255, 230, 221, 221),)
                                        :_offers[index]['eau']==true?
                                        Icon(
                                          Icons.favorite,
                                          color: Colors.pink,
                                          size: 28,
                                        )  :Icon(Icons.favorite,color: Color.fromARGB(255, 230, 221, 221),)
                                      )
                                     
                                      )
                                ],
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
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                      highlightColor: Colors.white,
                                      onTap: () {
                                        print('hiii');
                                         favoris_add_supp(_offers[index]['id']);
                                         setState(() {
                                           
                                         });
                                      },
                                      child: Container(
                                        // color: Colors.red,
                                        padding: EdgeInsets.only(
                                            top: 10, left: 10, right: 10),
                                        // margin: EdgeInsets.only(top: 5,  right: 0),
                                          
                                        child: 
                                        client_conncet==false?  Icon(Icons.favorite,color: Color.fromARGB(255, 230, 221, 221),)
                                        :_offers[index]['eau']==true?
                                        Icon(
                                          Icons.favorite,
                                          color: Colors.pink,
                                          size: 28,
                                        )  :Icon(Icons.favorite,color: Color.fromARGB(255, 230, 221, 221),)
                                      ))
                                ],
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
                                      Container(
                                        child:  Text(_offers[index]['price'].toString()+" DA",
                                          style: TextStyle(
                                            color: Color.fromARGB(255, 12, 139, 78),
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),

                                 _offers[index]['adresse']!=null?
                                     Container( 
                                       width: 290,
                                       child:
                                       Row(children: [
                                         Icon(Icons.pin_drop_outlined),
                                         SizedBox(width: 5,),
                                           Flexible(child:Text(
                                             _offers[index]['adresse'].toString(),
                                              style: TextStyle(),
                                            ),)
                                            ],)
                                     )
                                     :Container()
                                          //Container(width: 100,),   /*  USE row main axis  */
                                          //  Text('Prix 1000000000000 \$', style: TextStyle(color: Colors.green),),
                                        
                                      
                                   
                                      // SizedBox(
                                      //   height: 10,
                                      // ),
                                      // Row(
                                      //   children: [
                                      //     Icon(LineIcons.clock),
                                      //     SizedBox(
                                      //       width: 5,
                                      //     ),
                                      //     Text('5H'),
                                      //     SizedBox(
                                      //       width: 15,
                                      //     ),
                                      //     Icon(LineIcons.home),
                                      //     SizedBox(
                                      //       width: 5,
                                      //     ),
                                      //     Text('116m'),
                                      //     SizedBox(
                                      //       width: 15,
                                      //     ),
                                      //     Icon(LineIcons.bed),
                                      //     SizedBox(
                                      //       width: 5,
                                      //     ),
                                      //     Text('4'),
                                      //   ],
                                      // )
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




_loadOffers() async {

  
  //  var response = await http.get(Uri.parse("http://192.168.137.121:8000/api/offer"));
  //   if (response.statusCode == 200) {
  //     setState(() {
  //       _offers = json.decode(response.body);
  //     });
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //       content: Text('Error ' + response.statusCode.toString() + ': ' + response.body),
  //    //  content: Text('Error ' + response.statusCode + ': ' + response.body),
  //     ));
  //   }
 
      var response = await Api().getData('/offer');
    if (response.statusCode == 200) {
      Future.delayed(Duration(milliseconds: 10)).then((_) {
      setState(() {
        _offers = json.decode(response.body);
      // print(_offers);
        
        get_offer= json.decode(response.body);
       // print(get_offer); 
        Future.delayed(Duration(milliseconds: 10)).then((_) {
       get_favoris();
        });
      });
       });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error ' + response.statusCode.toString() + ': ' + response.body),
     //  content: Text('Error ' + response.statusCode + ': ' + response.body),
      ));
    }
  }








   check_token() async{
       SharedPreferences pref = await SharedPreferences.getInstance();         
         token = await pref.getString('token');
         
              print(token);

      var data = new Map<String, dynamic>();
            if (token != null && token.length > 0) {
  token = token.substring(1, token.length - 1);
}

    
   //  token=token.substring(1);  

    //  token = token.substring(0);
      
         print(token);
        data['token'] = token;

      // var data = {'token': token};
       



       
 Future.delayed(Duration(milliseconds: 50)).then((_) async{

   var response = await Api().postData(data,'/find_user');
    
      if (response.statusCode == 200){
        
      final body = jsonDecode(response.body);
       print(body.toString());
      if(body['agence']!=null){
        SharedPreferences prefs = await SharedPreferences.getInstance();
            saugarder_agence();
           prefs.setBool('bool_agence',true);
      }
    }else{
       print("INVALIDEEE");
        deconnexion ();
        check_agence_connenct();
        check_client_conncet();
          SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool('bool_agence',false);
          setState(() {});
    }
 });
  
   }



   
   

   favoris_add_supp(int offer_id) async {

         SharedPreferences pref = await SharedPreferences.getInstance();         
         token = await pref.getString('token');
         
          
            if (token != null && token.length > 0) {
       token = token.substring(1, token.length - 1); 
       }

              print(token);

       var deux = {'token':token,'offer_id':offer_id.toString()};
 
      var response = await Api().postData(deux,'/favoris/create');
       
      get_favoris();
  
  }



  get_favoris() async{
     var response = await Api().getData('/favoris/get');
     print("HHHHHHHHHHHHHHHHHHHHHHHHHH");
    if (response.statusCode == 200  ) {
      Future.delayed(Duration(milliseconds: 10)).then((_) {
      setState(() {
        favoris = json.decode(response.body);
       print(favoris);
        
       for(int g=0; g<favoris.length; g++ ){
         print("EEEEEEEEEEEEEEEEEEEEEEEEEE");
         for(int i=0; i< _offers.length; i++)
         if (favoris[g]['offer_id'] == _offers[i]['id'] ){
              _offers[i]['eau']=true;
              print('HHHHHHHHHHIIIIIIII'+_offers[i]['id'].toString());
             print(favoris[g]['offer_id']);
             print( _offers[i]['eau']);
         }
       }
       
  });
  setState(() {
    
  });
      }); 
    }
     // print(_offers);
   }

}

