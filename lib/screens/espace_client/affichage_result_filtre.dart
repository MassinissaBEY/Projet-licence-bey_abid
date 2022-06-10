



import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_6/model/api.dart';
import 'package:flutter_application_6/model/variables.dart';
import 'package:flutter_application_6/screens/espace_client/offer_detail.dart';
import 'package:flutter_application_6/screens/offers_of_user.dart';

class result_filtre extends StatefulWidget {
  

  @override
  State<result_filtre> createState() => _result_filtreState();
       var data ;
  result_filtre({this.data});
  
  
}

class _result_filtreState extends State<result_filtre> {
  var offers = [];


 @override


  void initState(){
     
    super.initState();  
    load_recherche();
    

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
            backgroundColor: Colors.white,
            resizeToAvoidBottomInset: false,
           
            
         
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
              
                          
                ]),
                offers==null?  Container(color: Colors.red,)
                :Expanded(
                    child:
                               Stack(children: [
                        ListView.builder(
          itemBuilder: _buildOfferItem,
          itemCount: offers.length,
                            padding: const EdgeInsets.only(
                              top: 0,
                              left: 8,
                              right: 8,
                            ),
                      

            ),
          
            ])
            )
           ])  ,onRefresh:(){
            
           
           })

     //) 
     );
  }



Widget _buildOfferItem(BuildContext context, int index,) {
     return   
     offers==null? Container()
   
     :InkWell(onTap:() {
       
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      OfferDetailsView(offer_id: offers[index]['id'])));
    
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
                       offers[index]['images'].isEmpty?   Container(
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
                                        :offers[index]['eau']==true?
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
                                
                              
                                   image: DecorationImage(image:NetworkImage(Api().getOfferImageUrl(offers[index]['images'][0]['id'])  ),
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
                                         favoris_add_supp(offers[index]['id']);
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
                                        :offers[index]['eau']==true?
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
                                        child:  Text(offers[index]['title'],
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        child:  Text(offers[index]['price'].toString()+" DA",
                                          style: TextStyle(
                                            color: Color.fromARGB(255, 12, 139, 78),
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),

                                 offers[index]['adresse']!=null?
                                     Container( 
                                       width: 290,
                                       child:
                                       Row(children: [
                                         Icon(Icons.pin_drop_outlined),
                                         SizedBox(width: 5,),
                                           Flexible(child:Text(
                                             offers[index]['adresse'].toString(),
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




load_recherche () async {

  
  

    var response = await Api().postData(widget.data, '/offer/recherche');
   

    if (response.statusCode == 200) {
      setState(() {
           
           offers = json.decode(response.body);
           

/*
    titleController=null;
    priceController=null;
    descriptionController=null;
    chambresController=null;
    superficieController=null;
    nbr_etagesController=null;
    num_etagesController=null;
    nbr_sbain=null;
    nbr_cuisine=null;
    adresseController=null;

    */
    
    
    
      });
}
  }
   
}
