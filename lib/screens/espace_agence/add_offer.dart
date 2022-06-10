import 'dart:ffi';
import 'dart:convert';
import 'dart:io';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_6/localization/language/languages.dart';
import 'package:flutter_application_6/model/api.dart';
import 'package:flutter_application_6/model/variables.dart';
import 'package:flutter_application_6/screens/MapView.dart';
import 'package:flutter_application_6/screens/espace_agence/switching_agence.dart';
import 'package:flutter_application_6/screens/espace_client/dep.dart';
import 'package:flutter_application_6/screens/espace_client/page_agences.dart';
import 'package:flutter_application_6/screens/espace_client/page_param.dart';
import 'package:flutter_application_6/screens/espace_client/pages_favoris.dart';
import 'package:flutter_application_6/screens/espace_client/switching_page.dart';
import 'package:flutter_application_6/widgets/toggle_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:math' as math;
import 'package:line_icons/line_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';



class add_offer extends StatefulWidget {
  @override
  add_offerState createState() {
    return add_offerState();
  }
}

@override
void initState() {
  func();
    
}

var titleController = TextEditingController();
var priceController = TextEditingController();
var chambresController = TextEditingController();
var superficieController = TextEditingController();
var nbr_etagesController = TextEditingController();
var num_etagesController = TextEditingController();
var descriptionController = TextEditingController();
var nbr_cuisine = TextEditingController();
var nbr_sbain = TextEditingController();


bool pressAttention = true;

class add_offerState extends State<add_offer> {
  List<bool> ess = [false, false, false, false];
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();
  bool a = true;
  bool b = false;
  bool c = false;
  bool d = true;
  bool e = false;
  bool f = false;
  bool g = true;
  bool h = false;
  bool i = false;
  bool j = true;
  bool k = false;
  bool l = false;
  bool m = true;
  bool n = false;
  bool eau = false;
  bool elec = false;
  bool gaz = false;
  bool vente = true;
bool Promotion_immobiliere = false;
bool Acte_notarie = false;
bool Livret_foncie = false;

  String var1 = "Sans";
  String var2 = "Sans";
  String var3 = "Sans";
  String var4 = "Sans";
  String var5 = "Non disponible";
  bool var6 = false;
  String var7 = "";
  int var8 = 0;
  String var9 = "";
  int var10 = 0;
  String var11 = "Tous Les Prix";
  List<bool> data = [true, false, false, false , false];
  String text = "gr";
  String id;
  String token;
  String category_id = "1";
  var categories = [];
 List<bool> name_categories = [true,false,false,false,false,false,false,false];
  List<XFile> images = [];
  ImagePicker _picker = ImagePicker();
  var price;
  var title;
  var description;
  String var_services = "Aucun";
  String var_papiers = "Aucun";

   @override
  void initState() {
    _loadCategories();
    
  }


  void construction(bool X, bool Y, bool Z) {
    if (X && Y && Z) {
      var_services = "Eau,Elec,Gaz";
    }
    if (X && Y && !Z) {
      var_services = "Eau,Elec";
    }
    if (X && !Y && Z) {
      var_services = "Eau,gaz";
    }
    if (!X && Y && Z) {
      var_services = "Elec,Gaz";
    }
    if (X && !Y && !Z) {
      var_services = "Eau";
    }
    if (!X && Y && !Z) {
      var_services = "Elec";
    }
    if (!X && !Y && Z) {
      var_services = "Gaz";
    }
    if (!X && !Y && !Z) {
      var_services = "Aucun";
    }
  }



   void papiers(bool X, bool Y, bool Z) {
    if (X && Y && Z) {
      var_papiers = "Promotion immobilière,Acte notarié,Livret foncier";
    }

    if (X && Y && !Z) {
      var_papiers = "Promotion immobilière,Acte notarié";
    }

    if (X && !Y && Z) {
      var_papiers = "Promotion immobilière,Livret foncier";
    }

    if (!X && Y && Z) {
      var_papiers = "Acte notarié,Livret foncier";
    }
    
    if (X && !Y && !Z) {
     var_papiers = "Promotion immobilière,Livret foncier";
    }
    
    if (!X && Y && !Z) {
      var_papiers = "Acte notarié";
    }
    
    if (!X && !Y && Z) {
      var_papiers = "Livret foncier";
    }
    
    if (!X && !Y && !Z) {
      var_papiers = "Aucun";
    }
    
  }

  void construction2() {
    if (var7 == "") {
      var8 = 0;
      if (var7 == "") {
        var11 = "Tous Les Prix";
      }
      construction3();
    } else {
      var8 = int.parse(var7);
      construction3();
    }
    if (var9 == "") {
      var10 = 0;
      if (var9 == "") {
        var11 = "Tous Les Prix";
      }
      construction3();
    } else {
      var10 = int.parse(var9);
      construction3();
    }
  }

  void construction3() {
    if (var8 > var10) {
      var11 = ('à partir de ' + var8.toString() + ' Millions cent');
    }
    if (var8 > 0 && var10 > var8) {
      var11 = ("entre " +
          var8.toString() +
          "-" +
          var10.toString() +
          " Millions cent");
    }
    if (var10 > 0 && var8 == 0) {
      var11 = "à " + var10.toString() + " millions cent";
    }
  }




String price1 (int nb ) {
 int ib= 1000000;
 int m = 0;
int k = 0;
while(ib >= 1000 ){

if (nb>1000000 && ib>1000) {

   m = nb ~/ ib; 
   nb = nb - 1000000*m;
  
}
if (ib == 1000 && nb>1000) {
  k = nb  ~/ ib; 
}

   ib = ib ~/ 1000 ;
}
  if(m==0 && k == 0){
    return((nb % 1000).toString());
  }else if(k > 0 && m==0)
  return(k.toString()+"k " + (nb % 1000).toString());
  else if (m>0 && k == 0)
   return(m.toString()+"m " + (nb % 1000).toString());

     return(m.toString() + "m"  +  k.toString()+"k " + (nb % 1000).toString());
   
    
}

