import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_6/localization/language/languages.dart';
import 'package:flutter_application_6/model/variables.dart';
import 'package:flutter_application_6/screens/espace_agence/my_offers.dart';
import 'package:flutter_application_6/screens/espace_agence/page_param_agence.dart';
import 'package:flutter_application_6/screens/espace_client/dep.dart';
import 'package:flutter_application_6/screens/espace_agence/add_offer.dart';
import 'package:flutter_application_6/screens/espace_client/page_agences.dart';
import 'package:flutter_application_6/screens/espace_client/page_param.dart';
import 'package:flutter_application_6/screens/espace_client/pagefiltre.dart';
import 'package:flutter_application_6/screens/espace_client/pages_favoris.dart';
import 'package:flutter_application_6/screens/espace_client/switching_page.dart';

class switching_agence extends StatefulWidget {
  @override
  State<switching_agence> createState() => _switching_agenceState();
}

class _switching_agenceState extends State<switching_agence> {
  final screen = [
    my_offers(),
    //page_agences(),
    add_offer(),
    
    page_parametres_agence()
    
    //pages_favoris(),
    //page_parametres()
  ];
  
  int page=0;
  void initState() {
    super.initState();
    check_agence_connenct();
  }
  @override
  Widget build(BuildContext context) {
    return 
    new WillPopScope(
       onWillPop: () async {
         return false;
        },
        child: 
    Scaffold(
      floatingActionButton: 
            Visibility(
              child: 
            Container(
              margin: EdgeInsets.only(bottom: 15),
              child: 
            FloatingActionButton(
              backgroundColor: Color.fromARGB(255,222, 226, 230),
              child: Icon(Icons.person, color:Color.fromARGB(255, 2, 62, 138),),
            onPressed:(){
              Navigator.push(context,MaterialPageRoute(builder: (context) =>switching_page()));
              print(agence_conncet);
              }
            ) 
            ),
            visible: agence_conncet,
            ),
                       
      body: screen[page],
      bottomNavigationBar: CurvedNavigationBar(
        letIndexChange: (value) => true,
        // animationDuration: Duration(microseconds: 400),
        animationDuration: Duration(milliseconds: 400),
        index: page,
        height: 50,
        color: Color.fromARGB(255,222, 226, 230),
        backgroundColor: Colors.white,
        buttonBackgroundColor: Color.fromARGB(255,222, 226, 230),
        // animationCurve: Curves.slowMiddle,
        animationCurve: Curves.linear,
        items: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.home,
                size: 30,
                color: Color.fromARGB(255, 73, 80, 87),
              ),
              Text(
                Languages.of(context).offers,
                style: TextStyle(
                  fontSize: 10,
                  color: Color.fromARGB(255, 73, 80, 87),
                ),
              )
            ],
          ),
         
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add,
                size: 30,
                color: Color.fromARGB(255, 73, 80, 87),
              ),
              Text(
                Languages.of(context).add_offer,
                style: TextStyle(
                  fontSize: 10,
                color: Color.fromARGB(255, 73, 80, 87),
                ),
              )
            ],
          ),
         
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.settings,
                size: 30,
              color: Color.fromARGB(255, 73, 80, 87),
              ),
              Text(
                Languages.of(context).param_p,
                style: TextStyle(
                  fontSize: 10,
                color: Color.fromARGB(255, 73, 80, 87),
                ),
              )
            ],
          ),
        ],
        onTap: (index) {
          func(); 
          setState(() {
            {
              //index = index;
               page = index;
            }
          });
        },
      ),




  // )
    )
    );
  }
}



