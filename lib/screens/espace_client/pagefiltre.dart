//import 'dart:html';

import 'dart:convert';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_6/localization/language/languages.dart';
import 'package:flutter_application_6/model/api.dart';
import 'package:flutter_application_6/model/variables.dart';
import 'package:flutter_application_6/screens/espace_agence/switching_agence.dart';
import 'package:flutter_application_6/screens/espace_client/affichage_result_filtre.dart';
import 'package:flutter_application_6/screens/espace_client/dep.dart';
import 'package:flutter_application_6/screens/espace_client/page_agences.dart';
import 'package:flutter_application_6/screens/espace_client/page_param.dart';
import 'package:flutter_application_6/screens/espace_client/pages_favoris.dart';
import 'package:flutter_application_6/screens/espace_client/switching_page.dart';
import 'package:flutter_application_6/widgets/toggle_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:line_icons/line_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';

class pagefiltreState extends StatefulWidget {
  @override
  pagefiltreStateState createState() {
    return pagefiltreStateState();
  }
}

@override
void initState() {
  func();
  
}



bool pressAttention = true;


 List<bool> name_categories = [true,false,false,false,false,false,false,false];
var categories = [];
class pagefiltreStateState extends State<pagefiltreState> {
  List<bool> ess = [false, false, false, false];
  var myController1 = TextEditingController();
  var myController2 = TextEditingController();
  var myController3 = TextEditingController();
  var myController4 = TextEditingController();
  bool vente = true;
  bool a = false;
  bool b = false;
  bool c = false;
  bool d = true;
  bool e = false;
  bool f = false;
  bool g = true;
  bool h = false;
  bool i = false;
 
  bool k = true;
  bool l = false;
  String var1 = "Sans importance";
  String var2 = "Sans importance";
  String var3 = "Sans importance";
  String var4 = "Sans";
  String var5 = "Tous Les Prix";
  bool var6 = false;

  String var7 = "";
  int var8 = 0;
  String var9 = "";
  int var10 = 0;
  String var11 = "Tous Les Prix";

  String var12 = "";
  int var13 = 0;
  String var14 = "";
  int var15 = 0;
  String var16 = "Toutes Les Superficies";

   List<bool> data = [true, false, false, false , false];
  String text = "gr";
   String category_id = "1";
  var _offers;




  // void construction(bool X, bool Y, bool Z) {
  //   if (X && Y && Z) {
  //     var1 = "2-fa??ades,3-fa??ades,4-fa??ades";
  //   }
  //   if (X && Y && !Z) {
  //     var1 = "2-fa??ades,3-fa??ades";
  //   }
  //   if (X && !Y && Z) {
  //     var1 = "2-fa??ades,4-fa??ades";
  //   }
  //   if (!X && Y && Z) {
  //     var1 = "3-fa??ades,4-fa??ades";
  //   }
  //   if (X && !Y && !Z) {
  //     var1 = "2-fa??ades";
  //   }
  //   if (!X && Y && !Z) {
  //     var1 = "3-fa??ades";
  //   }
  //   if (!X && !Y && Z) {
  //     var1 = "4-fa??ades";
  //   }
  //   if (!X && !Y && !Z) {
  //     var1 = "Sans-importance";
  //   }
  // }



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




void construction4() {
    if (var12 == "") {
      var13 = 0;
      if (var12 == "") {
        var16 = "Toutes Les Superficies";
      }
      construction5();
    } else {
      var13 = int.parse(var12);
      construction5();
    }
    if (var14 == "") {
      var15 = 0;
      if (var14 == "") {
        var16= "Toutes Les Superficies";
      }
      construction5();
    } else {
      var15 = int.parse(var14);
      construction5();
    }
  }
  


void construction5() {
    if (var13 > var15) {
      var16 = ('?? partir de ' + var13.toString() + ' m??');
    }
    if (var13 > 0 && var15 > var13) {
      var16 = ("entre " +
          var13.toString() +
          "-" +
          var15.toString() +
          " m??");
    }
    if (var15 > 0 && var13 == 0) {
      var16 = "?? " + var15.toString() + " m??";
    }
}




  void construction3() {
    if (var8 > var10) {
      var11 = ('?? partir de ' + var8.toString() + ' Millions cent');
    }
    if (var8 > 0 && var10 > var8) {
      var11 = ("entre " +
          var8.toString() +
          "-" +
          var10.toString() +
          " Millions cent");
    }
    if (var10 > 0 && var8 == 0) {
      var11 = "?? " + var10.toString() + " millions cent";
    }
  }