  @override
  Widget build(BuildContext context) {
    Widget boardView = Container(
      child: Stack(
        children: [
          Container(
            alignment: Alignment(align_x, align_y),
            // alignment: Alignment(0.999, -0.9),
            // child: Image.asset(
            //   var_image,

            // ),
          ),
          //color: Colors.blue,
          ListView(scrollDirection: Axis.vertical, children: <Widget>[
            Container(
              child:

                  //Column(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  // children: <Widget>[

                  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //                Container(child:  IconButton(
                  //          icon: new Icon(Icons.arrow_back_ios_new_sharp, size: 40, color:Colors.black ,),
                  //         onPressed: () {
                  //           Navigator.push(
                  //  context,
                  //  MaterialPageRoute(builder: (context) =>  switching_page()),);
                  //         }
                  //           ),
                  //           ),
                  Row(
                   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: 40,
                            // top: var_margin,
                            left: 15.0,
                            right: 25.0,
                            bottom: 10),
                        // padding: EdgeInsets.all(10.0),

                        child: 
                        
                        ToggleButton(
                          width: 140.0,
                          height: 35.0,
                          toggleBackgroundColor:
                              Color.fromARGB(144, 151, 172, 196),
                          toggleBorderColor: (Colors.grey[350]),
                          // toggleColor: (Colors.white)!,
                          toggleColor: (Color.fromARGB(255, 73, 80, 87)),
                          activeTextColor: Colors.white, 
                          inactiveTextColor: Colors.black,
                          leftDescription: Languages.of(context).vente,
                          rightDescription: Languages.of(context).loc,

                          onLeftToggleActive: () {
                            print('left toggle activated');
                            vente = true;
                          },
                          onRightToggleActive: () {
                            print('right toggle activated');
                            vente = false;
                          },
                        ),
                      ),
                      Expanded(child: SizedBox()),
                       Container(
                        //width: 170,
                      // color: Colors.red,
                       height: 30,
                         margin: EdgeInsets.only(
                            top: 40,
                              right:15 ,
                              left: 15,
                            bottom: 10),
                        child:  Image(image: AssetImage('assets/Imran.png'))
                      )
                      
                    ],
                  ),

                  Container(
                    margin: const EdgeInsets.only(
                        top: 25.0, left: 15, right: 15, bottom: 10),

                    //  height: 127.0,
                    child: Row(
                      
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        
                           InkWell(
                           
                            //  splashColor: Colors.white,
                            //  highlightColor: Colors.white,
                            child: Container(
                              // height: 50,
                              // width: 50,

                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.home,
                                        color: data[0]
                                            ? Color.fromARGB(255, 73, 80, 87)
                                            : Color.fromARGB(255,222, 226, 230),
                                        size: 30,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Text(Languages.of(context).maison,
                                      style: TextStyle(
                                          color: data[0]
                                     
                                              ? Color.fromARGB(255, 73, 80, 87)
                                              : Color.fromARGB(255,222, 226, 230),
                                          fontSize: 12,
                                          fontWeight: data[0]
                                              ? FontWeight.bold
                                              : FontWeight.normal))
                                ],
                              ),
                            ),
                            onTap: () => setState(
                                () { data = [true, false, false, false,false];
                                category_id=1.toString();
                                
                              }),
                          ),
                        
                        Container(
                          child: InkWell(
                           
                            //  splashColor: Colors.white,
                            //  highlightColor: Colors.white,
                            child: Container(
                              // height: 50,
                              // width: 50,

                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.apartment,
                                        color: data[1]
                                            ? Color.fromARGB(255, 73, 80, 87)
                                            : Color.fromARGB(255,222, 226, 230),
                                        size: 35,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.center,

                                   children: [
                                   
                                      Text(Languages.of(context).apart,
                                      style: TextStyle(
                                          color: data[1]
                                              ? Color.fromARGB(255, 73, 80, 87)
                                              : Color.fromARGB(255,222, 226, 230),
                                          fontSize: 12,
                                          fontWeight: data[1]
                                              ? FontWeight.bold
                                              : FontWeight.normal))
                                              ],)
                                 
                                ],
                              ),
                            ),
                            onTap: () => setState(
                                () {data = [false, true, false, false,false];
                                 category_id=2.toString();
                                }),
                          ),
                        ),
                        Container(
                          child: InkWell(
                            
                            //  splashColor: Colors.white,
                            //  highlightColor: Colors.white,
                            child: Container(
                              // height: 50,
                              // width: 50,

                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.warehouse,
                                        color: data[2]
                                            ? Color.fromARGB(255, 73, 80, 87)
                                            : Color.fromARGB(255,222, 226, 230),
                                        size: 30,
                                      ),
                                    ],
                                  ),

                                  // color: pressAttention ? Colors.grey : Colors.blue,
                                  //  onPressed: () => setState(() => pressAttention = !pressAttention),
                                  //   color: Color.fromARGB(255, 134, 134, 134),
                                  //  iconSize: 60,
                                  //  tooltip: 'Toggle Bluetooth',
                                  // splashColor:Colors.red,
                                  SizedBox(
                                    height: 6,
                                  ),
                                  

                              
                                     Row(  mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                       
                                  Text(Languages.of(context).garage,
                                      style: TextStyle(
                                          color: data[2]
                                              ? Color.fromARGB(255, 73, 80, 87)
                                              : Color.fromARGB(255,222, 226, 230),
                                          fontSize: 12,
                                          fontWeight: data[2]
                                              ? FontWeight.bold
                                              : FontWeight.normal))
                                              ],)
                                ],
                              ),
                            ),
                            onTap: () => setState(
                                (){ data = [false, false, true, false,false];
                                
                                 category_id=3.toString();
                                }),
                          ),
                        ),
                        Container(
                          child: InkWell(
                          
                            //  splashColor: Colors.white,
                            //  highlightColor: Colors.white,
                            child: Container(
                              // height: 50,
                              // width: 50,

                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.villa,
                                        color: data[3]
                                            ? Color.fromARGB(255, 73, 80, 87)
                                            : Color.fromARGB(255,222, 226, 230),
                                        size: 40,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 1,
                                  ),
                                  Text(Languages.of(context).villa,
                                      style: TextStyle(
                                          color: data[3]
                                              ? Color.fromARGB(255, 73, 80, 87)
                                              : Color.fromARGB(255,222, 226, 230),
                                          fontSize: 12,
                                          fontWeight: data[3]
                                              ? FontWeight.bold
                                              : FontWeight.normal))
                                ],
                              ),
                            ),
                            onTap: () => setState(
                                () { data = [false, false, false, true,false];
                                   category_id=4.toString();
                                }),
                          ),
                        ),
                        Container(
                          child: InkWell(
                            borderRadius: BorderRadius.circular(20),
                            //  splashColor: Colors.white,
                            //  highlightColor: Colors.white,
                            child: Container(
                              // height: 50,
                              // width: 50,

                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.plus,
                                        color: data[4]
                                            ? Color.fromARGB(255, 73, 80, 87)
                                            : Color.fromARGB(255,222, 226, 230),
                                        size: 35,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(Languages.of(context).other,
                                      style: TextStyle(
                                          color: data[4]
                                              ? Color.fromARGB(255, 73, 80, 87)
                                              : Color.fromARGB(255,222, 226, 230),
                                          fontSize: 12,
                                          fontWeight: data[4]
                                              ? FontWeight.bold
                                              : FontWeight.normal))
                                ],
                              ),
                            ),
                            onTap: () => setState(
                                () {data = [false, false, false, false,true];
                                   category_id=1.toString();
                                }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

                
                
               
           Visibility(
             visible: data[4],
             child: 
            Container(
              margin: const EdgeInsets.only(top: 10.0, left: 15, right: 15),
              decoration: BoxDecoration(
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
              /** CheckboxListTile Widget **/
              child:
               ExpansionTile(
                  title: Text(
                    Languages.of(context).categories,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    // style: TextStyle(color: Color.fromARGB(255, 73, 80, 87)),
                  ),
                  subtitle: Text(
                    (Languages.of(context).list_of_cat),
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 73, 80, 87)),
                  ),
                  children: [
                   ListView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                     scrollDirection: Axis.vertical,
          itemBuilder: _buildOfferItem,
          itemCount: categories.length,),
           ] 
           ),
            ),
           ),







            Container(
              height: 70,
                margin: const EdgeInsets.only(top: 10.0, left: 15, right: 15),
                decoration: BoxDecoration(
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
                ), //BoxDecoration

                child:
                 Row(
                      children: [
                        SizedBox(width: 20,),
                        Container(
                      
                          child: Text(
                              Languages.of(context).title,
                              style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15)
                           ),
                          
                        ),
                          SizedBox(width: 20,),
                          Expanded(child: 
                        Container(
                          margin: const EdgeInsets.only(
                              left: 15.0,
                              bottom: 10),
                          padding: const EdgeInsets.only(
                            top: 10,
                          ),
                          height: 50,
                          width: 120,
                          child: TextFormField(
                            
                           maxLength: 45,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                hintText: Languages.of(context).title_of_offer,
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 173, 181, 189)),
                              ),
                             

                               controller: titleController,
                              //  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                              
                              // keyboardType: TextInputType.numberWithOptions(decimal: true),
                             // keyboardType: TextInputType.phone,
                              ),
                        ),
                       
                          ),
                       SizedBox(width: 30,)
                      ],
                    )
                        
                ),





               

            Container(
              height: 70,
                margin: const EdgeInsets.only(top: 10.0, left: 15, right: 15),
                decoration: BoxDecoration(
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
                ), //BoxDecoration

                child:
                 Row(
                      children: [
                        SizedBox(width: 20,),
                        Container(
                      
                          child: Text(
                              Languages.of(context).price,
                              style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15)
                           ),
                          
                        ),
                          SizedBox(width: 20,),
                          Expanded(child: 
                        Container(
                          margin: const EdgeInsets.only(
                              left: 15.0,
                              bottom: 10),
                          padding: const EdgeInsets.only(
                            top: 10,
                          ),
                          height: 50,
                          width: 120,
                          child: TextFormField(
                            controller: priceController,
                             keyboardType: TextInputType.phone,
                           
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                hintText: '340,000,000  '+Languages.of(context).da,
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 173, 181, 189)),
                              ),
                             

                              ),
                        ),
                       
                          ),
                       SizedBox(width: 30,)
                      ],
                    )
                        
                ),


                 
                   


     Visibility(
                     visible: data[0] || data[1] || data[3] || data[4],
                     child: 
                      Container(
              height: 70,
                margin: const EdgeInsets.only(top: 10.0, left: 15, right: 15),
                decoration: BoxDecoration(
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
                ), //BoxDecoration

                child:
                 Row(
                      children: [
                        SizedBox(width: 20,),
                        Container(
                      
                          child: Text(
                              Languages.of(context).cuisine,
                              style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15)
                           ),
                          
                        ),
                          SizedBox(width: 20,),
                          Expanded(child: 
                        Container(
                          margin: const EdgeInsets.only(
                              left: 15.0,
                              bottom: 10),
                          padding: const EdgeInsets.only(
                            top: 10,
                          ),
                          height: 50,
                          width: 120,
                          child: TextFormField(
                            controller: nbr_cuisine,
                             keyboardType: TextInputType.phone,
                            inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                            ],
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                
                                hintText: '2 '+Languages.of(context).cuisine,
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 173, 181, 189)),
                              ),
                             

                              ),
                        ),
                       
                          ),
                       SizedBox(width: 30,)
                      ],
                    )
                      )      
                ),




         Visibility(
                     visible: data[0] || data[1] || data[3] || data[4],
                     child: 
                      Container(
              height: 70,
                margin: const EdgeInsets.only(top: 10.0, left: 15, right: 15),
                decoration: BoxDecoration(
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
                ), //BoxDecoration

                child:
                 Row(
                      children: [
                        SizedBox(width: 20,),
                        Container(
                      
                          child: Text(
                              Languages.of(context).s_bain,
                              style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15)
                           ),
                          
                        ),
                          SizedBox(width: 20,),
                          Expanded(child: 
                        Container(
                          margin: const EdgeInsets.only(
                              left: 15.0,
                              bottom: 10),
                          padding: const EdgeInsets.only(
                            top: 10,
                          ),
                          height: 50,
                          width: 120,
                          child: TextFormField(
                            controller: nbr_sbain,
                             keyboardType: TextInputType.phone,
                            inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                            ],
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                
                                hintText: '3 '+Languages.of(context).s_bain,
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 173, 181, 189)),
                              ),
                             

                              ),
                        ),
                       
                          ),
                       SizedBox(width: 30,)
                      ],
                    )
                      )      
                ),



                 Visibility(
                     visible: data[0] || data[1] || data[3] || data[4],
                     child: 
                      Container(
              height: 70,
                margin: const EdgeInsets.only(top: 10.0, left: 15, right: 15),
                decoration: BoxDecoration(
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
                ), //BoxDecoration

                child:
                 Row(
                      children: [
                        SizedBox(width: 20,),
                        Container(
                      
                          child: Text(
                              Languages.of(context).chambres,
                              style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15)
                           ),
                          
                        ),
                          SizedBox(width: 20,),
                          Expanded(child: 
                        Container(
                          margin: const EdgeInsets.only(
                              left: 15.0,
                              bottom: 10),
                          padding: const EdgeInsets.only(
                            top: 10,
                          ),
                          height: 50,
                          width: 120,
                          child: TextFormField(
                            controller: chambresController,
                             keyboardType: TextInputType.phone,
                            inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                            ],
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                
                                hintText: '3 '+Languages.of(context).chambres,
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 173, 181, 189)),
                              ),
                             

                              ),
                        ),
                       
                          ),
                       SizedBox(width: 30,)
                      ],
                    )
                      )      
                ),


                  Container(
              height: 70,
                margin: const EdgeInsets.only(top: 10.0, left: 15, right: 15),
                decoration: BoxDecoration(
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
                ), //BoxDecoration

                child:
                 Row(
                      children: [
                        SizedBox(width: 20,),
                        Container(
                      
                          child: Text(
                              Languages.of(context).Superficie_add_offer,
                              style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15)
                           ),
                          
                        ),
                          SizedBox(width: 20,),
                          Expanded(child: 
                        Container(
                          margin: const EdgeInsets.only(
                              left: 15.0,
                              bottom: 10),
                          padding: const EdgeInsets.only(
                            top: 10,
                          ),
                          height: 50,
                          width: 120,
                          child: TextFormField(
                            controller: superficieController,
                             keyboardType: TextInputType.phone,
                               inputFormatters: <TextInputFormatter>[
                             FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                                         ],
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                hintText: '120 '+Languages.of(context).superficie,
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 173, 181, 189)),
                              ),
                             

                              ),
                        ),
                       
                          ),
                       SizedBox(width: 30,)
                      ],
                    )
                        
                ),


           Visibility(
             visible: data[0] || data[3] || data[4],
             child: 
                   Container(
              height: 70,
                margin: const EdgeInsets.only(top: 10.0, left: 15, right: 15),
                decoration: BoxDecoration(
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
                ), //BoxDecoration

                child:
                 Row(
                      children: [
                        SizedBox(width: 20,),
                        Container(
                      
                          child: Text(
                              Languages.of(context).nbr_etages,
                              style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15)
                           ),
                          
                        ),
                          SizedBox(width: 20,),
                          Expanded(child: 
                        Container(
                          margin: const EdgeInsets.only(
                              left: 15.0,
                              bottom: 10),
                          padding: const EdgeInsets.only(
                            top: 10,
                          ),
                          height: 50,
                          width: 120,
                          child: TextFormField(
                            controller: nbr_etagesController,
                             keyboardType: TextInputType.phone,
                               inputFormatters: <TextInputFormatter>[
                             FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                                         ],
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                hintText: '3',
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 173, 181, 189)),
                              ),
                             

                              ),
                        ),
                       
                          ),
                       SizedBox(width: 30,)
                      ],
                    )
                   )
                ),


                          Visibility(
                            visible:  data[1] || data[4],
                            child: 
                            Container(
              height: 70,
                margin: const EdgeInsets.only(top: 10.0, left: 15, right: 15),
                decoration: BoxDecoration(
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
                ), //BoxDecoration

                child:
                 Row(
                      children: [
                        SizedBox(width: 20,),
                        Container(
                      
                          child: Text(
                              Languages.of(context).num_etage,
                              style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15)
                           ),
                          
                        ),
                          SizedBox(width: 20,),
                          Expanded(child: 
                        Container(
                          margin: const EdgeInsets.only(
                              left: 15.0,
                              bottom: 10),
                          padding: const EdgeInsets.only(
                            top: 10,
                          ),
                          height: 50,
                          width: 120,
                          child: TextFormField(
                            controller: num_etagesController,
                             keyboardType: TextInputType.phone,
                               inputFormatters: <TextInputFormatter>[
                             FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                                         ],
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                hintText: '2 eme etage',
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 173, 181, 189)),
                              ),
                             

                              ),
                        ),
                       
                          ),
                       SizedBox(width: 30,)
                      ],
                    )
                            )
                ),


                                    Container(
              margin: const EdgeInsets.only(top: 10.0, left: 15, right: 15),
              decoration: BoxDecoration(
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
              /** CheckboxListTile Widget **/
              child: ExpansionTile(
                  title: Text(
                    Languages.of(context).service_util,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    var_services,
                    style: TextStyle(color: Color.fromARGB(255, 73, 80, 87)),
                  ),
                  children: <Widget>[
                    CheckboxListTile(
                      activeColor: Color.fromARGB(255, 73, 80, 87),
                      title: Text(
                        Languages.of(context).eau,
                        style:
                            TextStyle(color: Color.fromARGB(255, 73, 80, 87)),
                      ),
                      value: eau,
                      onChanged: (bool value) {
                        setState(() {
                          
                          eau = !eau;
                          construction(eau, elec, gaz);
                        });
                      },
                    ),


                   CheckboxListTile(
                      activeColor: Color.fromARGB(255, 73, 80, 87),
                      title: Text(
                        Languages.of(context).elect,
                        style:
                            TextStyle(color: Color.fromARGB(255, 73, 80, 87)),
                      ),
                      value: elec,
                      onChanged: (bool value) {
                        setState(() {
                          
                          elec = !elec;
                          construction(eau, elec, gaz);
                        });
                      },
                    ),
                  

                  CheckboxListTile(
                      activeColor: Color.fromARGB(255, 73, 80, 87),
                      title: Text(
                        Languages.of(context).gaz,
                        style:
                            TextStyle(color: Color.fromARGB(255, 73, 80, 87)),
                      ),
                      value: gaz,
                      onChanged: (bool value) {
                        setState(() {
                          gaz = !gaz;
                          construction(eau, elec, gaz);
                        });
                      },
                    ),
                   
                  ]), 
            ),


                     Visibility(
                       visible: data[0] || data[1] || data[3] || data[4] ,
                       child: 
                           Container(
              margin: const EdgeInsets.only(top: 10.0, left: 15, right: 15),
              decoration: BoxDecoration(
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
              /** CheckboxListTile Widget **/
              child: ExpansionTile(
                  title: Text(
                    Languages.of(context).meubles,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    var4,
                    style: TextStyle(color: Color.fromARGB(255, 73, 80, 87)),
                  ),
                  children: <Widget>[
                    CheckboxListTile(
                      activeColor: Color.fromARGB(255, 73, 80, 87),
                      title: Text(
                        Languages.of(context).sans,
                        style:
                            TextStyle(color: Color.fromARGB(255, 73, 80, 87)),
                      ),
                      value: j,
                      onChanged: (bool value) {
                        setState(() {
                          if (j == false) {
                            j = !j;
                          }
                          k = false;
                          l = false;
                          var4 = "Sans";
                        });
                      },
                    ),
                    CheckboxListTile(
                      activeColor: Color.fromARGB(255, 73, 80, 87),
                      title: Text(
                        Languages.of(context).avec,
                        style:
                            TextStyle(color: Color.fromARGB(255, 73, 80, 87)),
                      ),
                      value: k,
                      onChanged: (bool value) {
                        setState(() {
                          if (k == false) {
                            k = !k;
                          }
                          j = false;
                          l = false;
                          var4 = "Avec";
                        });
                      },
                    ),
                  
                   
                  ]), 
            ),
                     ),



                Visibility(
                  visible: data[0] || data[1] || data[3] || data[4] ,
                  child: 
            Container(
              margin: const EdgeInsets.only(top: 10.0, left: 15, right: 15),
              decoration: BoxDecoration(
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

              /** CheckboxListTile Widget **/
              child: ExpansionTile(
                  title: Text(
                    Languages.of(context).garage,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    var1,
                    style: TextStyle(color: Color.fromARGB(255, 73, 80, 87)),
                  ),
                  children: <Widget>[
                    CheckboxListTile(
                      activeColor: Color.fromARGB(255, 73, 80, 87),
                      title: Text(
                        Languages.of(context).sans,
                        style:
                            TextStyle(color: Color.fromARGB(255, 73, 80, 87)),
                      ),
                      value: a,
                      onChanged: (bool value) {
                        setState(() {
                        
                           if (a == false) {
                            a = !a;
                          }
                          b = false;
                         
                          var1 = "Sans";
                        });
                      },
                    ),
                    CheckboxListTile(
                      activeColor: Color.fromARGB(255, 73, 80, 87),
                      title: Text(
                        'avec',
                        style:
                            TextStyle(color: Color.fromARGB(255, 73, 80, 87)),
                      ),
                      value: b,
                      onChanged: (bool value) {
                        setState(() {
                           if (b == false) {
                            b = !b;
                          }
                          a = false;
                        
                          var1 = "Avec";
                        });
                      },
                    ),
                  
                  ]), 
                  )
            ),



            Visibility(
              visible: data[0] ||data[3] || data[4],
              child: 
            Container(
              margin: const EdgeInsets.only(top: 10.0, left: 15, right: 15),
              decoration: BoxDecoration(
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
              /** CheckboxListTile Widget **/
              child: ExpansionTile(
                  title: Text(
                    Languages.of(context).jardin,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    var2,
                    style: TextStyle(color: Color.fromARGB(255, 73, 80, 87)),
                  ),
                  children: <Widget>[
                    CheckboxListTile(
                      activeColor: Color.fromARGB(255, 73, 80, 87),
                      title: Text(
                        Languages.of(context).sans,
                        style:
                            TextStyle(color: Color.fromARGB(255, 73, 80, 87)),
                      ),
                      value: d,
                      onChanged: (bool value) {
                        setState(() {
                          if (d == false) {
                            d = !d;
                          }
                          e = false;
                          
                          var2 = "Sans ";
                        });
                      },
                    ),


                     CheckboxListTile(
                      activeColor: Color.fromARGB(255, 73, 80, 87),
                      title: Text(
                        'Avec',
                        style:
                            TextStyle(color: Color.fromARGB(255, 73, 80, 87)),
                      ),
                      value: e,
                      onChanged: (bool value) {
                        setState(() {
                          if (e == false) {
                            e = !e;
                          }
                          d = false;
                          
                          var2 = "Avec ";
                        });
                      },
                    ),
                  
                  
                  ]), 
            )
            ),


             Visibility(
              child: Container(
                margin: const EdgeInsets.only(top: 10.0, left: 15, right: 15),
                decoration: BoxDecoration(
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

                /** CheckboxListTile Widget **/
                child: ExpansionTile(
                    title: Text(
                     Languages.of(context).parking,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      var5,
                      style: TextStyle(color: Color.fromARGB(255, 73, 80, 87)),
                    ),
                    children: <Widget>[
                      CheckboxListTile(
                        activeColor: Color.fromARGB(255, 73, 80, 87),
                        title: Text(
                          'Non disponible',
                          style:
                              TextStyle(color: Color.fromARGB(255, 73, 80, 87)),
                        ),
                        value: m,
                        onChanged: (bool value) {
                          setState(() {
                            if (m == false) {
                              m = !m;
                            }
                            n = false;
                           
                            var5 = "Non disponible";
                          });
                        },
                      ),
                    
                    CheckboxListTile(
                        activeColor: Color.fromARGB(255, 73, 80, 87),
                        title: Text(
                          'Disponible',
                          style:
                              TextStyle(color: Color.fromARGB(255, 73, 80, 87)),
                        ),
                        value: n,
                        onChanged: (bool value) {
                          setState(() {
                            if (n == false) {
                              n = !n;
                            }
                            m = false;
                           
                            var5 = "Disponible";
                          });
                        },
                      ),
                      
                    ]), //CheckboxListTile
              ),
              visible: data[1] ||  data[4],
            ),




            Visibility(
              child: Container(
                margin: const EdgeInsets.only(top: 10.0, left: 15, right: 15),
                decoration: BoxDecoration(
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

                /** CheckboxListTile Widget **/
                child: ExpansionTile(
                    title: Text(
                      Languages.of(context).piscine,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      var3,
                      style: TextStyle(color: Color.fromARGB(255, 73, 80, 87)),
                    ),
                    children: <Widget>[
                      CheckboxListTile(
                        activeColor: Color.fromARGB(255, 73, 80, 87),
                        title: Text(
                          Languages.of(context).sans,
                          style:
                              TextStyle(color: Color.fromARGB(255, 73, 80, 87)),
                        ),
                        value: g,
                        onChanged: (bool value) {
                          setState(() {
                            if (g == false) {
                              g = !g;
                            }
                            h = false;
                           
                            var3 = "Sans";
                          });
                        },
                      ),
                    
                    CheckboxListTile(
                        activeColor: Color.fromARGB(255, 73, 80, 87),
                        title: Text(
                          Languages.of(context).avec,
                          style:
                              TextStyle(color: Color.fromARGB(255, 73, 80, 87)),
                        ),
                        value: h,
                        onChanged: (bool value) {
                          setState(() {
                            if (h == false) {
                              h = !h;
                            }
                            g = false;
                           
                            var3 = "Avec";
                          });
                        },
                      ),
                      
                    ]), //CheckboxListTile
              ),
              visible: data[0] || data[3] || data[4],
            ),



                                    Container(
              margin: const EdgeInsets.only(top: 10.0, left: 15, right: 15),
              decoration: BoxDecoration(
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
              /** CheckboxListTile Widget **/
              child: ExpansionTile(
                  title: Text(
                    Languages.of(context).doc,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    var_papiers,
                    style: TextStyle(color: Color.fromARGB(255, 73, 80, 87)),
                  ),
                  children: <Widget>[
                    CheckboxListTile(
                      activeColor: Color.fromARGB(255, 73, 80, 87),
                      title: Text(
                        Languages.of(context).promo,
                        style:
                            TextStyle(color: Color.fromARGB(255, 73, 80, 87)),
                      ),
                      value: Promotion_immobiliere,
                      onChanged: (bool value) {
                        setState(() {
                          
                          Promotion_immobiliere = !Promotion_immobiliere;
                          papiers(Promotion_immobiliere, Acte_notarie, Livret_foncie);
                        });
                      },
                    ),


                   CheckboxListTile(
                      activeColor: Color.fromARGB(255, 73, 80, 87),
                      title: Text(
                        Languages.of(context).act,
                        style:
                            TextStyle(color: Color.fromARGB(255, 73, 80, 87)),
                      ),
                      value: Acte_notarie,
                      onChanged: (bool value) {
                        setState(() {
                          
                          Acte_notarie = !Acte_notarie;
                         papiers(Promotion_immobiliere, Acte_notarie, Livret_foncie);
                        });
                      },
                    ),
                  

                  CheckboxListTile(
                      activeColor: Color.fromARGB(255, 73, 80, 87),
                      title: Text(
                        Languages.of(context).livret,
                        style:
                            TextStyle(color: Color.fromARGB(255, 73, 80, 87)),
                      ),
                      value: Livret_foncie,
                      onChanged: (bool value) {
                        setState(() {
                          Livret_foncie = !Livret_foncie;
                           papiers(Promotion_immobiliere, Acte_notarie, Livret_foncie);
                        });
                      },
                    ),
                   
                  ]), 
            ),






                        
                            Container(
                              margin: EdgeInsets.only(top: 10,left: 15, right: 15),
                              
                              child:
                              Form(child: 
                               TextField(
                                 controller: descriptionController,
                                  onChanged: (value) {
                               description = value;
                                 },
                                   keyboardType: TextInputType.multiline,
                                   maxLines: 8,
                               // controller: emailController,
                                decoration: //ThemeHelper().textInputDecoration('User Name', 'Enter your user name'),
                               
                              InputDecoration(
                                
                              labelText: Languages.of(context).description,
                              hintText: Languages.of(context).enter_description,
                              fillColor: Colors.white,
                              filled: true,
                              prefixIcon: Padding(
                              padding: EdgeInsets.only(top: 0), // add padding to adjust icon
                              child: Icon(Icons.description),
                              
                              ),
                                contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide(color: Color.fromARGB(255, 2, 62, 138))),
                                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide(color: Colors.grey.shade400)),
                                errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide(color: Colors.red, width: 2.0)),
                              focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide(color: Colors.red, width: 2.0)),
                                )
                              ),
                              ),
                              decoration:BoxDecoration(boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 20,
        offset: const Offset(0, 5),
      )
    ])
                            ),

               InkWell(
                 onTap: (){
                   Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => MapView()),
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
                Text(Languages.of(context).set_location, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold , fontSize: 18)),
                   SizedBox(width: 10,),
                   Icon(Icons.map)
                ],)
                ),
               ),



                       Container(
              height: 70,
                margin: const EdgeInsets.only(top: 10.0, left: 15, right: 15),
                decoration: BoxDecoration(
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
                ), //BoxDecoration

                child:
                 Row(
                      children: [
                        SizedBox(width: 20,),
                        Container(
                      
                          child: Text(
                              Languages.of(context).adresse,
                              style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15)
                           ),
                          
                        ),
                          SizedBox(width: 20,),
                          Expanded(child: 
                        Container(
                          margin: const EdgeInsets.only(
                              left: 15.0,
                              bottom: 10),
                          padding: const EdgeInsets.only(
                            top: 0,
                          ),
                          height: 50,
                          width: 120,
                          child: TextFormField(
                               
                            // maxLength: 70,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                hintText: Languages.of(context).add_of_offer,
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 173, 181, 189)),
                              ),
                             

                               controller: adresseController,
                              //  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                              
                              // keyboardType: TextInputType.numberWithOptions(decimal: true),
                             // keyboardType: TextInputType.phone,
                              ),
                        ),
                       
                          ),
                       SizedBox(width: 30,)
                      ],
                    )
                        
                ),



                      InkWell(
                        highlightColor: Colors.transparent,
                        splashColor:Colors.transparent,
                    onTap: (){
                         _pickImages();
                      },
                  child:
            Container(
                  height: 70,
                margin: const EdgeInsets.only(top: 10.0, left: 15, right: 15),
                decoration: BoxDecoration(
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
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 15,),
                    Text(Languages.of(context).add_images,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Expanded(child: SizedBox()),
                    Icon(Icons.add_a_photo),
                    SizedBox(width: 15,)
                ],),
                ),
                ),
                   
                
                   
                         _buildGridView(),

                         
                

            Container(
              margin: const EdgeInsets.only(top: 10.0, left: 15, right: 15),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      offset: const Offset(0, 5),
                      blurRadius: 5.0,
                      spreadRadius: 0)
                ],
                color:  Color.fromARGB(255, 73, 80, 87),
                border: Border.all(color: Color.fromARGB(255, 247, 247, 247),),
                borderRadius: BorderRadius.circular(5),
              ),
              child: InkWell(
                  onTap: () async{
                   print(price1(12000000)) ;  //////////
                      SharedPreferences pref = await SharedPreferences.getInstance();
                      id = await pref.getString('id');
                      token = await pref.getString('token');
                      print("id="+id);
                      print("token="+token);  
                      _submit();
                     print(price);
                     print(title);
                                   },
                  child: Container(
                      height: 63,
                      child: Center(
                        child: Text(
                          Languages.of(context).submit,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ))),
            ),

            SizedBox(
              height: 40,
            )
          ])
        ],
      ),
    );

    //  int _value=0;
    return 
    // new WillPopScope(
    //     onWillPop: () async {
    //       return false;
    //     },
    //     child:
        
         Scaffold(
          
            // //
            //  appBar: new AppBar(
            //   title: new Text('Page Title'),
            //   actions: <Widget>[
            //      new IconButton(
            //        icon: new Icon(Icons.close),
            //       onPressed: () => Navigator.of(context).pop(null),
            //      ),
            //    ],
            //   leading: new Container(),
            // ),
            // //
            backgroundColor: Colors.white,
            body: Container(
              //    color: Colors.amber,
              child: new Column(
                children: <Widget>[
                  //   Container(
                  // alignment: Alignment(-1, 0),
                  //   child:
                  //     Image.asset('assets/deux.png',),
                  //     ),
                  //  tagList,

                  Expanded(child: boardView),
                  

                ],
              ),
            )
            );
            // );
  }

  _pickImages() async { 
     List<XFile> res = await _picker.pickMultiImage();
   if(res==null)
   {

   } else{
    
    setState(() {
      images.addAll(res);
    });
  }
 } 


 Widget _buildGridView() {
    return 
    Container(
        margin: EdgeInsets.only(left: 15,right: 15),
      child: 
    GridView.count(
       primary: false,
      shrinkWrap: true,
      crossAxisCount: 3,
      childAspectRatio: 1,
      children: List.generate(images.length, (index) {
        File image = File(images[index].path);
        return Card(
          clipBehavior: Clip.antiAlias,
          child: Stack(
            children: <Widget>[
              Image.file(
                image,
                width: 300,
                height: 300,
              ),
              Positioned(
                right: 5,
                top: 5,
                child: InkWell(
                  child: Icon(
                    Icons.remove_circle,
                    size: 30,
                    color: Colors.red,
                  ),
                  onTap: () {
                    setState(() {
                      images.removeAt(index);
                    });
                  },
                ),
              ),
            ],
          ),
        );
      }),
    )
    );
  }




