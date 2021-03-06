import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_6/localization/language/languages.dart';
import 'package:flutter_application_6/model/api.dart';
import 'package:flutter_application_6/model/variables.dart';
import 'package:flutter_application_6/screens/MapView.dart';
import 'package:flutter_application_6/screens/espace_client/agence_profile.dart';
import 'package:flutter_application_6/screens/espace_client/inscription_connexion.dart';
import 'package:flutter_application_6/screens/map_detail_offer.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';




class OfferDetailsView extends StatefulWidget {
  @override
  _OfferDetailsState createState() => _OfferDetailsState();
  final int offer_id;
  OfferDetailsView({this.offer_id});
}

class _OfferDetailsState extends State<OfferDetailsView> {


  
  @override
  void initState() {
    super.initState();
    _loadOfferDetails();
    get_comments();
    check_client_conncet();
    get_id();
  }


  var offer;
  var user;
  var comments;
 String number2;
 int active_index = 0;
  var commentController = TextEditingController();
   String my_id; 


  @override
  Widget build(BuildContext context) {
     return Scaffold(
      
   
      bottomNavigationBar: Container(

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

        child: Row(children: [

          SizedBox(width: 10,),

        Expanded(child: 


        InkWell(
          onTap: () async{
            // _callNumber();
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
            Text(Languages.of(context).tel,style:  TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
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
            Text(Languages.of(context).email,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
           Expanded(child:  SizedBox(),)
          ],),
        )),
          ),
          SizedBox(width: 10,),

      ],),),
    
      body: 
      
      // Stack(
      //   children: <Widget>[
      //     Align(
      //       alignment: Alignment.topCenter,
      //       child: offer != null ? _buildFormFields() : Text('Loading...'),
      //     )
      //   ],
      // ),
      SingleChildScrollView(child: 
      Column(
              children: [
               
                  
                  
                  Container(

                      height: 30,                      
                      //color: Colors.red,),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 2, 62, 138),
                        
                          //color: Color(0xffE5E7F3),
                            
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                          ))
                          
                          ),
                          Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: offer != null ? _buildFormFields() : Text('Loading...'),
          )
        ],
      ),
                          ])
                          ,)
    );
  }

  Widget _buildFormFields() {
    return   
    /////////////////////////////////////////////////////////////////
    Container(
      margin: EdgeInsets.only(left: 0.0, right: 0.0, bottom: 0.0),
      child: SingleChildScrollView(
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
           
     offer['images'].isEmpty ? Container(height: 20, width: 20,child: Center(child: Text(Languages.of(context).loffre_ne_contient),),)  :display_images(),

           // display_images()   ,
           
           SizedBox(height: 20,),



                          
            Row(children: [
              
           offer['vente']==null?
                   Container(margin: EdgeInsets.only(left: 20, right: 20),
              child: Text(Languages.of(context).loc,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
              )
              :Container(margin: EdgeInsets.only(left: 20, right: 20),
              child: Text(Languages.of(context).vente,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
              ),
               
             
               LGG=="English"?
                  Text(offer['category']['Name'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500))
                  :LGG=="Fran??ais"?
                  Text(offer['category']['Name_fr'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500))
                  :LGG=="Arabe"?
                  Text(offer['category']['Name_ar'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500))
                  :Container()
                  
              ],),



              SizedBox(height: 10,),
           Row(children: [
              Container(margin: EdgeInsets.only(left: 20, right: 20),
              child: Text(offer['price'].toString()+"  "+Languages.of(context).da,style: TextStyle(color: Colors.greenAccent,fontSize: 20,fontWeight: FontWeight.w500),),
              ),
       Expanded(child: SizedBox()),
           IconButton(
             
             onPressed: (() {
        if(client_conncet==false){

           return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Connexion requise'),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text('Vous devez ce connctez pour ajouter et voir les commentaires'),
             // Text('Would you like to approve of this message?'),
            ],
          ),
        ),
        actions: <Widget>[
          Row(children: [
          TextButton(
            child: const Text('Se conncter'),
            onPressed: () {
              Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => connexion()),
  );
            },
          ),
         Expanded(child:  SizedBox()),
          TextButton(
            child: const Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          ],)
        ],
      );
    },
  );}
  
            else{
                           
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
            margin: EdgeInsets.only(left: 10,right: 10),
           child:
           StatefulBuilder(builder: ((context, setState) {
             return
         
          AnimatedPadding(
              padding: MediaQuery.of(context).viewInsets,
              duration: const Duration(milliseconds: 100),
              curve: Curves.decelerate,
              child: Container(
               
                height: MediaQuery.of(context).size.height*0.9,
                  child:
                  Column(
                  children: [
                     
            Container(height: 40,
         
          color: Colors.white,
           
            child: Center(child: Text("Offer "+offer['title'].toString()),),
            ),
            Container(color: Colors.grey,
            height: 0.5,
            ),
                    Expanded(child:
                   
                   
                    
                    //  ListView(children: [
                    //    Container(height: 900,
                    //    width: 20,
                    //    color: Colors.red,
                    //    ),
                    //      Container(height: 900,
                    //    width: 20,
                    //    color: Colors.green,
                    //    )
                    //  ],)
                          ListView.builder(
                  itemBuilder: _build_comment,
                    itemCount: comments['comments'].length,
                    //comments.length,
                            padding: const EdgeInsets.only(
                              top: 0,
                              left: 8,
                              right: 8,
                            ),
                      
                      
                            )
                      ),
                    
                     Wrap(
                children: [
                 Column(children: [ 
                   Container(height: 1,
                   color: Colors.grey,
                   ), 
                   SizedBox(height: 10,),
               Container(
                 height: 60,
                   decoration: BoxDecoration(
 
                color: Colors.white,
                ),
                
                 padding: EdgeInsets.only(left: 20,top: 0,bottom: 0,right: 20),
                 child: 
               
                  
                   TextFormField( 
                    
                  controller:commentController,                 
                  decoration: InputDecoration( 
                    fillColor: Colors.redAccent,
                     contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                     //icon at head of input
                      //prefixIcon: Icon(Icons.people), //you can use prefixIcon property too.
                      border: OutlineInputBorder( //Outline border type for TextFeild
      borderRadius: BorderRadius.all(Radius.circular(100)),
      ),
                      labelText: "Commenter",
                      suffixIcon: IconButton(onPressed: () {
                       
                        setState(() {
                          
                          add_comment();
                         
                         //  FocusManager.instance.primaryFocus?.unfocus();
                        

                     
                          get_comments();
                         

                    
                          
                             
                        });
                        
                      },
                      icon: Icon(Icons.send),
                      ) 
                  )
               )
               
               )
                ],
              )
              ],),
              SizedBox(height: 5,)
              ],)
              ));
                }),
          )
              );
        },
      );
              }
             }
             ),
             
             icon:Icon(Icons.comment_outlined,color: Colors.black,)),
       SizedBox(width: 20,)
            ],),

     SizedBox(height: 20,),


   

          
               Container(margin: EdgeInsets.only(left: 20, right: 20),
              child: Text(offer['title'].toString(),style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),),
              ),

 


                   offer['adresse']==null? Container()
                :Container(margin: EdgeInsets.only(left: 20,top: 15, right: 20),
              child: 
              Row(children: [
                Icon(Icons.pin_drop, color: Colors.lightBlueAccent,),
                SizedBox(width: 15,),
              Flexible(child: Text(offer['adresse'],style: TextStyle(color: Colors.lightBlueAccent,fontSize: 15,fontWeight: FontWeight.w500),),
              )
              ],)
              ),
              

              SizedBox(height: 20,),


             offer['latitude']==null? Container()
                   :InkWell(
                 onTap: (){
                   Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => detail_offer_map(latitude: offer['latitude'].toString(),longitude:offer['longitude'].toString())),
  );
                 },
                 child:
                             Container(
                  height: 70,
                margin: const EdgeInsets.only(top: 10.0, left: 15, right: 15),
                decoration: BoxDecoration(
                   image: DecorationImage(
                            
                            image: AssetImage("assets/map_img.png"),
                            fit:BoxFit.cover
                          ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        offset: const Offset(0, 5),
                        blurRadius: 5.0,
                        spreadRadius: 0)
                  ],
                  color: Color.fromARGB(255, 247, 247, 247),
                  border: Border.all(color: Color.fromARGB(255, 73, 80, 87)),
                  borderRadius: BorderRadius.circular(5),
                ),
                child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Text(Languages.of(context).map, style: TextStyle(color: Color.fromARGB(255, 117, 115, 115), fontWeight: FontWeight.bold , fontSize: 18)),
                   SizedBox(width: 10,),
                   Icon(Icons.map, color: Color.fromARGB(255, 117, 115, 115),)
                ],)
                ),
               ),


         SizedBox(height: 20,),

              Container(margin: EdgeInsets.only(top: 20,left: 0),
              child: Column(
                children: [
                  // Row(children: [
                  //    SizedBox(width: 20,),
                  //   Icon(Icons.bed,color: Colors.grey,),
                  //   SizedBox(width: 10,),
                  //   Text("3 Chambres \n?? coucher",style:TextStyle(color: Colors.grey,)),
                  //   Expanded(child: SizedBox(),),
                  //   Icon(Icons.bathtub_outlined,color: Colors.grey,),
                  //   SizedBox(width: 10,),
                  //   Text("1 Salle \nde bain",style:TextStyle(color: Colors.grey,)),
                  //   SizedBox(width: 50,)
                  // ],),

                  Container(
                    margin: EdgeInsets.only(left: 10,right: 10),
                    child: 
                       Wrap(
                        runAlignment: WrapAlignment.start,
                       
	            alignment: WrapAlignment.start,
	            direction: Axis.horizontal,
                  children: <Widget>[


                     offer['eau']==null? Container(width: 0,)   
	        :Container(
            height: 90,
            width: 75,
           padding: EdgeInsets.only(left: 5, right: 5, bottom: 5,top: 10),
	      margin: const EdgeInsets.fromLTRB(5, 10, 5, 0),
           decoration: BoxDecoration(
            color: Colors.white,
             borderRadius: BorderRadius.circular(8), //border corner radius
             boxShadow:[ 
               BoxShadow(
                  color: Colors.grey.withOpacity(0.5), //color of shadow
                  spreadRadius: 2, //spread radius
                  blurRadius: 2, // blur radius
                  offset: Offset(0, 2), // changes position of shadow
                  //first paramerter of offset is left-right
                  //second parameter is top to down
               ),
               //you can set more BoxShadow() here
              ],
          ),
	      child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                    Icon(Icons.water_drop_outlined),
                   SizedBox(height: 25,),
                    Text(Languages.of(context).eau)
          ],)
          ),




                       offer['elec']==null? Container(width: 0,)   
                    :Container(
            height: 90,
            width: 75,
           padding: EdgeInsets.only(left: 5, right: 5, bottom: 5,top: 10),
	      margin: const EdgeInsets.fromLTRB(5, 10, 5, 0),
           decoration: BoxDecoration(
            color: Colors.white,
             borderRadius: BorderRadius.circular(8), //border corner radius
             boxShadow:[ 
               BoxShadow(
                  color: Colors.grey.withOpacity(0.5), //color of shadow
                  spreadRadius: 2, //spread radius
                  blurRadius: 2, // blur radius
                  offset: Offset(0, 2), // changes position of shadow
                  //first paramerter of offset is left-right
                  //second parameter is top to down
               ),
               //you can set more BoxShadow() here
              ],
          ),
	      child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                    Icon(Icons.electrical_services),
                   SizedBox(height: 25,),
                    Text(Languages.of(context).elect)
          ],)
          ),



                 offer['gaz']==null? Container(width: 0,)   
                :Container(
            height: 90,
            width: 75,
            padding: EdgeInsets.only(left: 5, right: 5, bottom: 5,top: 10),
	      margin: const EdgeInsets.fromLTRB(5, 10, 5, 0),
           decoration: BoxDecoration(
            color: Colors.white,
             borderRadius: BorderRadius.circular(8), //border corner radius
             boxShadow:[ 
               BoxShadow(
                  color: Colors.grey.withOpacity(0.5), //color of shadow
                  spreadRadius: 2, //spread radius
                  blurRadius: 2, // blur radius
                  offset: Offset(0, 2), // changes position of shadow
                  //first paramerter of offset is left-right
                  //second parameter is top to down
               ),
               //you can set more BoxShadow() here
              ],
          ),
	      child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                    Icon(LineIcons.fire),
                   SizedBox(height: 25,),
                    Text(Languages.of(context).gaz)
          ],)
          ),




   
           offer['meubles']==null? Container(width: 0,)   
	        :Container(
            height: 90,
            width: 75,
           padding: EdgeInsets.only(left: 5, right: 5, bottom: 5,top: 10),
	      margin: const EdgeInsets.fromLTRB(5, 10, 5, 0),
           decoration: BoxDecoration(
            color: Colors.white,
             borderRadius: BorderRadius.circular(8), //border corner radius
             boxShadow:[ 
               BoxShadow(
                  color: Colors.grey.withOpacity(0.5), //color of shadow
                  spreadRadius: 2, //spread radius
                  blurRadius: 2, // blur radius
                  offset: Offset(0, 2), // changes position of shadow
                  //first paramerter of offset is left-right
                  //second parameter is top to down
               ),
               //you can set more BoxShadow() here
              ],
          ),
	      child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                    Icon(Icons.chair_outlined),
                    SizedBox(height: 25,),
                    Text(Languages.of(context).meubles)
          ],)
          ),



              offer['nbr_cuisine']==null? Container(width: 0,)    
	         :Container(
            height: 90,
            width: 75,
            padding: EdgeInsets.only(left: 5, right: 5, bottom: 5,top: 10),
	      margin: const EdgeInsets.fromLTRB(5, 10, 5, 0),
           decoration: BoxDecoration(
            color: Colors.white,
             borderRadius: BorderRadius.circular(8), //border corner radius
             boxShadow:[ 
               BoxShadow(
                  color: Colors.grey.withOpacity(0.5), //color of shadow
                  spreadRadius: 2, //spread radius
                  blurRadius: 2, // blur radius
                  offset: Offset(0, 2), // changes position of shadow
                  //first paramerter of offset is left-right
                  //second parameter is top to down
               ),
               //you can set more BoxShadow() here
              ],
          ),
	      child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                    Icon(Icons.kitchen_outlined),
                    SizedBox(height: 10,),
                    
                    Text(offer['nbr_cuisine'].toString()),
                    SizedBox(height: 5,),
                   Flexible(child:Text(Languages.of(context).cuisine))
          ],)
          ),



             offer['nbr_sbain']==null? Container(width: 0,)    
	       : Container(
            height: 90,
            width: 75,
            padding: EdgeInsets.only(left: 5, right: 5, bottom: 5,top: 10),
	      margin: const EdgeInsets.fromLTRB(5, 10, 5, 0),
           decoration: BoxDecoration(
            color: Colors.white,
             borderRadius: BorderRadius.circular(8), //border corner radius
             boxShadow:[ 
               BoxShadow(
                  color: Colors.grey.withOpacity(0.5), //color of shadow
                  spreadRadius: 2, //spread radius
                  blurRadius: 2, // blur radius
                  offset: Offset(0, 2), // changes position of shadow
                  //first paramerter of offset is left-right
                  //second parameter is top to down
               ),
               //you can set more BoxShadow() here
              ],
          ),
	      child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                    Icon(Icons.bathtub_outlined),
                    SizedBox(height: 10,),
                    
                    Text(offer['nbr_sbain'].toString()),
                    SizedBox(height: 5,),
                   Flexible(child:Text(Languages.of(context).s_bain))
          ],)
          ),


              offer['nbr_chambres']==null? Container(width: 0,)    
	        :Container(
            height: 90,
            width: 75,
            padding: EdgeInsets.only(left: 5, right: 5, bottom: 5,top: 10),
	      margin: const EdgeInsets.fromLTRB(5, 10, 5, 0),
           decoration: BoxDecoration(
            color: Colors.white,
             borderRadius: BorderRadius.circular(8), //border corner radius
             boxShadow:[ 
               BoxShadow(
                  color: Colors.grey.withOpacity(0.5), //color of shadow
                  spreadRadius: 2, //spread radius
                  blurRadius: 2, // blur radius
                  offset: Offset(0, 2), // changes position of shadow
                  //first paramerter of offset is left-right
                  //second parameter is top to down
               ),
               //you can set more BoxShadow() here
              ],
          ),
	      child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                    Icon(Icons.bed),
                    SizedBox(height: 10,),
                    
                    Text(offer['nbr_chambres'].toString()),
                    SizedBox(height: 5,),
                   Flexible(child:Text(Languages.of(context).chambres))
          ],)
          ),



        
                offer['superficie']==null? Container(width: 0,)    
	        :Container(
               height: 90,
            width: 75,
           padding: EdgeInsets.only(left: 5, right: 5, bottom: 5,top: 10),
	      margin: const EdgeInsets.fromLTRB(5, 10, 5, 0),
           decoration: BoxDecoration(
            color: Colors.white,
             borderRadius: BorderRadius.circular(8), //border corner radius
             boxShadow:[ 
               BoxShadow(
                  color: Colors.grey.withOpacity(0.5), //color of shadow
                  spreadRadius: 2, //spread radius
                  blurRadius: 2, // blur radius
                  offset: Offset(0, 2), // changes position of shadow
                  //first paramerter of offset is left-right
                  //second parameter is top to down
               ),
               //you can set more BoxShadow() here
              ],
          ),
	      child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                    Icon(Icons.crop),
                    SizedBox(height: 25,),
                    Text(offer['superficie'].toString()+" "+Languages.of(context).superficie),
                     
                     
          ],)
          ),

   

                 offer['parking']==null? Container(width: 0,)   
                 :Container(
            height: 90,
            width: 75,
           padding: EdgeInsets.only(left: 5, right: 5, bottom: 5,top: 10),
	      margin: const EdgeInsets.fromLTRB(5, 10, 5, 0),
           decoration: BoxDecoration(
            color: Colors.white,
             borderRadius: BorderRadius.circular(8), //border corner radius
             boxShadow:[ 
               BoxShadow(
                  color: Colors.grey.withOpacity(0.5), //color of shadow
                  spreadRadius: 2, //spread radius
                  blurRadius: 2, // blur radius
                  offset: Offset(0, 2), // changes position of shadow
                  //first paramerter of offset is left-right
                  //second parameter is top to down
               ),
               //you can set more BoxShadow() here
              ],
          ),
	      child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                    Icon(Icons.local_parking),
                   SizedBox(height: 25,),
                    Text(Languages.of(context).parking)
          ],)
          ),




           offer['garage']==null? SizedBox.shrink()   
	        :Container(
            height: 90,
            width: 75,
          padding: EdgeInsets.only(left: 5, right: 5, bottom: 5,top: 10),
	      margin: const EdgeInsets.fromLTRB(5, 10, 5, 0),
           decoration: BoxDecoration(
            color: Colors.white,
             borderRadius: BorderRadius.circular(8), //border corner radius
             boxShadow:[ 
               BoxShadow(
                  color: Colors.grey.withOpacity(0.5), //color of shadow
                  spreadRadius: 2, //spread radius
                  blurRadius: 2, // blur radius
                  offset: Offset(0, 2), // changes position of shadow
                  //first paramerter of offset is left-right
                  //second parameter is top to down
               ),
               //you can set more BoxShadow() here
              ],
          ),
	      child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                    Icon(Icons.garage_outlined),
                     SizedBox(height: 25,),
                    Text(Languages.of(context).garage)
          ],)
          ),



          offer['piscine']==null? Container(width: 0,)   
          :Container(
            height: 90,
            width: 75,
          padding: EdgeInsets.only(left: 5, right: 5, bottom: 5,top: 10),
	      margin: const EdgeInsets.fromLTRB(5, 10, 5, 0),
           decoration: BoxDecoration(
            color: Colors.white,
             borderRadius: BorderRadius.circular(8), //border corner radius
             boxShadow:[ 
               BoxShadow(
                  color: Colors.grey.withOpacity(0.5), //color of shadow
                  spreadRadius: 2, //spread radius
                  blurRadius: 2, // blur radius
                  offset: Offset(0, 2), // changes position of shadow
                  //first paramerter of offset is left-right
                  //second parameter is top to down
               ),
               //you can set more BoxShadow() here
              ],
          ),
	      child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                    Icon(LineIcons.swimmingPool),
                     SizedBox(height: 25,),
                    Text(Languages.of(context).piscine)
          ],)
          ),



             
           offer['jardin']==null? Container(width: 0,)   
	        :Container(
            height: 90,
            width: 75,
          padding: EdgeInsets.only(left: 5, right: 5, bottom: 5,top: 10),
	      margin: const EdgeInsets.fromLTRB(5, 10, 5, 0),
           decoration: BoxDecoration(
            color: Colors.white,
             borderRadius: BorderRadius.circular(8), //border corner radius
             boxShadow:[ 
               BoxShadow(
                  color: Colors.grey.withOpacity(0.5), //color of shadow
                  spreadRadius: 2, //spread radius
                  blurRadius: 2, // blur radius
                  offset: Offset(0, 2), // changes position of shadow
                  //first paramerter of offset is left-right
                  //second parameter is top to down
               ),
               //you can set more BoxShadow() here
              ],
          ),
	      child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                    Icon(Icons.forest_outlined),
                   SizedBox(height: 25,),
                    Text(Languages.of(context).jardin)
          ],)
          ),




        
          

          




          



               


          ]),
                  ),




                  SizedBox(height: 30,),


         

         
                  SizedBox(height: 20,),
                  Divider(
                    height: 2,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 20,),
                  Container(margin: EdgeInsets.only(left: 20,right: 20),
                  
                  child: 
                   offer['description']==null? 
                  Text("Aucune description disponible")
                  :Text( offer['description'])
                  ),
                   SizedBox(height: 20,),
                  Divider(
                    height: 2,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 20,),

                 

                    

                  SizedBox(height: 20,),

                 Container(
                   margin: EdgeInsets.only(left: 20, right: 20),
                   child: Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [ 
                     Text(Languages.of(context).doc,style: TextStyle(fontWeight: FontWeight.w500),),
                     
                     ],)),
                      Container(
                   margin: EdgeInsets.only(left: 20,right: 20,top: 10),
                   child: Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [ 
                     Text(Languages.of(context).promo,style: TextStyle(fontWeight: FontWeight.w300),),
                     Expanded(child: SizedBox()),
                     offer['promotion_imob']==null?Text(Languages.of(context).non,style: TextStyle(fontWeight: FontWeight.w700),)
                        :Text(Languages.of(context).oui,style: TextStyle(fontWeight: FontWeight.w700),),
                     ],)
                     ),

                      Container(
                   margin: EdgeInsets.only(left: 20,right: 20,top: 10),
                   child: Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [ 
                     Text(Languages.of(context).act,style: TextStyle(fontWeight: FontWeight.w300),),
                     Expanded(child: SizedBox()),
                        offer['acte']==null?Text(Languages.of(context).non,style: TextStyle(fontWeight: FontWeight.w700),)
                        :Text(Languages.of(context).oui,style: TextStyle(fontWeight: FontWeight.w700),),
                     ],)
                     ),

                        Container(
                   margin: EdgeInsets.only(left: 20,right: 20,top: 10),
                   child: Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [ 
                     Text(Languages.of(context).livret,style: TextStyle(fontWeight: FontWeight.w300),),
                     Expanded(child: SizedBox()),
                        offer['livret']==null?Text(Languages.of(context).non,style: TextStyle(fontWeight: FontWeight.w700),)
                        :Text(Languages.of(context).oui,style: TextStyle(fontWeight: FontWeight.w700),),
                     ],)
                     ),
                    SizedBox(height: 10,),

                     Divider(
                    height: 2,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 20,),



                
                     


                  SizedBox(height: 20,),

                 Container(
                   margin: EdgeInsets.only(left: 20, right: 20),
                   child: Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [ 
                     Text(Languages.of(context).a_propos,style: TextStyle(fontWeight: FontWeight.w500),),
                     
                     ],)),
                      Container(
                   margin: EdgeInsets.only(left: 20,right: 20,top: 10),
                   child: Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [ 
                     Text(Languages.of(context).pub_par,style: TextStyle(fontWeight: FontWeight.w300),),
                     Expanded(child: SizedBox()),
                    TextButton(onPressed: (){
                  Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      agence_profile(user_id: offer['user']['id'])));
            }, 
            
            child: 
            Text(offer['user']['name'].toString()),),
                     
                     ],)
                     ),
                      Container(
                   margin: EdgeInsets.only(left: 20,right: 20,top: 10),
                   child: Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [ 
                     Text(Languages.of(context).pub_le,style: TextStyle(fontWeight: FontWeight.w300),),
                     Expanded(child: SizedBox()),
                     Text(offer['created_at'].toString(),style: TextStyle(fontWeight: FontWeight.w700),),
                     
                     ],)
                     ),     


                      Container(
                   margin: EdgeInsets.only(left: 20,right: 20,top: 20),
                   child: Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [ 
                     Text(Languages.of(context).vus,style: TextStyle(fontWeight: FontWeight.w300),),
                     Expanded(child: SizedBox()),
                     Column(children: [
                     Text(offer['counter_vues'].toString(),style: TextStyle(fontWeight: FontWeight.w700),),
                     Icon(Icons.visibility_outlined)
                     ],)
                     ],)
                     ),   

                     SizedBox(height: 30,),


                     InkWell(
                       onTap: (){
                   return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Signaler l\'offre'),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text('Voulez vous vraiment signaler cette offre?'),
             // Text('Would you like to approve of this message?'),
            ],
          ),
        ),
        actions: <Widget>[
          Row(children: [
          TextButton(
            child: const Text('Non'),
            onPressed: () {
      Navigator.of(context).pop();
            },
          ),
         Expanded(child:  SizedBox()),
          TextButton(
            child: const Text('Oui'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          ],)
        ],
      );
    },
  );},
                       
                       child:
                      Container(
                        color: Color.fromARGB(75, 228, 224, 224),
                               height: 60,
                               child: Center(child: Icon(Icons.report, color: Colors.grey,),),
                             ),

                     ),
                             SizedBox(height: 10,)   
                                 
                ],
              ),
              ),

        //   SizedBox(height: 20,),
            
        //     TextButton(onPressed: (){
        //           Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //           builder: (context) =>
        //               agence_profile(user_id: offer['user']['id'])));
        //     }, 
            
        //     child: 
        //     Text(offer['user']['name'].toString()),),
        //     Text(offer['price'].toString()),
        //     Text(offer['description'].toString()),
        //     Text(offer.toString()),
           
        //     IconButton(onPressed: (){
        //       _callNumber();
            
        //     }, icon: Icon(Icons.phone,color: Colors.black,size: 80,)),
            
        //  //   Text(offer['category']['Name']),
        //     Text(user.toString()),
            
        //     _buildGridView(),
        //     SizedBox(
        //       height: 20.0,
        //     ),
          ],
        ),
      ),
    );
  }

  // Widget _buildRegisterText() {
  // return Text(
  //   'REGISTER',
  //   textAlign: TextAlign.center,
  //   style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
  // );
  // }



      Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: active_index,
        count: offer['images'].length,
        effect: JumpingDotEffect(
          activeDotColor: Colors.white,
          dotColor: Colors.grey,
          spacing: 10,
          dotHeight: 10,
          dotWidth: 10
        ),
      );







  Widget _buildGridView() {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      childAspectRatio: 1,
      children: List.generate(offer['images'].length, (index) {
        return Card(
          clipBehavior: Clip.antiAlias,
          child: Stack(
            children: <Widget>[
              
              Image.network(
                Api().getOfferImageUrl(offer['images'][index]['id']),
                width: 300,
                height: 300,
              ),
            ],
          ),
        );
      }),
    );
  }

  _loadOfferDetails() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
  LGG=prefs.getString('stringValue');
     
    var response = await Api().getData('/offer/' + widget.offer_id.toString());
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

         var data = {'id': offer['user']['id'].toString()};
        number2 = offer['user']['Phone'].toString();
       
    
   
      var response2 = await Api().postData(data , '/info_user');
    if (response.statusCode == 200) {
      // Future.delayed(Duration(milliseconds: 10)).then((_) {
     // setState(() {
        user = json.decode(response2.body);

    //  });
      // });
    }
  }

 
  _callNumber() async{
  //const number =  number2.toString(); //set the number here
  bool res = await FlutterPhoneDirectCaller.callNumber('0'+number2.toString());
}



     Widget display_images () {
       
        return
        Column(children: [
           ClipPath(
        clipper: CurveClipper(),
           
            child:
          Container(
            
  margin: EdgeInsets.all(0),
  child:
    Stack(children: [
   CarouselSlider.builder(
    itemCount: offer['images'].length,
    options: CarouselOptions(
      enlargeCenterPage: false,
      enlargeStrategy: CenterPageEnlargeStrategy.height,
      height: 300,
      autoPlay: true,
      autoPlayInterval: Duration(seconds: 3),
      reverse: false,
      aspectRatio: 5.0,
     viewportFraction: 1.1,
      onPageChanged: (index,reason){
         setState(() {
           active_index = index;
         });
      }
    ),
    itemBuilder: (context, i, id){
      //for onTap to redirect to another screen
      return 
     
          GestureDetector(
        child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        //     border: Border.all(color: Color.fromARGB(255, 2, 62, 138),)
        ),
          //ClipRRect for image border radius
          child:
             Image.network(
             Api().getOfferImageUrl(offer['images'][i]['id']) ,
            width: 500,
            fit: BoxFit.cover,
            ),
          ),
         
          
        
        onTap: (){
          var url = offer['images'][i];
          print(url.toString());
                          showModalBottomSheet(
                             isScrollControlled: true,
                  backgroundColor: Color.fromARGB(171, 231, 225, 225),  
    context: context,
    builder: (context) {
      return    
             
     CarouselSlider.builder(
    itemCount: offer['images'].length,
    options: CarouselOptions(
      enlargeCenterPage: false,
      enlargeStrategy: CenterPageEnlargeStrategy.height,
      height: MediaQuery.of(context).size.height*1,
      
      autoPlay: true,
      autoPlayInterval: Duration(seconds: 3),
      reverse: false,
      aspectRatio: 5.0,
     viewportFraction: 1.1,
      onPageChanged: (index,reason){
         setState(() {
           active_index = index;
         });
      }
    ),
    itemBuilder: (context, i, id){
      //for onTap to redirect to another screen
      return 
     
          GestureDetector(
        child: Container(
          width: MediaQuery.of(context).size.width*1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        //     border: Border.all(color: Color.fromARGB(255, 2, 62, 138),)
        ),
          //ClipRRect for image border radius
          child:
          
              Stack(children: [
            
             Image.network(
             Api().getOfferImageUrl(offer['images'][i]['id']) ,
            
              width: MediaQuery.of(context).size.width*1,
            fit: BoxFit.cover,
            ),
            Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.9),
            child:
             Row(
        mainAxisAlignment: MainAxisAlignment.center,
       
        children: [ 
        
           buildIndicator(),
          
           ],),
          ),
            ],)
          ),
         
          
        
     
          );
           
        
    },
  );
  
    });
        },
          );
           
        
    },
  ),
  Container(
            margin: EdgeInsets.only(top: 250),
            child:
             Row(
        mainAxisAlignment: MainAxisAlignment.center,
       
        children: [ 
        
           buildIndicator(),
          
           ],),
          ),
          Row(children: [
           Expanded(child:  SizedBox()),
           Container(height: 40,
           width: 40,

                                  margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                                  //padding: EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                    color: Colors.white),
                                 child: IconButton(
                                   onPressed: (() {
                                     check_client_conncet();
                                      if(client_conncet==true){
                                        print("vous etes connecter");
                                      }else{
                                          print("vous devez ce connecter");
                                      }
                                   }),
                                   icon:Icon(Icons.favorite,color: Colors.grey,)))
                                
  
    ],),
    SizedBox(width: 20,)
  ],)
          )
          ),
               
  ],);

     }
     

