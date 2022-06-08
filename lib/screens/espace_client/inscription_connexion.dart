import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_6/localization/language/languages.dart';
import 'package:flutter_application_6/model/api.dart';
import 'package:flutter_application_6/model/variables.dart';
import 'package:flutter_application_6/screens/espace_client/switching_page.dart';
import 'package:flutter_application_6/screens/register.dart';
import 'package:flutter_application_6/widgets/header_widget.dart';


import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';





class inscription extends StatefulWidget {
  const inscription({ Key key }) : super(key: key);

  @override
  State<inscription> createState() => _inscriptionState();
}

class _inscriptionState extends State<inscription> {
   bool _passwordVisible=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         body: 
        
         Stack(children: [
            
        
            
         SingleChildScrollView(
           
           child: 
         Column(children: [
            
            
           
           Container(
             margin: EdgeInsets.only(top: 100),
             child: Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [Text("Signup",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),)]),),
             
             
             SizedBox(height: 35,),
             

             
           
           
     Column(children: [
           Container(
               margin: EdgeInsets.only(left:20,right: 20),
               child:
             TextFormField(
             autofocus: false,
             // controller: emailController,
            keyboardType: TextInputType.text,
            enabled: true,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                prefixIcon: Padding(
                        padding: EdgeInsets.only(top: 0), // add padding to adjust icon
              child: Icon(Icons.person),
                ),
            labelText: 'Name',
    hintText: 'Please type full name',
    border: OutlineInputBorder(
    //  borderSide: BorderSide(color: Colors.teal),
    ),
  ),
  onFieldSubmitted: (term) {
  //  fname.unfocus();
    //FocusScope.of(context).requestFocus(lname);
  },
)
),
           

           SizedBox(height: 15,),

           Container(
               margin: EdgeInsets.only(left:20,right: 20),
               child:
             TextFormField(
             autofocus: false,
             // controller: emailController,
            keyboardType: TextInputType.text,
            enabled: true,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                prefixIcon: Padding(
                        padding: EdgeInsets.only(top: 0), // add padding to adjust icon
              child: Icon(Icons.email),
                ),
            labelText: 'Email',
    hintText: 'email@example.com',
    border: OutlineInputBorder(
    //  borderSide: BorderSide(color: Colors.teal),
    ),
  ),
  onFieldSubmitted: (term) {
  //  fname.unfocus();
    //FocusScope.of(context).requestFocus(lname);
  },
)
),


SizedBox(height: 30,),

Container(
               margin: EdgeInsets.only(left:20,right: 20),
               child:
             TextFormField(
             autofocus: false,
             // controller: emailController,
            keyboardType: TextInputType.text,
            enabled: true,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                prefixIcon: Padding(
                        padding: EdgeInsets.only(top: 0), // add padding to adjust icon
              child: Icon(Icons.phone),
                ),
            labelText: 'Phone',
    hintText: 'Please enter your phone number',
    border: OutlineInputBorder(
    //  borderSide: BorderSide(color: Colors.teal),
    ),
  ),
  onFieldSubmitted: (term) {
  //  fname.unfocus();
    //FocusScope.of(context).requestFocus(lname);
  },
)
),



  SizedBox(height: 30,),




            Container( margin:EdgeInsets.only(left: 20,right: 20),
              child: TextFormField(
                
               // controller: passwordController,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                obscureText: !_passwordVisible,
               
                decoration: InputDecoration(
                  border: OutlineInputBorder(
     // borderSide: BorderSide(color:Color.fromARGB(255, 2, 62, 138)),
    ),
                  hintText: "Enter your password",
                  hintStyle: TextStyle(fontSize: 12) ,
                 labelStyle: TextStyle(
              //fontWeight: FontWeight.bold,
              //fontSize: 20
            ),
              prefixIcon: Padding(
            padding: EdgeInsets.only(top: 0), // add padding to adjust icon
            child: Icon(Icons.key),
          ),
                    labelText: 'Password',
                    
                    suffixIcon: IconButton(
            icon: Icon(
              // Based on passwordVisible state choose the icon
               _passwordVisible
               ? Icons.visibility
               : Icons.visibility_off,
               color:  _passwordVisible
               ? Theme.of(context).primaryColorDark
               : Colors.grey
               
               
               
               ),
            onPressed: () {
               // Update the state i.e. toogle the state of passwordVisible variable
               setState(() {
                   _passwordVisible = !_passwordVisible;
               });
             },
            ),
                    
                    ),
              ),
            ), 
],),
      SizedBox(height: 50,),
    Row(
            mainAxisAlignment: MainAxisAlignment.center,
          //  crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Container(
              width: 250,
              height: 50,
              
              child: 
            ElevatedButton( 
                    style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 2, 62, 138)),
         
                ),

              onPressed: (){
           inscription;
            },
              child: Text("Login",style: TextStyle(fontSize: 18),)),

              ),
          ],),
       



    Container(margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.10,bottom: 15),
  
             child: Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>connexion()));
                },
                child: Text.rich(
                  TextSpan(
                    text: 'Don\'t have an account',
                    style: TextStyle(fontSize: 16, ),
                    children: [
                      TextSpan(
                        text: '   Signup',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 2, 62, 138)
                        ),
                      ),
                    ]
                  ),
                ),
              ),
             ],),
         )
         ],),
         ),
          Container(
                      height: 80,
                      
                      //color: Colors.red,),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            
                            image: AssetImage("assets/Group 4 (6).png"),
                            fit:BoxFit.cover
                          ),
                          //color: Color(0xffE5E7F3),
                        
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                          ))
                          
                          ),
          ],)
         
         
       );
  }
}













