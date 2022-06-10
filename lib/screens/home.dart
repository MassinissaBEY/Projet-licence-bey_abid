import 'package:flutter/material.dart';
import 'package:flutter_application_6/localization/language/languages.dart';
import 'package:flutter_application_6/localization/locale_constant.dart';
import 'package:flutter_application_6/model/language_data.dart';
import 'package:flutter_application_6/model/variables.dart';
import 'package:flutter_application_6/screens/espace_client/dep.dart';
import 'package:flutter_application_6/screens/deux.dart';
import 'package:flutter_application_6/screens/espace_client/switching_page.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> {

  List <bool> abc=[true,false,false];
  String lg="";
  bool affichage_button_start=false;
  void laguage_select (String L){
    if(L=='en'){
      lg='English';
      valueLang("English");
    }else{
      if(L=='fr'){
        lg='Français';
        valueLang("Français");
      }else{
        lg='عربية';
        valueLang("Arabe");
      }
    }
  }




 
  @override
  Widget build(BuildContext context) =>
      Scaffold(
        
        body: 
        
        Column(
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
                          Container(
          margin: EdgeInsets.all(30),
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 40,
                ),
            //    Text('Please choose a language \n s\'il vous plait choisissez une langue\nالرجاء اختر لغة',
                //  Languages
                  //    .of(context)
                    //  .labelWelcome,
                //  style: TextStyle(
                  //    fontSize: 30,
                    //  fontWeight: FontWeight.bold,
                      //color: Colors.black),
                //),
                SizedBox(
                  height: 30,
                ),
                 Text('Please choose a language \n s\'il vous plait choisissez une langue\nالرجاء اختر لغة',
                 // Languages
                   //   .of(context)
                     // .labelInfo,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                  textAlign: TextAlign.center,

                ),
                SizedBox(
                  height: 70,
                ),
                _createLanguageDropDown(),
                

        
                      SizedBox(height: 20,),
                            affichage_button_start?
                             Container(
                               width: 180,
                               child: ElevatedButton(child: Text(Languages
                      .of(context)
                      .start), onPressed:() async{
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                         await prefs.setBool('boolValue', true); 
                       
                                
                                Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => switching_page(),
      ),
      (route) => false,
    );
                               } ,),
                             ):Container()
                             
     
              ],
            ),
          ),
        ),
        
                ])])
      );

  _createLanguageDropDown() {
    return DropdownButton<LanguageData>(
      iconSize: 30,
      hint: Row(children: [ Icon(
            Icons.language,
            color: Colors.black,
          ), 
          SizedBox(width: 15,),
          Text('$lg'),],),
      //Text(Languages
          //.of(context)
          //.labelSelectLanguage),
      onChanged: (LanguageData language) {
        changeLanguage(context, language.languageCode);
        affichage_button_start=true;
        laguage_select(language.languageCode);
      },
      items: LanguageData.languageList()
          .map<DropdownMenuItem<LanguageData>>(
            (e) =>
            DropdownMenuItem<LanguageData>(
              value: e,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    e.flag,
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(e.name)
                ],
              ),
            ),
      )
          .toList(),
    );
  }
}