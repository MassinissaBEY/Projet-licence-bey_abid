import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_6/model/api.dart';
import 'package:flutter_application_6/model/variables.dart';
import 'package:flutter_application_6/screens/espace_client/details_offer2.dart';
import 'package:flutter_application_6/screens/espace_client/offer_detail.dart';
import 'package:line_icons/line_icons.dart';



class offer_of_user extends StatefulWidget {
  

  @override
  State<offer_of_user> createState() => _offer_of_userState();
final int user_id;
final String user_name;
offer_of_user({this.user_id, this.user_name});
}

class _offer_of_userState extends State<offer_of_user> {
 var offer = [];

 void initState() {
    super.initState();
    _offer_of_user2();

    
      }

 
 
 var user;
  @override
 
  Widget build(BuildContext context) {
    return 
    Scaffold(

      
    
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
                            
                            image: AssetImage("assets/Group 4 (6).png"),
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
                                        
                                      
                                       Flexible(child:  Text('offers agence '+widget.user_name.toString(),
                                          
                                          style: TextStyle(
                                              fontSize: 18, color: Color.fromARGB(255, 61, 57, 57)),
                                        ),
                                       )
                                     
                                       
                                      ],
                                    ))
                          ]))
                ]),
                
                Expanded(
                    child:

                        ListView.builder(
          itemBuilder: _buildOfferItem,
          itemCount: offer.length,
                            padding: const EdgeInsets.only(
                              top: 0,
                              left: 8,
                              right: 8,
                            ),
                      

            )),
            
           ]) 
           
            ,onRefresh:(){
            
             offer_of_user();
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
                      OfferDetailsView2(offer_id: offer[index]['id'])));
        
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
                       offer[index]['images'].isEmpty?   Container(
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
                                      favoris_add_supp(offer[index]['id']);
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
                                        :offer[index]['eau']==true?
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
                                
                              
                                   image: DecorationImage(image:NetworkImage(Api().getOfferImageUrl(offer[index]['images'][0]['id'])  ),
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
                                         favoris_add_supp(offer[index]['id']);
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
                                        :offer[index]['eau']==true?
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
                                        child:  Text(offer[index]['title'],
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        child:  Text(offer[index]['price'].toString()+" DA",
                                          style: TextStyle(
                                            color: Color.fromARGB(255, 12, 139, 78),
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),

                                 offer[index]['adresse']!=null?
                                     Container( 
                                       width: 290,
                                       child:
                                       Row(children: [
                                         Icon(Icons.pin_drop_outlined),
                                         SizedBox(width: 5,),
                                           Flexible(child:Text(
                                             offer[index]['adresse'].toString(),
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

  _offer_of_user2() async {
     
     var data = {'user_id': widget.user_id.toString(), };
     
      print(widget.user_id.toString());
    var response = await Api().postData(data,'/off');

      print(response.toString());

    if (response.statusCode == 200) {
      setState(() {
        offer = json.decode(response.body);
        user = json.decode(response.body);
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
            'Error ' + response.statusCode.toString() + ': ' + response.body),
      ));
    }

    
       
    
   

   }




    
  }

void favoris_add_supp(offer) {
}