Widget _build_comment(BuildContext context, int index) {
         return  
         Column(
           
           children: [

    
         Container(margin: EdgeInsets.only(top: 20,left: 10,right: 10),
         child:
        Row(children: [
           ClipOval(child:  Container(
             color:Color.fromARGB(255, 216, 213, 213),
             child:                  
                                 Icon(
                                  Icons.person,
                                  color: Colors.white,
                                  size: 30.0,
                                )
           )
           ),
           SizedBox(width: 10,),
         
         comments['comments']==null?  Text("aucun commentaire")
           :Flexible(child:

           InkWell(child: 
           Container(
             margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color.fromARGB(255, 231, 230, 230),),
             padding: EdgeInsets.only(top: 5,left: 5,right: 5,bottom: 10 ),
             child: 
           Column(
             mainAxisAlignment: MainAxisAlignment.start,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
                  comments['comments'][index]['user']['name'].isEmpty? Container()   :Text(comments['comments'][index]['user']['name'].toString(),style: TextStyle(fontWeight: FontWeight.bold),),
                     SizedBox(height: 10,),
                      Text(comments['comments'][index]['comment'].toString()),
                     
                      
                     
           ],)
           ),
          
           onLongPress: (){
             print(my_id);
          if(my_id==comments['comments'][index]['user']['id'].toString() || offer['user']['id'].toString()==my_id){
                print(my_id);
             showModalBottomSheet(
          shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(10),
        ),
      ),
        isScrollControlled: false,
        context: context,
        builder: (context) {
          return 
       
         Container(color: Colors.white,
         height: 70,
         child:
         InkWell(
           onTap: () {
            // delete_comments(comments['comments']['id'], my_id);
            delete_comments(comments['comments'][index]['id']);
           },
           child:
          Row(children: [
           SizedBox(width: 20,),
           Icon(Icons.delete),
           SizedBox(width: 20,),
           Text("Supprimer commentaire")
         ],),
         )
         );
           }
           );
          }
           },
           
          
             )) ],)
         ),
        
        
         ]);
       
}












