import 'dart:convert';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_6/localization/language/languages.dart';
import 'package:flutter_application_6/localization/locale_constant.dart';
import 'package:flutter_application_6/model/api.dart';
import 'package:flutter_application_6/model/variables.dart';
import 'package:flutter_application_6/screens/espace_agence/switching_agence.dart';
import 'package:flutter_application_6/screens/espace_client/dep.dart';
import 'package:flutter_application_6/screens/espace_client/infos_gen.dart';
import 'package:flutter_application_6/screens/espace_client/inscription_connexion.dart';
import 'package:flutter_application_6/screens/espace_client/page_agences.dart';
import 'package:flutter_application_6/screens/espace_client/page_changeL.dart';
import 'package:flutter_application_6/screens/espace_client/page_profile.dart';
import 'package:flutter_application_6/screens/espace_client/pagefiltre.dart';
import 'package:flutter_application_6/screens/espace_client/pages_favoris.dart';
import 'package:flutter_application_6/screens/espace_client/switching_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class page_parametres extends StatefulWidget {
  const page_parametres({Key key}) : super(key: key);

  @override
  State<page_parametres> createState() => _page_parametresState();
}

class _page_parametresState extends State<page_parametres> {
   void initState() {
    super.initState();
    check_agence_connenct();
    check_client_conncet();
    func ();
  }

var user ;