/////////////////////////////////////////////////////////////////////////////////////////////////////////////









// class connexion extends StatefulWidget {
//      const connexion({ Key key }) : super(key: key);
   
//      @override
//      State<connexion> createState() => _connexionState();
//    }
   
//    class _connexionState extends State<connexion> {
//        bool _passwordVisible=false;
//       var emailController = TextEditingController();
//       var passwordController = TextEditingController();
//       var nameController = TextEditingController();
//      @override
//      Widget build(BuildContext context) {
//        return Scaffold(
//          body: 
        
//          Stack(children: [
            
        
            
//          SingleChildScrollView(
           
//            child: 
//          Column(children: [
            
              
           
//            Container(
//              margin: EdgeInsets.only(top: 180),
//              child: Row(
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: [Text("Login",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),)]),),
             
             
//              SizedBox(height: 80,),
             


//            Container(
//                margin: EdgeInsets.only(left:20,right: 20),
//                child:
//              TextFormField(
//              autofocus: false,
//               controller: emailController,
//             keyboardType: TextInputType.text,
//             enabled: true,
//               textInputAction: TextInputAction.next,
//               decoration: InputDecoration(
//                 prefixIcon: Padding(
//                         padding: EdgeInsets.only(top: 0), // add padding to adjust icon
//               child: Icon(Icons.email),
//                 ),
//             labelText: 'Email',
//     hintText: 'email@example.com',
//     border: OutlineInputBorder(
//     //  borderSide: BorderSide(color: Colors.teal),
//     ),
//   ),
//   onFieldSubmitted: (term) {
//   //  fname.unfocus();
//     //FocusScope.of(context).requestFocus(lname);
//   },
// )
// ),



//   SizedBox(height: 30,),




//             Container( margin:EdgeInsets.only(left: 20,right: 20),
//               child: TextFormField(
                