get_comments() async {

       
    

     var data3 = {'id': widget.offer_id.toString()};
      
          
     var response3 = await Api().postData(data3 , '/comments/comments');
    if (response3.statusCode == 200) {
       Future.delayed(Duration(milliseconds: 10)).then((_) {
      setState(() {
        comments = json.decode(response3.body);
      //  print(comments);
      
    
      //   print(comments['comments'][0]['user']['name'].toString());

      });
       });
    }  }



      add_comment() async {
              
                SharedPreferences pref = await SharedPreferences.getInstance();         
         token = await pref.getString('token');
         
              print(token);

     
            if (token != null && token.length > 0) {
  token = token.substring(1, token.length - 1);
            }
     var data4 = {'offer_id': widget.offer_id.toString(),'token':await token,'comment':commentController.text};
      
          
     var response3 = await Api().postData(data4 , '/comments/create');
    if (response3.statusCode == 200) {
      setState(() {
        commentController.text="";
       // comments = json.decode(response3.body);
      //  print(comments);
         Navigator.pop(context);
    
        // print(comments['comments'][0]['user']['name'].toString());
         
       
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Commentaires ajout??e")));

        get_comments();
      
      });
 

    }else{
       setState(() {
         Navigator.pop(context);
       deconnexion ();
        check_agence_connenct();
        check_client_conncet();
         });
    }
    }
    
     delete_comments(int comment_id) async {
             SharedPreferences pref = await SharedPreferences.getInstance();         
             token = await pref.getString('token');
            if (token != null && token.length > 0) {
            token = token.substring(1, token.length - 1);
            }
   

     var data3 = {'comment_id': comment_id.toString() , 'token':token};
      
          
     var response3 = await Api().postData(data3 , '/comments/delete');
    if (response3.statusCode == 200) {
      setState(() {
       Navigator.pop(context);
    
        print('comment supprimer');
        
         get_comments();
         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Commentaires supprimer")));

      });
      Navigator.pop(context);
    }  }
    


    get_id () async{
         
                SharedPreferences pref = await SharedPreferences.getInstance();         
         token = await pref.getString('token');
         
              print(token);

     
            if (token != null && token.length > 0) {
  token = token.substring(1, token.length - 1);
            }
     var data4 = {'token': token,};
      
          
     var response3 = await Api().postData(data4 , '/get_my_id');
    if (response3.statusCode == 200) {
         
          my_id=json.decode(response3.body).toString();
    }else{
      // Future.delayed(Duration(milliseconds: 10)).then((_) {
      //setState(() {
       deconnexion ();
        check_agence_connenct();
        check_client_conncet();
      //   });
      // });
    }
    
    }
}

 









class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = new Path();
     // path starts with (0.0, 0.0) point (1)
    path.lineTo(0.0, size.height - 30);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 30);
    path.lineTo(size.width, 0.0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }










}