  @override
  Widget build(BuildContext context) {
    if(agence_conncet==false && client_conncet==false){

    
     return 
    //new WillPopScope(
    //     onWillPop: () async {
    //       return false;
    //     },

    //     child:
         Scaffold(
            backgroundColor: Colors.white,
            resizeToAvoidBottomInset: false,
            body:
            SingleChildScrollView(child: 
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                  height: 80,
                  //color: Colors.red,),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/top_bar.png"),
                        fit: BoxFit.cover
                      ),
                      //color: Color(0xffE5E7F3),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(0.0),
                      ))
                      ),
              SizedBox(
                height: 40,
              ),
              
             
              Row(
                children: [
                  SizedBox(
                    width: 14,
                  ),
                  Container(
                    child: Text(
                      Languages.of(context).parametres_supp,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
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
                              border: Border.all(
                                  color: Color.fromARGB(255, 2, 62, 138)),
                              borderRadius: BorderRadius.circular(5),
                            ), 
              /** CheckboxListTile Widget **/
              child:
               ExpansionTile(
               
              title: Text(
               Languages.of(context).langue,
                style: TextStyle(
                 // color: abc[0] ? Colors.blue : Colors.black,
                ),
              ),

              children: <Widget>[
                CheckboxListTile(
                  
                  title: Text(
                    'Français',
                    style: TextStyle(
                      color: abc[0] ? Colors.blue : Colors.black,
                    ),
                  ),
                  value: abc[0],
                  onChanged: (bool value) {
                    setState(() {
                      changeLanguage(context, 'fr');
                      abc = [true, false, false];
                      valueLang("Français");
                      var_image = "assets/Group 1 (3).png";
                      align_x = -1;
                      align_y = -1;
                    });
                  },
                ),
                CheckboxListTile(
                    title: Text(
                      'عربية',
                      style: TextStyle(
                        color: abc[1] ? Colors.blue : Colors.black,
                      ),
                    ),
                    value: abc[1],
                    onChanged: (bool value) {
                      setState(() {
                        abc = [false, true, false];
                        changeLanguage(context, 'ar');
                        valueLang("Arabe");
                        var_image = "assets/Group-1-3-Co.png";
                        align_x = 0.999;
                        align_y = -0.9;
                      });
                    }),
                CheckboxListTile(
                  title: Text(
                    'English',
                    style: TextStyle(
                      color: abc[2]
                          ? Color.fromARGB(255, 2, 62, 138)
                          : Colors.black,
                    ),
                  ),
                  value: abc[2],
                  onChanged: (bool value) {
                    setState(() {
                      abc = [false, false, true];
                      changeLanguage(context, 'en');
                      valueLang("English");
                      align_x = -1;
                      align_y = -1;
                      var_image = "assets/Group 1 (3).png";
                    });
                  },
                ),])),

              SizedBox(
                height: 5,
              ),
              InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  child: Container(
                            height: 60,
                            margin: const EdgeInsets.only(
                                top: 10.0, left: 15, right: 15),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    offset: const Offset(0, 5),
                                    blurRadius: 5.0,
                                    spreadRadius: 0)
                              ],
                              color: Color.fromARGB(255, 247, 247, 247),
                              border: Border.all(
                                  color: Color.fromARGB(255, 2, 62, 138)),
                              borderRadius: BorderRadius.circular(5),
                            ), //BoxDecoration

                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 10,
                                ),

                                Container(
                                  width: 150,
                                  child: Text(Languages.of(context).not),
                                ),

                                // SizedBox(width: 155,),
                                Expanded(child: SizedBox()),
                                Icon(
                                  Icons.notifications,
                                  size: 30,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.arrow_right_rounded,
                                  size: 30,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  width: 10,
                                )
                              ],
                            ))),
                             SizedBox(
                      height: 5,
                    ),
                             InkWell(
                        //highlightColor: Colors.transparent,
                        //splashColor: Colors.transparent,
                        onTap: () async{
                          
          final Uri _emailurl = Uri(
            scheme: 'mailto',
            path: "Imran@gmail.com",
          query: 
              'subject=A propos de l\'application Imran '.replaceAll(" ", "%20")
            );

  
      if( await canLaunch(_emailurl.toString())){
      await launch(_emailurl.toString());
    }else{
      throw 'Could not launch $_emailurl';
    }


            
                        },
                        child: Container(
                            height: 60,
                            margin: const EdgeInsets.only(
                                top: 10.0, left: 15, right: 15),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    offset: const Offset(0, 5),
                                    blurRadius: 5.0,
                                    spreadRadius: 0)
                              ],
                              color: Color.fromARGB(255, 247, 247, 247),
                              border: Border.all(
                                  color: Color.fromARGB(255, 2, 62, 138)),
                              borderRadius: BorderRadius.circular(5),
                            ), //BoxDecoration

                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 10,
                                ),

                                Container(
                                  width: 150,
                                  child: Text(Languages.of(context).feedback),
                                ),

                                // SizedBox(width: 155,),
                                Expanded(child: SizedBox()),
                                Icon(
                                  Icons.feedback_rounded,
                                  size: 30,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.arrow_right_rounded,
                                  size: 30,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  width: 10,
                                )
                              ],
                            ))),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 14,
                  ),
                  Container(
                    child: Text(
                    Languages.of(context).a_propos,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
             InkWell(



               
                 onTap: (() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => infos()));
  
                    }),
              
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        child: Container(
                            height: 60,
                            margin: const EdgeInsets.only(
                                top: 10.0, left: 15, right: 15),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    offset: const Offset(0, 5),
                                    blurRadius: 5.0,
                                    spreadRadius: 0)
                              ],
                              color: Color.fromARGB(255, 247, 247, 247),
                              border: Border.all(
                                  color: Color.fromARGB(255, 2, 62, 138)),
                              borderRadius: BorderRadius.circular(5),
                            ), //BoxDecoration

                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 10,
                                ),

                                Container(
                                  width: 150,
                                  child: Text(Languages.of(context).info_gen),
                                ),

                                // SizedBox(width: 155,),
                                Expanded(child: SizedBox()),
                                Icon(
                                  Icons.language,
                                  size: 30,
                                  color: Colors.transparent,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.arrow_right_rounded,
                                  size: 30,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                              ],
                            ))),
              SizedBox(
                height: 5,
              ),
             
                         
          
                  
                    InkWell(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => connexion()));
                        },
                        child: Container(
                          
                                  height: 45,
                            margin: const EdgeInsets.only(
                                top: 10.0, left: 15, right: 15),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    offset: const Offset(0, 5),
                                    blurRadius: 5.0,
                                    spreadRadius: 0)
                              ],
                              color: Color.fromARGB(255, 2, 62, 138),
                              border: Border.all(
                                  color: Color.fromARGB(255, 2, 62, 138)),
                              borderRadius: BorderRadius.circular(5),
                            ), //
                                  child: Center(
                                    child: Text(
                                      Languages.of(context).sidentifer,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ))),
                         SizedBox(height: 20,)
            ])
            ,)
            );
            //);
  }else{
     return 
    //  new WillPopScope(
    //     onWillPop: () async {
    //       return false;
    //     },
    //     child: 



        Scaffold(
        
          // floatingActionButton:  
          //   Visibility(child: 
          //   Container(
          //     margin: EdgeInsets.only(bottom: 15),
          //     child:
          //   FloatingActionButton(
          //     backgroundColor: Color.fromARGB(255,222, 226, 230),
          //     child: Icon(Icons.real_estate_agent, color:Color.fromARGB(255, 73, 80, 87)),
          //   onPressed:(){
          //     Navigator.push(context,MaterialPageRoute(builder: (context) =>switching_agence()));
          //     print(agence_conncet);
          //     }
          //   ),
          //   ),
          //   visible: agence_conncet,
          //   ),
          
            backgroundColor: Colors.white,
            resizeToAvoidBottomInset: false,
            body:
            Stack(children: [
     
            
            SingleChildScrollView(child: 
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              
              SizedBox(
                height: 90,
              ),
              
               Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [ 
                    //    CircleAvatar(
                    //    radius: 80,
                    //  backgroundImage: NetworkImage("assets/1.png"),
                    // )
                     user==null?
                      Container(
                      height: 160,
                      width: 160,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                      //borderRadius: BorderRadius.circular(100),
                      color: Color.fromARGB(87, 209, 206, 206),),
                      
                       child:
                        ClipOval(child:
                      
                         Icon(Icons.person_outlined,size: 70,)
                    ))

                    :user['photo']==null?
                    Container(
                      height: 160,
                      width: 160,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                      //borderRadius: BorderRadius.circular(100),
                      color: Color.fromARGB(87, 209, 206, 206),),
                      
                       child:
                        ClipOval(child:
                      
                         Icon(Icons.person_outlined,size: 70,)
                    ))
                    :Container(
                      height: 160,
                      width: 160,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                      //borderRadius: BorderRadius.circular(100),
                      color: Color.fromARGB(87, 209, 206, 206),),
                      
                       child:
                        ClipOval(child:
                     
                      Image.network(Api().get_user_image(user['photo']),fit: BoxFit.cover,)
                        )
                        )
              
                ]),
                SizedBox(height: 20,),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  user==null?
                 InkWell(
                   onTap: (){  
    

                     print("voir le profil ");
                   },
                   child: 
                   
                    Text(Languages.of(context).loading,style: TextStyle(fontWeight:FontWeight.bold,fontSize: 17),)
                 
                   )


                   :InkWell(
                   onTap: (){
                     print("voir le profil");
                      Navigator.push(context,MaterialPageRoute(builder: (context) =>profile()));
                   },
                   child: 
                   Text(user['name'],style: TextStyle(fontWeight:FontWeight.bold,fontSize: 17),)
                   
                 
                   )
                ],),
                SizedBox(height: 20,)
                  ]),
              
              Row(
                children: [
                  SizedBox(
                    width: 14,
                  ),
                  Container(
                    child: Text(
                      Languages.of(context).parametres_supp,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
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
                              border: Border.all(
                                  color: Color.fromARGB(255, 2, 62, 138)),
                              borderRadius: BorderRadius.circular(5),
                            ), 
              /** CheckboxListTile Widget **/
              child:
               ExpansionTile(
                 
              title: Text(
                Languages.of(context).langue,
                style: TextStyle(
                  color: abc[0] ? Colors.blue : Colors.black,
                ),
              ),
              children: <Widget>[
                CheckboxListTile(
                  title: Text(
                    'Français',
                    style: TextStyle(
                      color: abc[0] ? Colors.blue : Colors.black,
                    ),
                  ),
                  value: abc[0],
                  onChanged: (bool value) {
                    setState(() {
                      changeLanguage(context, 'fr');
                      abc = [true, false, false];
                      valueLang("Français");
                      var_image = "assets/Group 1 (3).png";
                      align_x = -1;
                      align_y = -1;
                    });
                  },
                ),
                CheckboxListTile(
                    title: Text(
                      'عربية',
                      style: TextStyle(
                        color: abc[1] ? Colors.blue : Colors.black,
                      ),
                    ),
                    value: abc[1],
                    onChanged: (bool value) {
                      setState(() {
                        abc = [false, true, false];
                        changeLanguage(context, 'ar');
                        valueLang("Arabe");
                        var_image = "assets/Group-1-3-Co.png";
                        align_x = 0.999;
                        align_y = -0.9;
                      });
                    }),
                CheckboxListTile(
                  title: Text(
                    'English',
                    style: TextStyle(
                      color: abc[2]
                          ? Color.fromARGB(255, 2, 62, 138)
                          : Colors.black,
                    ),
                  ),
                  value: abc[2],
                  onChanged: (bool value) {
                    setState(() {
                      abc = [false, false, true];
                      changeLanguage(context, 'en');
                      valueLang("English");
                      align_x = -1;
                      align_y = -1;
                      var_image = "assets/Group 1 (3).png";
                    });
                  },
                ),])),


              SizedBox(
                height: 5,
              ),

              
              InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  child: Container(
                            height: 60,
                            margin: const EdgeInsets.only(
                                top: 10.0, left: 15, right: 15),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    offset: const Offset(0, 5),
                                    blurRadius: 5.0,
                                    spreadRadius: 0)
                              ],
                              color: Color.fromARGB(255, 247, 247, 247),
                              border: Border.all(
                                  color: Color.fromARGB(255, 2, 62, 138)),
                              borderRadius: BorderRadius.circular(5),
                            ), //BoxDecoration

                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 10,
                                ),

                                Container(
                                  height: 60,
                                  width: 150,
                                  child: 
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [Text(Languages.of(context).not),],
                                ),
                                ),
                                // SizedBox(width: 155,),
                                Expanded(child: SizedBox()),
                                Icon(
                                  Icons.notifications,
                                  size: 30,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.arrow_right_rounded,
                                  size: 30,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  width: 10,
                                )
                              ],
                            ))),
                             SizedBox(
                      height: 5,
                    ),
                             InkWell(
                        onTap: ()async{
                            final Uri _emailurl = Uri(
            scheme: 'mailto',
            path: "Imran@gmail.com",
          query: 
              'subject=A propos de l\'application Imran '.replaceAll(" ", "%20")
            );

  
      if( await canLaunch(_emailurl.toString())){
      await launch(_emailurl.toString());
    }else{
      throw 'Could not launch $_emailurl';
    }
                        },
                        child: Container(
                            height: 60,
                            margin: const EdgeInsets.only(
                                top: 10.0, left: 15, right: 15),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    offset: const Offset(0, 5),
                                    blurRadius: 5.0,
                                    spreadRadius: 0)
                              ],
                              color: Color.fromARGB(255, 247, 247, 247),
                              border: Border.all(
                                  color: Color.fromARGB(255, 2, 62, 138)),
                              borderRadius: BorderRadius.circular(5),
                            ), //BoxDecoration

                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 10,
                                ),

                                Container(
                                  height: 60,
                                  width: 150,
                                  child: 
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [Text(Languages.of(context).feedback),],
                                ),
                                ),

                                // SizedBox(width: 155,),
                                Expanded(child: SizedBox()),
                                Icon(
                                  Icons.feedback_rounded,
                                  size: 30,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.arrow_right_rounded,
                                  size: 30,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  width: 10,
                                )
                              ],
                            ))),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 14,
                  ),
                  Container(
                    child: Text(
                      Languages.of(context).a_propos,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
             InkWell(

                    onTap: (() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => infos()));
  
                    }),

                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        child: Container(
                            height: 60,
                            margin: const EdgeInsets.only(
                                top: 10.0, left: 15, right: 15),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    offset: const Offset(0, 5),
                                    blurRadius: 5.0,
                                    spreadRadius: 0)
                              ],
                              color: Color.fromARGB(255, 247, 247, 247),
                              border: Border.all(
                                  color: Color.fromARGB(255, 2, 62, 138)),
                              borderRadius: BorderRadius.circular(5),
                            ), //BoxDecoration

                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 10,
                                ),

                                Container(
                                  width: 150,
                                  child: Text(Languages.of(context).info_gen),
                                ),

                                // SizedBox(width: 155,),
                                Expanded(child: SizedBox()),
                                Icon(
                                  Icons.language,
                                  size: 30,
                                  color: Colors.transparent,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.arrow_right_rounded,
                                  size: 30,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                              ],
                            ))),
              SizedBox(
                height: 5,
              ),
               
                         
          
                  
                    InkWell(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: () {
                          setState(() {
                            
                            deconnexion();
                            agence_conncet=false;
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>switching_page()));
                          });
                        },
                        child: Container(
                          
                                  height: 45,
                            margin: const EdgeInsets.only(
                                top: 10.0, left: 15, right: 15),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    offset: const Offset(0, 5),
                                    blurRadius: 5.0,
                                    spreadRadius: 0)
                              ],
                              color: Color.fromARGB(255, 2, 62, 138),
                              border: Border.all(
                                  color: Color.fromARGB(255, 2, 62, 138)),
                              borderRadius: BorderRadius.circular(5),
                            ), //
                                  child: Center(
                                    child: Text(
                                       Languages.of(context).log_out,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ))),
                         SizedBox(height: 20,)
            ])
            ,),
            Container(
                  height: 76,
                  //color: Colors.red,),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        
                        image: AssetImage("assets/top_bar.png"),
                        fit: BoxFit.cover
                      ),
                      //color: Color(0xffE5E7F3),
                    //  color:Colors.red
                     ),
                     )
            ],)
            );
            // );
  }
}






  func () async{
  SharedPreferences pref = await SharedPreferences.getInstance();         
         token = await pref.getString('token');
         
              print(token);
 if(client_conncet==false){

    }else{
      var data = new Map<String, dynamic>();
            if (token != null && token.length > 0) {
  token = token.substring(1, token.length - 1);
}


         print(token);
        data['token'] = token;
    


   var response = await Api().postData(data,'/find_user');
    
      if (response.statusCode == 200){
      final body = jsonDecode(response.body);
       Future.delayed(Duration(milliseconds: 10)).then((_) {
      setState(() {
        user = jsonDecode(response.body);
      });
      });

     print(body);
      if(body['agence']!=null){
        SharedPreferences prefs = await SharedPreferences.getInstance();
           prefs.setBool('bool_agence',true);
      }else{
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool('bool_agence',false);
        setState(() {
        check_agence_connenct();
        check_client_conncet();
      });
      }
    }else{
       SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('bool_client',false);
      Future.delayed(Duration(milliseconds: 10)).then((_) {
      setState(() {
        check_agence_connenct();
        check_client_conncet();
      });
      });
    }
 
 
   }
  }
}