//                 controller: passwordController,
//                 keyboardType: TextInputType.text,
//                 textInputAction: TextInputAction.next,
//                 obscureText: !_passwordVisible,
               
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(
//      // borderSide: BorderSide(color:Color.fromARGB(255, 2, 62, 138)),
//     ),
//                   hintText: "Enter your password",
//                   hintStyle: TextStyle(fontSize: 12) ,
//                  labelStyle: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 20
//             ),
//               prefixIcon: Padding(
//             padding: EdgeInsets.only(top: 0), // add padding to adjust icon
//             child: Icon(Icons.password),
//           ),
//                     labelText: 'Password',
                    
//                     suffixIcon: IconButton(
//             icon: Icon(
//               // Based on passwordVisible state choose the icon
//                _passwordVisible
//                ? Icons.visibility
//                : Icons.visibility_off,
//                color:  _passwordVisible
//                ? Theme.of(context).primaryColorDark
//                : Colors.grey
               
               
               
//                ),
//             onPressed: () {
//                // Update the state i.e. toogle the state of passwordVisible variable
//                setState(() {
//                    _passwordVisible = !_passwordVisible;
//                });
//              },
//             ),
                    
//                     ),
//               ),
//             ), 

//       SizedBox(height: 50,),
//     Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//           //  crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//             Container(
//               width: 250,
//               height: 50,
              
//               child: 
//             ElevatedButton( 
//                     style: ButtonStyle(
//                 backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 2, 62, 138)),
         
//                 ),

//               onPressed: (){
//            inscription;
//             },
//               child: Text("Login",style: TextStyle(fontSize: 18),)),

//               ),
//           ],),
       



//     Container(margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.10,bottom: 15),
  
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.center,
//                children: [
//                 GestureDetector(
//                 onTap: (){
//                   Navigator.push(context, MaterialPageRoute(builder: (context)=>connexion()));
//                 },
//                 child: Text.rich(
//                   TextSpan(
//                     text: 'Don\'t have an account',
//                     style: TextStyle(fontSize: 16, ),
//                     children: [
//                       TextSpan(
//                         text: '   Signup',
//                         style: TextStyle(
//                           fontSize: 18,
//                           color: Color.fromARGB(255, 2, 62, 138)
//                         ),
//                       ),
//                     ]
//                   ),
//                 ),
//               ),
//              ],),
//          )
//          ],),
//          ),
//           Container(
//                       height: 80,
                      
//                       //color: Colors.red,),
//                       decoration: BoxDecoration(
//                           image: DecorationImage(
                            
//                             image: AssetImage("assets/Group 4 (6).png"),
//                             fit:BoxFit.cover
//                           ),
//                           //color: Color(0xffE5E7F3),
                        
//                           borderRadius: BorderRadius.only(
//                             bottomLeft: Radius.circular(0.0),
//                             bottomRight: Radius.circular(0.0),
//                           ))
                          
//                           ),
//           ],)
         
         
//        );
//      }


//       void login() async{
//   if(passwordController.text.isNotEmpty && emailController.text.isNotEmpty){
//     var data = {'email': emailController.toString(), 'password': passwordController.toString()};
//    // var response = await Api().postData(data, '/login');
//     var response = await http.post(Uri.parse("http://192.168.137.244:8000/api/login"),
//     body: ({
//        "name":nameController.text,
//       "email":emailController.text,
//       "password":passwordController.text
//     })
//     );
//     if (response.statusCode == 200){
//       final body = jsonDecode(response.body);
//    //   print("login token " + body["token"]);
    
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("enregistrer : ${body['user']['email']}")));
//     }else{
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("invalid credentials")));
//     }
//   }else{
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Blank value is found")));
//   }
// }


// }
















class connexion extends StatefulWidget {
  const connexion({ Key key }) : super(key: key);

  @override
  State<connexion> createState() => _connexionState();
}

