import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_6/localization/language/languages.dart';
import 'package:flutter_application_6/model/variables.dart';
import 'package:flutter_application_6/screens/espace_agence/switching_agence.dart';
import 'package:flutter_application_6/screens/espace_client/dep.dart';
import 'package:flutter_application_6/screens/espace_client/page_agences.dart';
import 'package:flutter_application_6/screens/espace_client/page_param.dart';
import 'package:flutter_application_6/screens/espace_client/pagefiltre.dart';
import 'package:flutter_application_6/screens/espace_client/pages_favoris.dart';

class switching_page extends StatefulWidget {
  @override
  State<switching_page> createState() => _switching_pageState();
}

class _switching_pageState extends State<switching_page> {
  final screen = [
    pointdep(),
    page_agences(),
    pagefiltreState(),
    pages_favoris(),
    page_parametres()
  ];

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
     
     
      //  floatingActionButton:  
      //       Visibility(
      //         visible: agence_conncet ,
      //         child: 
      //       Container(
      //         margin: EdgeInsets.only(bottom: 15),
      //         child:
      //       FloatingActionButton(
      //         backgroundColor: Color.fromARGB(255,222, 226, 230),
      //         child: Icon(Icons.real_estate_agent, color:Color.fromARGB(255, 73, 80, 87)),
      //       onPressed:(){
      //         Navigator.push(context,MaterialPageRoute(builder: (context) =>switching_agence()));
      //         print(agence_conncet);
      //         }
      //       ),
      //       ),
            
      //       ),
      body: screen[last_acces],
      bottomNavigationBar: CurvedNavigationBar(
        letIndexChange: (value) => true,
        // animationDuration: Duration(microseconds: 400),
       // animationDuration: Duration(milliseconds: 280),
       animationDuration: Duration(milliseconds: 400),
        index: last_acces,
        height: 50,
        color: Color(0xffE5E7F3),
        backgroundColor: Colors.white,
        buttonBackgroundColor: Color(0xffE5E7F3),
        // animationCurve: Curves.slowMiddle,
        animationCurve: Curves.linear,
        items: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.home,
                size: 30,
                color: Color.fromARGB(255, 2, 62, 138),
              ),
              Text(
                Languages.of(context).home_p,
                style: TextStyle(
                  fontSize: 10,
                  color: Color.fromARGB(255, 2, 62, 138),
                ),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.real_estate_agent,
                size: 30,
                color: Color.fromARGB(255, 2, 62, 138),
              ),
              Text(
                Languages.of(context).agence_p,
                style: TextStyle(
                  fontSize: 10,
                  color: Color.fromARGB(255, 2, 62, 138),
                ),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.search,
                size: 30,
                color: Color.fromARGB(255, 2, 62, 138),
              ),
              Text(
                Languages.of(context).search_p,
                style: TextStyle(
                  fontSize: 10,
                  color: Color.fromARGB(255, 2, 62, 138),
                ),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.favorite,
                size: 30,
                color: Color.fromARGB(255, 2, 62, 138),
              ),
              Text(
                Languages.of(context).fav_p,
                style: TextStyle(
                  fontSize: 10,
                  color: Color.fromARGB(255, 2, 62, 138),
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
                color: Color.fromARGB(255, 2, 62, 138),
              ),
              Text(
                Languages.of(context).param_p,
                style: TextStyle(
                  fontSize: 10,
                  color: Color.fromARGB(255, 2, 62, 138),
                ),
              )
            ],
          ),
        ],
        onTap: (index) {
          func();
          setState(() {
            {
              last_acces = index;
              // page = index;
            }
          });
        },
      ),
    )
    );
  }
}