_loadCategories() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
  LGG=prefs.getString('stringValue');
  // super.initState();
    SharedPreferences pref = await SharedPreferences.getInstance();
                      id = await pref.getString('id');
    var response = await Api().getData('/category');
    if (response.statusCode == 200) {
       Future.delayed(Duration(milliseconds: 10)).then((_) {
      setState(() {
        categories = json.decode(response.body);
       
        final body =json.decode(response.body);
        
        print(categories+['Name']);
      });
       });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
            'Error ' + response.statusCode.toString() + ': ' + response.body),
      ));
    }
  }



      void _submit() async {
    // setState(() {
    //   _isLoading = true;
    // });
    var data = new Map<String, String>();
    data['title'] = titleController.text;
    data['price'] = priceController.text;
    data['description'] = descriptionController.text;
    data['nbr_chambres']=chambresController.text;
    data['superficie']=superficieController.text;
    data['nbr_etages']=nbr_etagesController.text;
    data['num_etage']=num_etagesController.text;
    data['nbr_sbain'] = nbr_sbain.text;
    data['nbr_cuisine'] = nbr_cuisine.text;
    data['category_id'] = category_id.toString();
    data['user_id'] = id.toString();

 SharedPreferences pref = await SharedPreferences.getInstance();      
    token = await pref.getString('token');

  if(j==true){
    //Meuble a ajouter
  }else{
    data['meubles'] = 1.toString();
  }

   if(a==true){
    // garage non disponible
  }else{
    data['garage'] = 1.toString();
  }


   if(d==true){
    //jardin non dispo
  }else{
    data['jardin'] = 1.toString();
  }


   if(m==true){
    // parking non dispo 
  }else{
    data['parking'] = 1.toString();
  }
    
   
      if(g==true){
    // piscine non dispo 
  }else{
    data['piscine'] = 1.toString();
  }

    if(eau==true){
   data['eau'] = 1.toString();
  }
   if(elec==true){
   data['elec'] = 1.toString();
  }
  if(gaz==true){
   data['gaz'] = 1.toString();
  }


    if(Promotion_immobiliere==true){
   data['promotion_imob'] = 1.toString();
  }
   if(Acte_notarie==true){
   data['acte'] = 1.toString();
  }
  if(Livret_foncie==true){
   data['livret'] = 1.toString();
  }

 

   if(vente==true){
     data['vente']=1.toString();
   }
  
 

    
     data['adresse']=adresseController.text;
     if(lastPosition2!=null){

    
     data['latitude']=lastPosition2.latitude.toString();
     data['longitude']=lastPosition2.longitude.toString();
     }    


    //data['image'] = _image.path;

    var response = await Api().postDataWithImages(data, '/offer', images);
    //var response = await Api().postData(data, '/offer');

    if (response.statusCode == 201) {
      setState(() {
         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("offre correctement ajoutée")));
           Navigator.push(
                     context,
            MaterialPageRoute(builder: (context) => switching_page()),
              );

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
      // Navigator.pop(context);
    } else {
      _showMsg('Error ${response.statusCode}');
    }
  }

