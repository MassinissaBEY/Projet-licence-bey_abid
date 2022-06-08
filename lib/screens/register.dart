

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_6/localization/language/languages.dart';
import 'package:flutter_application_6/model/api.dart';
import 'package:flutter_application_6/widgets/header_widget.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/services.dart';



class RegistrationPage extends  StatefulWidget{
  @override
  State<StatefulWidget> createState() {
     return _RegistrationPageState();
  }
}

class _RegistrationPageState extends State<RegistrationPage>{

  
  bool checkedValue = false;
  bool checkboxValue = false;
  XFile photo;
  File image_show;
  double a = 5;
  bool _passwordVisible=false;
  List<bool> _selection =[true,false];
  bool image_registre_bool = false;
  File image_register;
  String name_image;
  var emailController= TextEditingController();
  var namecontroller= TextEditingController();
  var passwordcontroller= TextEditingController();
  var companyController= TextEditingController();
  var phoneController= TextEditingController();
  var adresseController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(children: [

            Container(
              height: 200,
              child: HeaderWidget(200,false),
            ),

            Container(
              
              margin: EdgeInsets.fromLTRB(20, 50, 20, 10),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              alignment: Alignment.center,
              child: 
           
                   Column(
                      children: [
                        GestureDetector(
                          onTap: (){
                 if(photo!=null)
                 {
                   a=0;
                 }else{
                   a=5;
                 }
                showModalBottomSheet(
                  backgroundColor: Colors.transparent,  
    context: context,
    builder: (context) {
      return    
       Container(
         margin: EdgeInsets.only(left: 20,right: 20,bottom: 20),
           decoration: BoxDecoration(
             
          borderRadius: BorderRadius.circular(10),),
         child:
       Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
         borderRadius: BorderRadius.only(
          topRight: Radius.circular(5.0),
          topLeft: Radius.circular(5.0)),
              color:Colors.white,                            
                        ),         
                  
            child:
          ListTile(
            leading: new Icon(Icons.photo),
            title: new Text('Pick image from galery'),
            onTap: () {
              Navigator.pop(context);
              pickImageG_profil();
            },
          ),
          ),
          
           Container(height: 1,
           color: Colors.black,),
      
            Container(          
            decoration: BoxDecoration(
         borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(a),
          bottomRight: Radius.circular(a)),
              color:Colors.white,                            
                        ),         
            child:
           ListTile(
            leading: new Icon(Icons.photo_camera),
            title: new Text('Pick image from camera'),
            onTap: () {
              Navigator.pop(context);
              pickImageC_profile();
            },
          ),
            ),
            
          //   image != null ?
          //   Container(height: 1,
          //  color: Colors.black,):
                    

            photo != null ?
            Column(children: [
              Container(height: 1,
           color: Colors.black,),
            Container(          
            decoration: BoxDecoration(
              
         borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(5.0),
          bottomRight: Radius.circular(5.0)),
              color:Colors.white,                            
                        ),         
            child:
           ListTile(
            leading: new Icon(Icons.delete),
            title: new Text('Deletete Image'),
            onTap: () {
              Navigator.pop(context);
              setState(() {
                 photo=null;
              });
            
            },
          ),
            ) 
            ],)
            : Container()
        ],)
       
      );
    });
                          },

                          
                          child: Stack(
                            children: [
                              Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                               Stack(children: [
                               Container(
                                 margin: EdgeInsets.only(top:50),
                                 height: 140,
                                 width: 140,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                  width: 0.2 //                   
                                     ),
                                  borderRadius: BorderRadius.circular(100),
                                 color: Color.fromARGB(190, 179, 175, 175),),
                                 child: ClipOval(child:
                                  
                                  photo == null ?
                                 Icon(
                                  Icons.person,
                                  color: Colors.white,
                                  size: 80.0,
                                ):
                               
                               Image.file(image_show,fit: BoxFit.cover,) 
                               ,)
                               ),
                               
                              //  padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 130, 0, 0),
                                  padding: EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                    color: Color.fromARGB(255, 85, 85, 85),),
                                  child:Icon(
                                  Icons.photo_camera_rounded,
                                  color: Colors.white,
                                  size: 30.0,
                                ),
                                
                               )
                               ],)
                              ],
                              ),
                            
                            ],
                          ),
                        ),
                        SizedBox(height: 50,),
                        
               Row(children: [
                 Text(Languages.of(context).cree_compte ,
                 style: TextStyle(fontWeight: FontWeight.bold),),
                 Expanded(child:  SizedBox()),


                      ToggleButtons(
        children: <Widget>[
           Row(
            
             children:
            [ 
              SizedBox(width: 5,),
              Text(Languages.of(context).client,
              style: TextStyle(color: _selection[0] 
           ?Colors.blueAccent
           :Colors.grey),),
              SizedBox(width: 15,),
               Icon(Icons.person,
            color: _selection[0] 
           ?Colors.blueAccent
           :Colors.grey),
                 SizedBox(width: 5,),
           ],),

           Row(children:
            [ 
              SizedBox(width: 5,),
              Text(Languages.of(context).agence,
              style: TextStyle(color: _selection[1] 
           ?Colors.blueAccent
           :Colors.grey),),
              SizedBox(width: 15,),
          Icon(Icons.real_estate_agent , 
          color: _selection[1] 
           ?Colors.blueAccent
           :Colors.grey
          ),
            SizedBox(width: 5,),
            ])
          
        ],
        borderColor: Color.fromARGB(117, 231, 224, 224),
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(10),
        borderWidth: 2,
        isSelected: _selection,
        onPressed: (index) {
          setState(() {
            if(index==0)
            _selection = [true,false];
            else
            _selection = [false,true];
          });
        },
      ),
      ],),

                      SizedBox(height: 20,),
                        Container(                         
                              child:
                             
                               TextField(
                                controller: namecontroller,
                                decoration: 
                              InputDecoration(
                              labelText: Languages.of(context).full_name,
                              hintText: Languages.of(context).full_name,
                              fillColor: Colors.white,
                              filled: true,
                              prefixIcon: Padding(
                              padding: EdgeInsets.only(top: 0), // add padding to adjust icon
                              child: Icon(Icons.badge),
                              ),
                                contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide(color: Color.fromARGB(255, 2, 62, 138))),
                                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide(color: Colors.grey.shade400)),
                                errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide(color: Colors.red, width: 2.0)),
                              focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide(color: Colors.red, width: 2.0)),
                                )
                              ),
                              
                              decoration:BoxDecoration(
                                boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 20,
        offset: const Offset(0, 5),
      )
    ])
                            ),
                      
                        SizedBox(height: 15.0),
                          Visibility(
                            visible: _selection[1],
                            child: 
                        Container(        
                          margin: EdgeInsets.only(bottom: 15),                 
                              child:
                               
                               TextField(
                                controller: companyController,
                                decoration: 
                              InputDecoration(
                              labelText: Languages.of(context).name_company,
                              hintText: Languages.of(context).full_name_company,
                              fillColor: Colors.white,
                              filled: true,
                              prefixIcon: Padding(
                              padding: EdgeInsets.only(top: 0), // add padding to adjust icon
                              child: Icon(Icons.store),
                              ),
                                contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide(color: Color.fromARGB(255, 2, 62, 138))),
                                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide(color: Colors.grey.shade400)),
                                errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide(color: Colors.red, width: 2.0)),
                              focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide(color: Colors.red, width: 2.0)),
                                )
                              ),
                              
                              decoration:BoxDecoration(
                                boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 20,
        offset: const Offset(0, 5),
      )
    ])
                            ),
                          ),

                            Container(
                              child:
                          
                               TextField(
                                controller: emailController,
                                decoration: 
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

                        SizedBox(height: 15.0),
                          Container(
                              child:
                             
                               TextField(
                                  keyboardType: TextInputType.phone,
                                controller: phoneController,
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
                              
                              decoration:BoxDecoration(boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 20,
        offset: const Offset(0, 5),
      )
    ])
                            ),
SizedBox(height: 15,),
                       

                                                    Container(
                              child: TextField(
                                 obscureText: !_passwordVisible,
                                controller: passwordcontroller,
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
                     SizedBox(height: 15,),

                   
                   

                    
                    
    //                    Visibility(
    //                      visible: _selection[1] && !image_registre_bool,
    //                      child: 
    //                    InkWell(
    //                      onTap: (){
    //                        showModalBottomSheet(
    //               backgroundColor: Colors.transparent,
                  
        
    // context: context,
    // builder: (context) {
    //   return    
    //    Container(
    //      margin: EdgeInsets.only(left: 20,right: 20,bottom: 20),
    //        decoration: BoxDecoration(
             
    //       borderRadius: BorderRadius.circular(10),),
    //      child:
    //    Column(
    //     mainAxisSize: MainAxisSize.min,
    //     children: <Widget>[
    //       Container(
    //           decoration: BoxDecoration(
    //      borderRadius: BorderRadius.only(
    //       topRight: Radius.circular(5.0),
    //       topLeft: Radius.circular(5.0)),
    //           color:Colors.white,                            
    //                     ),         
                  
    //         child:
    //       ListTile(
    //         leading: new Icon(Icons.photo),
    //         title: new Text('Pick image from galery'),
    //         onTap: () {
    //           Navigator.pop(context);
    //           pickImageG_register();
    //         },
    //       ),
    //       ),
          
    //        Container(height: 1,
    //        color: Colors.black,),
      
    //         Container(          
    //         decoration: BoxDecoration(
    //      borderRadius: BorderRadius.only(
    //       bottomLeft: Radius.circular(5),
    //       bottomRight: Radius.circular(5)),
    //           color:Colors.white,                            
    //                     ),         
    //         child:
    //        ListTile(
    //         leading: new Icon(Icons.photo_camera),
    //         title: new Text('Pick image from camera'),
    //         onTap: () {
    //           Navigator.pop(context);
    //           pickImageC_register();
    //         },
    //       ),
    //         ),
            
    //         image_register != null ?
    //         Column(children: [
    //           Container(height: 1,
    //        color: Colors.black,),
    //         Container(          
    //         decoration: BoxDecoration(
              
    //      borderRadius: BorderRadius.only(
    //       bottomLeft: Radius.circular(5.0),
    //       bottomRight: Radius.circular(5.0)),
    //           color:Colors.white,                            
    //                     ),         
    //         child:
    //        ListTile(
    //         leading: new Icon(Icons.delete),
    //         title: new Text('Deletete Image'),
    //         onTap: () {
    //           Navigator.pop(context);
    //           setState(() {
    //              image_register=null;
    //           });
            
    //         },
    //       ),
    //         ) 
    //         ],)
    //         : Container()
    //     ],)
       
    //   );
    // });
    //                      },
    //                      child: 
    //                    Container(
    //                      margin: EdgeInsets.only(top: 15),
    //                      height: 48,
    //                      decoration: BoxDecoration(
    //                        color: Colors.white,
    //                        borderRadius: BorderRadius.all( 
    //         Radius.circular(5.0),
    //       ),
    //         border: Border.all(
    //                 color: Colors.grey,
    //                 width: 1,
    //               ),
    //                        boxShadow: [
                           
    //   BoxShadow(
    //     color: Colors.black.withOpacity(0.1),
    //     blurRadius: 20,
    //     offset: const Offset(0, 5),
    //   )
    // ]),
    //                      child: 
    //                    Row(
    //                      crossAxisAlignment: CrossAxisAlignment.center,
    //                      children: [
    //                        SizedBox(width: 10,),
    //                       Icon(Icons.add_a_photo,color: Colors.grey,),
    //                        SizedBox(width: 15,),
    //                       Text("Please add photo of register",style: TextStyle(color: Color.fromARGB(255, 97, 95, 95)),)
    //                    ],),
    //                    ),
    //                    ),
    //                    ),
                       
                       



    //            image_register != null ? 
    //            InkWell(
    //              onTap: (){
    //                showModalBottomSheet(
    //               backgroundColor: Colors.transparent,
                  
        
    // context: context,
    // builder: (context) {
    //   return    
    //    Container(
    //      margin: EdgeInsets.only(left: 20,right: 20,bottom: 20),
    //        decoration: BoxDecoration(
             
    //       borderRadius: BorderRadius.circular(10),),
    //      child:
    //    Column(
    //     mainAxisSize: MainAxisSize.min,
    //     children: <Widget>[
    //       Container(
    //           decoration: BoxDecoration(
    //      borderRadius: BorderRadius.only(
    //       topRight: Radius.circular(5.0),
    //       topLeft: Radius.circular(5.0)),
    //           color:Colors.white,                            
    //                     ),         
                  
    //         child:
    //       ListTile(
    //         leading: new Icon(Icons.photo),
    //         title: new Text('Pick image from galery'),
    //         onTap: () {
    //           Navigator.pop(context);
    //           pickImageG_register();
    //         },
    //       ),
    //       ),
          
    //        Container(height: 1,
    //        color: Colors.black,),
      
    //         Container(          
    //         decoration: BoxDecoration(
    //      borderRadius: BorderRadius.only(
    //       bottomLeft: Radius.circular(0),
    //       bottomRight: Radius.circular(0)),
    //           color:Colors.white,                            
    //                     ),         
    //         child:
    //        ListTile(
    //         leading: new Icon(Icons.photo_camera),
    //         title: new Text('Pick image from camera'),
    //         onTap: () {
    //           Navigator.pop(context);
    //           pickImageC_register();
    //         },
    //       ),
    //         ),
        
                    

    //         image_register != null ?
           
    //         Column(children: [
    //           Container(height: 1,
    //        color: Colors.black,),
    //         Container(          
    //         decoration: BoxDecoration(
              
    //      borderRadius: BorderRadius.only(
    //       bottomLeft: Radius.circular(5.0),
    //       bottomRight: Radius.circular(5.0)),
    //           color:Colors.white,                            
    //                     ),         
    //         child:
    //        ListTile(
    //         leading: new Icon(Icons.delete),
    //         title: new Text('Deletete Image'),
    //         onTap: () {
    //           Navigator.pop(context);
    //           setState(() {
    //              image_register=null;
    //              image_registre_bool = false;
    //           });
            
    //         },
    //       ),
    //         ) 
    //         ],)
    //         : Container()
    //     ],)
       
    //   );
    // });
    //              },
    //              child:
    //               Visibility(
    //           visible: _selection[1],
    //           child: 
    //            Container(
    //           height: 200,
    //           width: MediaQuery.of(context).size.width*1,
    //           margin: EdgeInsets.only(top: 15),
    //           decoration: BoxDecoration(
    //                        color: Color.fromARGB(69, 230, 220, 220),
    //                        borderRadius: BorderRadius.all( 
    //         Radius.circular(5.0),
    //       ),
    //         border: Border.all(
    //                 color: Colors.grey,
    //                 width: 1,
    //               ),
    //                        boxShadow: [
                           
    //   BoxShadow(
    //     color: Colors.black.withOpacity(0.1),
    //     blurRadius: 20,
    //     offset: const Offset(0, 5),
    //   )
    // ]),                 
    //           child:
    //           Stack(  
    //             children: [
    //         Row(mainAxisAlignment: MainAxisAlignment.center,
    //           children: [  
    //            Image.file(image_register,fit: BoxFit.cover ,),],),
    //            Container(
    //              margin: EdgeInsets.only(top: 10,left: 10),
    //              child: Icon(Icons.edit,color: Colors.grey,)),
    //              Text(name_image)
    //                 ],),
    //            )   )
    //                 ): Container(),

    //                     SizedBox(height: 15.0),

                         

                            Visibility(
                              visible: _selection[1],
                              child: 
                           Container(
                              margin: EdgeInsets.only(bottom:20),
                              
                           child:
                               TextField(
                                   keyboardType: TextInputType.multiline,
                                   maxLines: 3,
                                controller: adresseController,
                                decoration: 
                               
                              InputDecoration(
                                
                              labelText: Languages.of(context).adresse,
                              hintText: Languages.of(context).full_adresse,
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
                              
                              decoration:BoxDecoration(boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 20,
        offset: const Offset(0, 5),
      )
    ])
                            ),
                            ),

                     

                        
                        SizedBox(height: 80.0),
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
                              padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                              child: Text(
                                Languages.of(context).register.toUpperCase(),
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onPressed: () {
                              _submit();
                            },
                          ),
                        ),
                        
                        
                
                   
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

Future pickImageG_profil() async {
    // try {
    //   final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    //   if(image == null) return;

    //   final imageTemp = File(image.path);

    //   setState(() => this.image = imageTemp);
    // } on PlatformException catch(e) {
    //   print('Failed to pick image: $e');
    // }
  XFile res = await ImagePicker().pickImage(source: ImageSource.gallery);
  
  photo = res;
  
  setState(() => this.image_show = File(res.path));
  }


  Future pickImageC_profile() async {
    
      XFile res = await ImagePicker().pickImage(source: ImageSource.camera);
     
      

      
     
    photo = res;
  
  setState(() => this.image_show = File(res.path));
  }



  Future pickImageG_register() async {
    try {
      final image_register = await ImagePicker().pickImage(source: ImageSource.gallery);
         image_registre_bool=true;
      if(image_register == null) return;
           name_image = image_register.name.toString();
      final imageTemp = File(image_register.path);
      
      setState(() => this.image_register = imageTemp);
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }


   Future pickImageC_register() async {
    try {
      final image_register = await ImagePicker().pickImage(source: ImageSource.camera);
     image_registre_bool=true;
      if(image_register == null) return;

      final imageTemp = File(image_register.path);

      setState(() => this.image_register = imageTemp);
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }


   void _submit() async {

    if(emailController.text.isEmpty || passwordcontroller.text.isEmpty || namecontroller.text.isEmpty){
       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please put all the informations")));
    }else{
   
       var data = {'email': emailController.text, 'password': passwordcontroller.text, 'name':namecontroller.text};

        if (_selection[1]==true){
      data['agence']=1.toString();
         
       if(companyController.text.isEmpty || passwordcontroller.text.isEmpty || namecontroller.text.isEmpty){
       
       }
    



    }

    
    
    

    if(photo!=null){
      var response = await Api().postDataWithImage(data,'/register', photo.path);
      if (response.statusCode == 201){
      final body = jsonDecode(response.body);
       print(body);
       print(response.statusCode.toString());
  //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("enregistrer : ${body['user']['email']}")));
    }
    }else{
        var response = await Api().postData(data,'/register');

        if (response.statusCode == 201){
      final body = jsonDecode(response.body);
    
       print(body);
       print(response.statusCode.toString());
    
    }
    }
      
   

    }

   }

}