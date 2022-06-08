import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_6/model/api.dart';
import 'package:flutter_application_6/screens/offers_of_user.dart';
import 'package:flutter_application_6/widgets/header_widget.dart';







class agence_profile extends StatefulWidget {
 

  @override
  State<agence_profile> createState() => _agence_profileState();
   final int user_id;
  agence_profile({this.user_id});
}

class _agence_profileState extends State<agence_profile> {
   void initState() {
    super.initState();
    _loadprofile();
  }
  var user;
  int user_id;
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      backgroundColor: Colors.white,
     
      body:
      SingleChildScrollView(
        child:
      Column(children: [


  Stack(children: [

            Container(
              height: 200,
              child: HeaderWidget(200,false),
            ),

            Container(
              
              margin: EdgeInsets.fromLTRB(10, 50, 10, 10),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
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

                         Container(
                           margin: EdgeInsets.only(left: 20,right: 20),
                           child:
                            Row(children: [
                              Icon(Icons.campaign_outlined, color: Color.fromARGB(255, 2, 62, 138),size: 25,),
                              SizedBox(width: 20,),
                             user != null ?   Text(user['offer'].length.toString()+" annonces",style: TextStyle(color: Color.fromARGB(255, 2, 62, 138),fontSize: 18),)
                             :Text("Loading...")
                            ],)
                         ),
                         SizedBox(height: 20,),

                         Container(
                           height: 1,
                            color: Color.fromARGB(255, 2, 62, 138),
                            ),

                            SizedBox(height: 40,),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                       TextButton(onPressed: (){
                  Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      offer_of_user(user_id: user['id'] , user_name: user['name'])));
            }, 
            
            child: 
            Text("View offers of this agence"),),
                            ],),

                      ])

        )
      ])
      
        ])
      )
        );
      
        
    
  }





  _loadprofile() async {
     
    var response = await Api().getData('/user/' + widget.user_id.toString());
    
    if (response.statusCode == 200) {
      setState(() {
        user = json.decode(response.body);
       print(user);
       
    
        
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
            'Error ' + response.statusCode.toString() + ': ' + response.body),
      ));
    }

   
  }






}