_showMsg(msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          // Some code to undo the change!
        },
      ),
    ));
  }

 
  Widget _buildOfferItem(BuildContext context, int index) {
    return  CheckboxListTile(
                      activeColor: Color.fromARGB(255, 73, 80, 87),
                      title: 
                       LGG=="English"?
                      Text(
                         categories[index]['Name'],
                        style:
                            TextStyle(color: Color.fromARGB(255, 73, 80, 87)),
                      )
                      :LGG=="Français"?
                      Text(
                         categories[index]['Name_fr'],
                        style:
                            TextStyle(color: Color.fromARGB(255, 73, 80, 87)),
                      )
                      :LGG=="Arabe"?
                      Text(
                         categories[index]['Name_ar'],
                        style:
                            TextStyle(color: Color.fromARGB(255, 73, 80, 87)),
                      )
                      :null,
                       
                      value:  name_categories[index],
                      onChanged: (bool name_categories) {
                        setState(() {
                         indexes(index);
                       
                        });
                      },
                    );
    
    // Expanded(child: 
    // CheckboxListTile(
    //                   activeColor: Color.fromARGB(255, 73, 80, 87),
    //                   title: Text(
    //                     '3-façades',
    //                     style:
    //                         TextStyle(color: Color.fromARGB(255, 73, 80, 87)),
    //                   ),
    //                   value: b,
    //                   onChanged: (bool value) {
    //                     setState(() {
    //                       b = !b;
    //                       construction(a, b, c);
    //                     });
    //                   },
    //                   )
    
    //                 );

  }
  
        



    void indexes(int e){
      if (e==0){
        name_categories=[true,false,false,false,false,false,false,false];
        category_id=1.toString();
      }
      if (e==1){
        name_categories=[false,true,false,false,false,false,false,false];
         category_id=2.toString();
      }
      if (e==2){
        name_categories=[false,false,true,false,false,false,false,false];
         category_id=3.toString();
      }
        if (e==3){
        name_categories=[false,false,false,true,false,false,false,false];
         category_id=4.toString();
      }
        if (e==4){
        name_categories=[false,false,false,false,true,false,false,false];
         category_id=5.toString();
      }
    }



















  GoogleMapController mapController;
  final Set<Marker> markers = new Set();
  final LatLng _center = const LatLng(36, 6);
  LatLng lastPosition;

    void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
     
 
}






