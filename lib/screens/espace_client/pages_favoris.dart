import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_6/localization/language/languages.dart';
import 'package:flutter_application_6/model/variables.dart';
import 'package:flutter_application_6/screens/espace_client/dep.dart';
import 'package:flutter_application_6/screens/espace_client/inscription_connexion.dart';
import 'package:flutter_application_6/screens/espace_client/page_agences.dart';
import 'package:flutter_application_6/screens/espace_client/page_param.dart';
import 'package:flutter_application_6/screens/espace_client/pagefiltre.dart';
import 'package:flutter_application_6/screens/register.dart';
import 'package:flutter_svg/svg.dart';

class pages_favoris extends StatefulWidget {
  const pages_favoris({Key key}) : super(key: key);

  @override
  State<pages_favoris> createState() => _pages_favorisState();
}

class _pages_favorisState extends State<pages_favoris> {
  @override
  Widget build(BuildContext context) {
    Widget demande_auth = Container(
      child: Column(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                  padding: EdgeInsets.only(bottom: 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                       
                        margin: EdgeInsets.only(left: 20, right: 20),
                        child: 
                        
                        Column(
                        
                          children: [

                         SvgPicture.asset('assets/logo+imran_blue.svg'),
                         SizedBox(height: 35,),
                        Text(
                         Languages.of(context).paragraphe,
                          style: TextStyle(
                            color: Color(0xff000000),
                          ),
                        ),
                        
                        ],)
                      )
                    ],
                  ),
                )),
          Expanded(
              flex: 2,
              child: Container(
                  child:  SvgPicture.asset('assets/pana.svg'))),
          Expanded(
              flex: 1,
              child: Container(
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    //  crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 1.7,
                        height: MediaQuery.of(context).size.height / 16,
                        child: ElevatedButton(
                                 style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 2, 62, 138)),),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegistrationPage()));
                          },
                          child: Text(Languages.of(context).inscription),
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: (MediaQuery.of(context).size.height / 25),
                    ),
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: Languages.of(context).vous_avez,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                            text:'  '+Languages.of(context).se_connecter,
                            style: TextStyle(
                              color: Color.fromARGB(255, 2, 62, 138),
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => connexion()));
                                print('Login Text Clicked');
                              }),
                      ]),
                    ),
                  ),
                ]),
              )),
        ],
      ),
    );
    return 
    // new WillPopScope(
    //     onWillPop: () async {
    //       return false;
    //     },
    //     child:
         Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: false,

          body:
              //Visibility(child:
              demande_auth,
          // visible: var_index==4,
          //)
        );
        // );
  }
}