  @override
void initState() {
  _loadCategories();
  
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
                          toggleColor: (Colors.white),
                          activeTextColor: Color.fromARGB(255, 2, 62, 138),
                          inactiveTextColor: Colors.black,
                          leftDescription: Languages.of(context).vente,
                          rightDescription:  Languages.of(context).loc,

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
                        child:  Image(image: AssetImage('assets/Imran_client.png'))
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
                                            ? Color.fromARGB(255, 2, 62, 138)
                                            : Color.fromARGB(144, 151, 172, 196),
                                        size: 30,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Text( Languages.of(context).maison,
                                      style: TextStyle(
                                          color: data[0]
                                     
                                              ? Color.fromARGB(255, 2, 62, 138)
                                              : Color.fromARGB(144, 151, 172, 196),
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
                                            ? Color.fromARGB(255, 2, 62, 138)
                                            : Color.fromARGB(144, 151, 172, 196),
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
                                              ? Color.fromARGB(255, 2, 62, 138)
                                              : Color.fromARGB(144, 151, 172, 196),
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
                                            ? Color.fromARGB(255, 2, 62, 138)
                                            : Color.fromARGB(144, 151, 172, 196),
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
                                       
                                  Text( Languages.of(context).garage,
                                      style: TextStyle(
                                          color: data[2]
                                              ? Color.fromARGB(255, 2, 62, 138)
                                              : Color.fromARGB(144, 151, 172, 196),
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
                                            ? Color.fromARGB(255, 2, 62, 138)
                                            : Color.fromARGB(144, 151, 172, 196),
                                        size: 40,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 1,
                                  ),
                                  Text( Languages.of(context).villa,
                                      style: TextStyle(
                                          color: data[3]
                                              ? Color.fromARGB(255, 2, 62, 138)
                                              : Color.fromARGB(144, 151, 172, 196),
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
                                            ? Color.fromARGB(255, 2, 62, 138)
                                            : Color.fromARGB(144, 151, 172, 196),
                                        size: 35,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text( Languages.of(context).other,
                                      style: TextStyle(
                                          color: data[4]
                                              ? Color.fromARGB(255, 2, 62, 138)
                                              : Color.fromARGB(144, 151, 172, 196),
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
               border: Border.all(color: Color.fromARGB(255, 2, 62, 138)),
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
                        color: Color.fromARGB(255, 2, 62, 138)),
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
                  border: Border.all(color: Color.fromARGB(255, 2, 62, 138)),
                  borderRadius: BorderRadius.circular(5),
                ), //BoxDecoration

                /** CheckboxListTile Widget **/
                child: ExpansionTile(
                  title: Text(
                    Languages.of(context).price,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    // style: TextStyle(color: Color.fromARGB(255, 2, 62, 138)),
                  ),
                  subtitle: Text(
                    var11,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 2, 62, 138)),
                  ),
                  children: [
                    Row(
                      children: [
                        Expanded(child: SizedBox()),
                        Container(
                          // margin: const EdgeInsets.only(
                          //   left: 20.0,
                          // ),
                          child: Text(
                            "de",
                            style: TextStyle(
                                color: Color.fromARGB(255, 2, 62, 138)),
                          ),
                        ),
                        Expanded(child: SizedBox()),
                        Container(
                          margin: const EdgeInsets.only(
                              //left: 20.0,
                              bottom: 30),
                          padding: const EdgeInsets.only(
                            top: 15,
                          ),
                          height: 50,
                          width: 120,
                          child: TextFormField(
                                 
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                hintText: 'p. ex : 190 Mill',
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                hintStyle: TextStyle(
                                    color: Color.fromARGB(144, 151, 172, 196)),
                              ),
                              controller: myController1,

                              //   controller: myController,
                              //  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp('[0-9]')),
                                // FilteringTextInputFormatter.deny(RegExp(r'[.{1}]')),
                              ],
                              // keyboardType: TextInputType.numberWithOptions(decimal: true),
                              keyboardType: TextInputType.phone,
                              onChanged: (String value) {
                                setState(() {
                                  var7 = value;
                                  construction2();
                                });
                              }),
                        ),
                        Expanded(child: SizedBox()),
                        Container(
                          // margin: const EdgeInsets.only(
                          //   left: 20.0,
                          // ),
                          child: Text(
                            "??",
                            style: TextStyle(
                                color: Color.fromARGB(255, 2, 62, 138)),
                          ),
                        ),
                        Expanded(child: SizedBox()),
                        Container(
                          margin: const EdgeInsets.only(
                              //left: 20,
                              //right: 30.0,
                              bottom: 30),
                          padding: const EdgeInsets.only(
                            top: 15,
                          ),
                          height: 50,
                          width: 120,
                          child: TextFormField(
                            onChanged: (String value) {
                              setState(() {
                                var9 = value;
                                construction2();
                              });
                            },

                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              hintText: 'p. ex : 240 mill ',
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(144, 151, 172, 196)),
                            ),
                            controller: myController2,
                            //   controller: myController,
                            //  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp('[0-9]')),
                              // FilteringTextInputFormatter.deny(RegExp(r'[.{1}]')),
                            ],
                            // keyboardType: TextInputType.numberWithOptions(decimal: true),
                            keyboardType: TextInputType.phone,
                          ),
                        ),
                        Expanded(child: SizedBox()),
                      ],
                    )
                  ],
                )),



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
                  border: Border.all(color: Color.fromARGB(255, 2, 62, 138)),
                  borderRadius: BorderRadius.circular(5),
                ), //BoxDecoration

                /** CheckboxListTile Widget **/
                child: ExpansionTile(
                  title: Text(
                    Languages.of(context).Superficie_add_offer,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    // style: TextStyle(color: Color.fromARGB(255, 2, 62, 138)),
                  ),
                  subtitle: Text(
                    var16,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 2, 62, 138)),
                  ),
                  children: [
                    Row(
                      children: [
                        Expanded(child: SizedBox()),
                        Container(
                          // margin: const EdgeInsets.only(
                          //   left: 20.0,
                          // ),
                          child: Text(
                            "de",
                            style: TextStyle(
                                color: Color.fromARGB(255, 2, 62, 138)),
                          ),
                        ),
                        Expanded(child: SizedBox()),
                        Container(
                          margin: const EdgeInsets.only(
                              //left: 20.0,
                              bottom: 30),
                          padding: const EdgeInsets.only(
                            top: 15,
                          ),
                          height: 50,
                          width: 120,
                          child: TextFormField(
                                 
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                hintText: ' 190 m??',
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                hintStyle: TextStyle(
                                    color: Color.fromARGB(144, 151, 172, 196)),
                              ),
                              controller: myController3,

                              //   controller: myController,
                              //  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp('[0-9]')),
                                // FilteringTextInputFormatter.deny(RegExp(r'[.{1}]')),
                              ],
                              // keyboardType: TextInputType.numberWithOptions(decimal: true),
                              keyboardType: TextInputType.phone,
                              onChanged: (String value) {
                                setState(() {
                                  var16 = value;
                                  construction4();
                                });
                              }),
                        ),
                        Expanded(child: SizedBox()),
                        Container(
                          // margin: const EdgeInsets.only(
                          //   left: 20.0,
                          // ),
                          child: Text(
                            "??",
                            style: TextStyle(
                                color: Color.fromARGB(255, 2, 62, 138)),
                          ),
                        ),
                        Expanded(child: SizedBox()),
                        Container(
                          margin: const EdgeInsets.only(
                              //left: 20,
                              //right: 30.0,
                              bottom: 30),
                          padding: const EdgeInsets.only(
                            top: 15,
                          ),
                          height: 50,
                          width: 120,
                          child: TextFormField(
                            onChanged: (String value) {
                              setState(() {
                                var14 = value;
                                construction4();
                              });
                            },

                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              hintText: '240 m?? ',
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(144, 151, 172, 196)),
                            ),
                            controller: myController4,
                            //   controller: myController,
                            //  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp('[0-9]')),
                              // FilteringTextInputFormatter.deny(RegExp(r'[.{1}]')),
                            ],
                            // keyboardType: TextInputType.numberWithOptions(decimal: true),
                            keyboardType: TextInputType.phone,
                          ),
                        ),
                        Expanded(child: SizedBox()),
                      ],
                    )
                  ],
                )),

            
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
                border: Border.all(color: Color.fromARGB(255, 2, 62, 138)),
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
                    style: TextStyle(color: Color.fromARGB(255, 2, 62, 138)),
                  ),
                  children: <Widget>[
                   
                    CheckboxListTile(
                      activeColor: Color.fromARGB(255, 2, 62, 138),
                      title: Text(
                        'Sans',
                        style:
                            TextStyle(color: Color.fromARGB(255, 2, 62, 138)),
                      ),
                      value: k,
                      onChanged: (bool value) {
                        setState(() {
                          if (k == false) {
                            k = !k;
                          }
                         
                          l = false;
                          var4 = "Sans";
                        });
                      },
                    ),
                    CheckboxListTile(
                      activeColor: Color.fromARGB(255, 2, 62, 138),
                      title: Text(
                        'Avec',
                        style:
                            TextStyle(color: Color.fromARGB(255, 2, 62, 138)),
                      ),
                      value: l,
                      onChanged: (bool value) {
                        setState(() {
                          if (l == false) {
                            l = !l;
                          }
                          
                          k = false;
                          var4 = "Avec";
                        });
                      },
                    ),
                  ]), //CheckboxListTile
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
                color:  Color.fromARGB(255, 2, 62, 138),
                border: Border.all(color: Color.fromARGB(255, 247, 247, 247),),
                borderRadius: BorderRadius.circular(5),
              ),
              child: InkWell(
                  onTap: () {
                      submit();    
                      
                  },
                  child: Container(
                      height: 63,
                      child: Center(
                        child: Text(
                          'Chercher',
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
    //  new WillPopScope(
    //     onWillPop: () async {
    //       return false;
    //     },
        // child: 
        Scaffold(
        //  floatingActionButton:  
        //     Visibility(child: 
        //     Container(
        //       margin: EdgeInsets.only(bottom: 15),
        //       child:
        //     FloatingActionButton(
        //       backgroundColor: Color.fromARGB(144, 151, 172, 196),
        //       child: Icon(Icons.real_estate_agent, color:Color.fromARGB(255, 2, 62, 138)),
        //     onPressed:(){
        //       Navigator.push(context,MaterialPageRoute(builder: (context) =>switching_agence()));
        //       print(agence_conncet);
        //       }
        //     ),
        //     ),
        //     visible: agence_conncet,
        //     ),
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
            // )
            );
  }




_loadCategories() async {
  super.initState();
  
    var response = await Api().getData('/category');

    if (response.statusCode == 200) {
      Future.delayed(Duration(milliseconds: 5)).then((_) {
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





Widget _buildOfferItem(BuildContext context, int index) {
    return  CheckboxListTile(
                      activeColor: Color.fromARGB(255, 73, 80, 87),
                      title:  LGG=="English"?
                      Text(
                         categories[index]['Name'],
                        style:
                            TextStyle(color: Color.fromARGB(255, 73, 80, 87)),
                      )
                      :LGG=="Fran??ais"?
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
    //                     '3-fa??ades',
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

       if (e==5){
        name_categories=[false,false,false,false,false,true,false,false];
         category_id=6.toString();
      }

      if (e==6){
        name_categories=[false,false,false,false,false,false,true,false];
         category_id=7.toString();
      }
        if (e==7){
        name_categories=[false,false,false,false,false,false,false,true];
         category_id=8.toString();
      }
    }




   submit () async {

  var data = new Map<String, String>();

    data['category'] = category_id.toString();
    data['min'] = myController1.text;
    data['max'] = myController2.text;
    if(vente==true){
      data['vente']=1.toString();
    }
    //data['max'] = myController2.text;
    // data['description'] = descriptionController.text;
    // data['nbr_chambres']=chambresController.text;
    // data['superficie']=superficieController.text;
    // data['nbr_etages']=nbr_etagesController.text;
    // data['num_etage']=num_etagesController.text;
    // data['nbr_sbain'] = nbr_sbain.text;
    // data['nbr_cuisine'] = nbr_cuisine.text;
    // data['category_id'] = category_id.toString();
    // data['user_id'] = id.toString();

//  SharedPreferences pref = await SharedPreferences.getInstance();      
//     token = await pref.getString('token');

//   if(j==true){
//     //Meuble a ajouter
//   }else{
//     data['meubles'] = 1.toString();
//   }

//    if(a==true){
//     // garage non disponible
//   }else{
//     data['garage'] = 1.toString();
//   }


//    if(d==true){
//     //jardin non dispo
//   }else{
//     data['jardin'] = 1.toString();
//   }


//    if(m==true){
//     // parking non dispo 
//   }else{
//     data['parking'] = 1.toString();
//   }
    
   
//       if(g==true){
//     // piscine non dispo 
//   }else{
//     data['piscine'] = 1.toString();
//   }

//     if(eau==true){
//    data['eau'] = 1.toString();
//   }
//    if(elec==true){
//    data['elec'] = 1.toString();
//   }
//   if(gaz==true){
//    data['gaz'] = 1.toString();
//   }


//     if(Promotion_immobiliere==true){
//    data['promotion_imob'] = 1.toString();
//   }
//    if(Acte_notarie==true){
//    data['acte'] = 1.toString();
//   }
//   if(Livret_foncie==true){
//    data['livret'] = 1.toString();
//   }

 

  //  if(vente==true){
  //    data['vente']=1.toString();
  //  }
  
 

    
    //  data['adresse']=adresseController.text;
    //  if(lastPosition2!=null){

    
    //  data['latitude']=lastPosition2.latitude.toString();
    //  data['longitude']=lastPosition2.longitude.toString();
    //  }    


    //data['image'] = _image.path;
   
    var response = await Api().postData(data, '/offer/recherche');
    //var response = await Api().postData(data, '/offer');

    if (response.statusCode == 200) {
      setState(() {
             print(category_id);
           _offers = json.decode(response.body);
            print(_offers);
            print(myController1.text);
            print(_offers.length.toString());
    Navigator.push(context, MaterialPageRoute( builder: (context) =>result_filtre(data: data,)));
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