class _connexionState extends State<connexion> {
  double _headerHeight = 250;
  bool _passwordVisible=false;
   var emailController = TextEditingController();
   var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: _headerHeight,
              child: HeaderWidget(_headerHeight,true), //let's create a common header widget
            ),
            SafeArea(
              child: Container( 
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 10),// This will be the login form
                child: Column(
                  children: [
                    Text(
                      Languages.of(context).hello,
                      // style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                      style: TextStyle(fontSize: 58, fontWeight: FontWeight.bold),
                    ),
                    Text(
                          Languages.of(context).signin_into,
                      style: TextStyle(color: Colors.grey),
                    ),
                    

                    SizedBox(height: 30.0),
                   
                     // key: _formKey,
                      Column(
                          children: [
                            Container(
                              child:
                             
                               TextField(
                                  keyboardType: TextInputType.emailAddress,
                                controller: emailController,
                                decoration: //ThemeHelper().textInputDecoration('User Name', 'Enter your user name'),
                              InputDecoration(
                              labelText: Languages.of(context).email,
                              hintText: Languages.of(context).full_email,
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
                              
                              decoration:BoxDecoration(boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 20,
        offset: const Offset(0, 5),
      )
    ])
                            ),

                            SizedBox(height: 30.0),

                            Container(
                              child: TextField(
                                 obscureText: !_passwordVisible,
                                controller: passwordController,
                                decoration:
                               
                              InputDecoration(
                                
                              labelText: Languages.of(context).password,
                              hintText: Languages.of(context).full_password,
                              fillColor: Colors.white,
                              filled: true,
                              prefixIcon: Padding(
                            padding: EdgeInsets.only(top: 0), // add padding to adjust icon
                            child: Icon(Icons.key),
                            ),
                             suffixIcon: IconButton(
                             icon: Icon(            
                           _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                         color:  _passwordVisible
                         ? Theme.of(context).primaryColorDark
                         : Colors.grey               
               ),
            onPressed: () {
              
               setState(() {
                   _passwordVisible = !_passwordVisible;
               });
             },
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
                            SizedBox(height: 55.0),
                            
                            Container(
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 2, 62, 138),
                                boxShadow: [
                                  BoxShadow(color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)
                                          ],
                                  borderRadius: BorderRadius.circular(5), 
                              ),
                              child: ElevatedButton(
                                 style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 2, 62, 138)),),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                                  child: Text(Languages.of(context).sign_in, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                                ),
                                onPressed: (){
                                 log_in();
                                },
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(10,20,10,20),
                              //child: Text('Don\'t have an account? Create'),
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(text: Languages.of(context).dont_have_accont),
                                    TextSpan(
                                      text: "  "+Languages.of(context).create,
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = (){
                                         // Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationPage()));
                                         
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => 
                                          //create_account()
                                          RegistrationPage()
                                          ));
                                        },
                                      style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 2, 62, 138)),
                                    ),
                                  ]
                                )
                              ),
                            ),
                          ],
                        )
                    
                  ],
                )
              ),
            ),
          ],
        ),
      ),
    );
  }


  void log_in() async{
  if(passwordController.text.isNotEmpty && emailController.text.isNotEmpty){
    

     var data = {'email': emailController.text, 'password': passwordController.text};

    
    var response = await Api().postData(data, '/login');
    
    if (response.statusCode == 200){
      final body = jsonDecode(response.body);
   
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("enregistrer : ${body['user']['email']}")));
    sauvgarder_client();
    last_acces=4;
    SharedPreferences pref = await SharedPreferences.getInstance();         
    await pref.setString('token', json.encode(body['token'].toString()));
    await pref.setString('id', json.encode(body['user']['id'] ));
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => switching_page()),
  );  

    if (body['user']['agence']==1){
      saugarder_agence();
      sauvgarder_client ();
    }else{
      sauvgarder_client ();
    }
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("invalid credentials")));
    }
  }else{
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Blank value is found")));
  }
}


}


   









   class create_account extends StatefulWidget {
     const create_account({ Key key }) : super(key: key);
   
     @override
     State<create_account> createState() => _create_accountState();
   }
   
   class _create_accountState extends State<create_account> {
     double _headerHeight = 250;
     @override
     Widget build(BuildContext context) {
       return Scaffold(
         body: Column(mainAxisAlignment: MainAxisAlignment.start,
        
         children: [
          
             Container(
              height: _headerHeight,
              child: HeaderWidget(_headerHeight,true), //let's create a common header widget
            ),
            SizedBox(height: 100,),
            
         
           InkWell(child:Container(
            height: 50,
             margin: EdgeInsets.only(left: 40,right: 40),             
             decoration: BoxDecoration(
               color: Color.fromARGB(88, 187, 207, 230),
             border: Border.all(color:Color.fromARGB(87, 2, 61, 138) ),
             borderRadius: BorderRadius.circular(5),
             //color: Colors.yellow,
              ),
             
             child:
             Row(
               crossAxisAlignment: CrossAxisAlignment.center,
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                   SizedBox(width: 10,),
              Text("Créé compte tant que \n client",style: TextStyle(color: Colors.black)),
             Expanded(child:  SizedBox(),),
               Icon(Icons.arrow_forward,
               color: Color.fromARGB(255, 2, 61, 138)),
               SizedBox(width: 10,)
              ],),
           )),

    SizedBox(height: 10,),

           InkWell(child:Container(
             margin: EdgeInsets.only(left: 40,right: 40),
             height: 50,
             decoration: BoxDecoration(
             border: Border.all(color:Color.fromARGB(255, 182, 185, 189), ),
             color: Color.fromARGB(117, 222, 226, 230),
              borderRadius: BorderRadius.circular(5),
              ),
             child:
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [ 
                 SizedBox(width: 10,),
                 Text("Créé compte tant que \n agence immobiliere",style: TextStyle(color: Colors.black),),
               Expanded(child:  SizedBox(),),
               Icon(Icons.arrow_forward,
               color: Color.fromARGB(255, 73, 80, 87),),
               SizedBox(width: 10,)
             ],)
           )),
          
         ],),
       );
     }
   }