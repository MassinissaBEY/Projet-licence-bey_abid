



import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_6/localization/language/languages.dart';
import 'package:flutter_application_6/model/api.dart';
import 'package:flutter_application_6/model/variables.dart';
import 'package:shared_preferences/shared_preferences.dart';

class modfy_profile extends StatefulWidget {
  

  @override
  State<modfy_profile> createState() => _modfy_profileState();
  final int user_id;
  modfy_profile({this.user_id});
}

class _modfy_profileState extends State<modfy_profile> {
@override
  void initState(){
     
    super.initState();  
    
    get_info();
  }

  var user_info;
  String name;
  String email;
  String adresse;
  String phone;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      SingleChildScrollView(child: 
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
                        
      
                ]),
              SizedBox(height: 50,)  ,  




                        Container(
                          margin: EdgeInsets.only(left: 40,right:40),
                              child: TextField(
                                
                                controller:
                               
                               user_info==null? TextEditingController(text: "Loading...")
                               :TextEditingController(text: name),
                                onChanged:(value) {
                                   name= value;
                               
                                },
                            
                                decoration:
                               
                              InputDecoration(
                                 
                              labelText: Languages.of(context).name,
                              hintText: Languages.of(context).name,
                              fillColor: Colors.white,
                              filled: true,
                              prefixIcon: Padding(
                            padding: EdgeInsets.only(top: 0), // add padding to adjust icon
                            child: Icon(Icons.person),
                            ),
                             
            
            
                              contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide(color: Color.fromARGB(255, 2, 62, 138))),
                              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide(color: Colors.grey.shade400)),
                              errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide(color: Colors.red, width: 2.0)),
                              focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide(color: Colors.red, width: 2.0)),
                              )
                              ),
                              decoration: BoxDecoration(boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 20,
        offset: const Offset(0, 5),
      )
    ]),
                            ),


         SizedBox(height: 20,),

                            Container(
                          margin: EdgeInsets.only(left: 40,right:40),
                              child: TextField(
                                
                                controller:
                               
                               user_info==null? TextEditingController(text: "Loading...")
                               :TextEditingController(text: email),
                                onChanged:(value) {
                                   email= value;
                               
                                },
                            
                                decoration:
                               
                              InputDecoration(
                                 
                              labelText: Languages.of(context).email,
                              hintText: Languages.of(context).email,
                              fillColor: Colors.white,
                              filled: true,
                              prefixIcon: Padding(
                            padding: EdgeInsets.only(top: 0), // add padding to adjust icon
                            child: Icon(Icons.email),
                            ),
                             
            
            
                              contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide(color: Color.fromARGB(255, 2, 62, 138))),
                              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide(color: Colors.grey.shade400)),
                              errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide(color: Colors.red, width: 2.0)),
                              focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide(color: Colors.red, width: 2.0)),
                              )
                              ),
                              decoration: BoxDecoration(boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 20,
        offset: const Offset(0, 5),
      )
    ]),
                            ),




                            SizedBox(height: 20,),

                            Container(
                          margin: EdgeInsets.only(left: 40,right:40),
                              child: TextField(
                                
                                controller:
                               
                               user_info==null? TextEditingController(text: "Loading...")
                               :TextEditingController(text: adresse),
                                onChanged:(value) {
                                   adresse= value;
                               
                                },
                            
                                decoration:
                               
                              InputDecoration(
                                 
                              labelText: Languages.of(context).adresse,
                              hintText: Languages.of(context).adresse,
                              fillColor: Colors.white,
                              filled: true,
                              prefixIcon: Padding(
                            padding: EdgeInsets.only(top: 0), // add padding to adjust icon
                            child: Icon(Icons.pin_drop),
                            ),
                             
            
            
                              contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide(color: Color.fromARGB(255, 2, 62, 138))),
                              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide(color: Colors.grey.shade400)),
                              errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide(color: Colors.red, width: 2.0)),
                              focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide(color: Colors.red, width: 2.0)),
                              )
                              ),
                              decoration: BoxDecoration(boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 20,
        offset: const Offset(0, 5),
      )
    ]),
                            ),




                            SizedBox(height: 20,),

                            Container(
                          margin: EdgeInsets.only(left: 40,right:40),
                              child: TextField(
                                
                                controller:
                               
                               user_info==null? TextEditingController(text: "Loading...")
                               :TextEditingController(text: phone),
                                onChanged:(value) {
                                   phone= value;
                               
                                },
                            
                                decoration:
                               
                              InputDecoration(
                                 
                              labelText: Languages.of(context).tel,
                              hintText: Languages.of(context).tel,
                              fillColor: Colors.white,
                              filled: true,
                              prefixIcon: Padding(
                            padding: EdgeInsets.only(top: 0), // add padding to adjust icon
                            child: Icon(Icons.phone),
                            ),
                             
            
            
                              contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide(color: Color.fromARGB(255, 2, 62, 138))),
                              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide(color: Colors.grey.shade400)),
                              errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide(color: Colors.red, width: 2.0)),
                              focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide(color: Colors.red, width: 2.0)),
                              )
                              ),
                              decoration: BoxDecoration(boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 20,
        offset: const Offset(0, 5),
      )
    ]),
                            ),



                            SizedBox(height: 20,),

                            Container(
                          margin: EdgeInsets.only(left: 40,right:40),
                              child: TextField(
                                
                                controller:
                               
                               user_info==null? TextEditingController(text: "Loading...")
                               :TextEditingController(text: password),
                                onChanged:(value) {
                                   password= value;
                               
                                },
                            
                                decoration:
                               
                              InputDecoration(
                                 
                              labelText: Languages.of(context).password,
                              hintText: Languages.of(context).password,
                              fillColor: Colors.white,
                              filled: true,
                              prefixIcon: Padding(
                            padding: EdgeInsets.only(top: 0), // add padding to adjust icon
                            child: Icon(Icons.key),
                            ),
                             
            
            
                              contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide(color: Color.fromARGB(255, 2, 62, 138))),
                              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide(color: Colors.grey.shade400)),
                              errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide(color: Colors.red, width: 2.0)),
                              focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide(color: Colors.red, width: 2.0)),
                              )
                              ),
                              decoration: BoxDecoration(boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 20,
        offset: const Offset(0, 5),
      )
    ]),
                            ),


          SizedBox(height: 30,),

          ElevatedButton(onPressed: (){
                  changement ();
          }, child: Text('Confirmer'))
                       
                ])
                ,)
    );
  }



  get_info() async {
   SharedPreferences pref = await SharedPreferences.getInstance();         
         token = await pref.getString('token');
         
              print(token);

      var data = new Map<String, dynamic>();
            if (token != null && token.length > 0) {
  token = token.substring(1, token.length - 1);
}             data['token'] = token;
      
  var response = await Api().postData(data,'/user/find');
    if (response.statusCode == 200) {
     
      setState(() {
        user_info = json.decode(response.body);
        name = user_info['name'].toString();
        email = user_info['email'].toString();
        adresse = user_info['adresse'].toString();
        phone = "0"+user_info['Phone'].toString();
        
      });
     
      }
  }


     changement () async {

       var data = new Map<String, String>();
    data['name'] = name.toString();
    data['Phone'] = phone.toString();
    data['email'] = email.toString();
    data['adresse'] = adresse.toString();
    data['password'] = password.toString();


  var response = await Api().postData(data,'/user/update/'+user_info['id'].toString());
    //var response = await Api().postData(data, '/offer');

    if (response.statusCode == 200) {
      setState(() {
         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("offre correctement ajoutée")));
      
      });
}  
}
  } 
