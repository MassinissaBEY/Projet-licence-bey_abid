import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_6/model/api.dart';
import 'package:flutter_application_6/model/variables.dart';
import 'package:flutter_application_6/screens/espace_client/modify_profile.dart';
import 'package:flutter_application_6/widgets/header_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

 class profile extends StatefulWidget {
  const profile({ Key key }) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {


 void initState(){
     
    super.initState();  
   loadprofile();
  }

var user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
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
             

           SingleChildScrollView(
        child:
      Column(children: [


  Stack(children: [
    
    Container(
      margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.87,
      right: 20
      ),
      child:
      InkWell(
        onTap: () {
          Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                             
                                              modfy_profile(user_id: user['id'])
                                              ));
        },
        child:
      Icon(Icons.edit),),          
    ),
            Container(
              
            
              alignment: Alignment.center,
              child: 
           
                   Column(
                      children: [
                      
                 

                          
                          
                              Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                             
                               Container(
                                 margin: EdgeInsets.only(top:50),
                                 height: 140,
                                 width: 140,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                   width: 0.2, //                   
                                     ),
                                  borderRadius: BorderRadius.circular(100),
                                 color: Color.fromARGB(190, 179, 175, 175),),
                                 child: ClipOval(child:
                                  
                                
                                 Icon(
                                  Icons.person,
                                  color: Colors.white,
                                  size: 80.0,
                                ),
                             
                                 )
                               ),
                               
                             
                               
                               
                              ],
                              ),
                              SizedBox(height: 10,),
                            
                     Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                        //  Text(user['name'])
                          user != null ? Text(user['name'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),) : Text('Loading...'),
                            ],),
                       
                        

                      SizedBox(height: 80,),
                     
                         
                          Container(
                           height: 1,
                            color: Color.fromARGB(255, 2, 62, 138),
                            ),
                            
                          SizedBox(height: 20,),

                         Container(
                           margin: EdgeInsets.only(left: 20,right: 20),
                           child:
                            Row(children: [
                              Icon(Icons.mail_outline, color: Color.fromARGB(255, 2, 62, 138),size: 25,),
                              SizedBox(width: 20,),
                              user != null ? Flexible(child:Text(user['email'],style: TextStyle(color: Color.fromARGB(255, 2, 62, 138),fontSize: 18),)) :Text('Loading...'),
                            ],)
                         ),

                                SizedBox(height: 20,),

                         Container(
                           margin: EdgeInsets.only(left: 20,right: 20),
                           child:
                            Row(children: [
                              Icon(Icons.phone_outlined, color: Color.fromARGB(255, 2, 62, 138),size: 25,),
                              SizedBox(width: 20,),
                             user != null ?  Text('0'+user['Phone'].toString(),style: TextStyle(color: Color.fromARGB(255, 2, 62, 138),fontSize: 18),)  :Text('Loading...'),
                            ],)
                         ),


                               SizedBox(height: 20,),

                         Container(
                           margin: EdgeInsets.only(left: 20,right: 20),
                           child:
                            Row(children: [
                              Icon(Icons.map_outlined, color: Color.fromARGB(255, 2, 62, 138),size: 25,),
                              SizedBox(width: 20,),
                             Flexible(child: 
                             user != null ?   Text(user['adresse'].toString(),style: TextStyle(color: Color.fromARGB(255, 2, 62, 138),fontSize: 18),)
                             :Text("Loading...")
                             )
                            ],)
                         ),


                                SizedBox(height: 20,),

                        
                         
                         SizedBox(height: 20,),

                         Container(
                           height: 1,
                            color: Color.fromARGB(255, 2, 62, 138),
                            ),

                            SizedBox(height: 40,),

                           

                      ])

        )
      ])
      
        ])
      )


                ]))
              
    );


  }





   loadprofile () async{
      
       SharedPreferences pref = await SharedPreferences.getInstance();         
         token = await pref.getString('token');
         
              

      var data = new Map<String, dynamic>();
            if (token != null && token.length > 0) {
  token = token.substring(1, token.length - 1);
}

    
 
      
         print(token);
        data['token'] = token;

     
       



       
 Future.delayed(Duration(milliseconds: 50)).then((_) async{

   var response = await Api().postData(data,'/find_user');
    
      if (response.statusCode == 200){
        
      final body = jsonDecode(response.body);
      setState(() {
        user = body;
      });
      
       print(body.toString());
      if(body['agence']!=null){
        SharedPreferences prefs = await SharedPreferences.getInstance();
            saugarder_agence();
           prefs.setBool('bool_agence',true);
      }
    }else{
       
        deconnexion ();
        check_agence_connenct();
        check_client_conncet();
          SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool('bool_agence',false);
         Future.delayed(Duration(milliseconds: 10)).then((_) {
      
         });
        
    }
 });
  
   
   }
}