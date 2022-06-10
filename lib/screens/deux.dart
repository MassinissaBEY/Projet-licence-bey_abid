import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_6/localization/language/languages.dart';
import 'package:flutter_application_6/screens/espace_client/dep.dart';
import 'package:flutter_application_6/screens/home.dart';
import 'package:flutter_application_6/screens/espace_client/switching_page.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter_application_6/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';




class WelcomeScreen extends StatefulWidget {
  

  @override
  State<WelcomeScreen> createState() => new _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with AfterLayoutMixin<WelcomeScreen> {
   Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);
    bool boolValue = (prefs.getBool('boolValue') ?? false);
    //prefs.setBool('boolValue', false);

    if (_seen) {
      if(boolValue){
       //  await prefs.setBool('boolValue', true); 
     Navigator.of(context).pushReplacement(       
          new MaterialPageRoute(builder: (context) => new switching_page()));
      }else{ Navigator.of(context).pushReplacement(

          new MaterialPageRoute(builder: (context) => new Home()));}     
    }else{
      
     Navigator.of(context).push(MaterialPageRoute(builder: (context)=> IntroScreen()));
    }}
//bool firstOpen = true;
//var showHome;
//_onIntroEnd(context) async{
  // final prefs = await SharedPreferences.getInstance();
  //final firstOpen = prefs.getBool('firstOpen')?? false;
  //Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Home()));
//}

@override
  void afterFirstLayout(BuildContext context) => checkFirstSeen();

@override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: Image.asset('assets/splash_screen1.png'),
      ),
    );
  }
}

_buildFullScreenImage(){
  return Container(
    height: 400,
    width:300,
   // margin: const EdgeInsets.all(22),
    margin: EdgeInsets.only(top: 170,  ),
    child: Image.asset('assets/splash_screen1.png',
    fit: BoxFit.contain,
    //height: double.infinity,
   // width: double.infinity,
  
alignment: Alignment.topCenter,)); 
}

_buildImage(
  
  String assetName, [double width = 350 , ]){
  return Image.asset('assets/$assetName',width: width,);
}

//@override
//void initState() {
 // super.initState();
  //Future.delayed(const Duration(seconds: 3), (){
    //if(!firstOpen){
     // _onIntroEnd(context);
    //}
  //});
//}


 
  
  
class IntroScreen extends StatelessWidget {
  @override
   Widget build(BuildContext context) {
    var pageDecoration = const PageDecoration(
      titleTextStyle:TextStyle(fontSize: 28.0,
      fontWeight: FontWeight.w700,),
    bodyTextStyle: TextStyle(fontSize: 19.0),
    descriptionPadding:EdgeInsets.all(16),
    pageColor:Colors.white,
    imagePadding:EdgeInsets.zero
    ); 
      return IntroductionScreen(
        globalBackgroundColor: Colors.white,        
        globalHeader: Align(
          alignment: Alignment.topCenter,
          child: Padding(padding: const EdgeInsets.only(top: 30,),
          child: _buildImage('logo_splash_screen.png',150),),
        
        ),
        pages: [  
             
          PageViewModel(
            title: "Welcome to IMRAN \n Bienvenue à IMRAN \nمرحبا بكم في عمران",
            body: " ",           
            
            image: _buildFullScreenImage(),
            decoration: pageDecoration.copyWith(contentMargin: const EdgeInsets.symmetric(horizontal: 16),
           // fullScreen: true,
            //bodyFlex: 2,
              bodyFlex: 2,
            
            imageFlex: 3,
            ),
          ),
          PageViewModel(
            title: '',
            body:"Contact the best real estate agencies\nContacter les meilleures agences immobilières\nتواصل مع أفضل الوكالات العقارية",   
            image: _buildImage('splach_screen2.png'),
            decoration: pageDecoration,
          ),
          PageViewModel(title: '',
          body:"Imran your partner in Choice\nImran votre Partenaire\nعمران شريكك في الاختيار",   
          image: _buildImage('splash_screen3.png'),
          decoration: pageDecoration,), 
        ],
        onDone: () async { 
           SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setBool('seen', true);
          Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  Home()),
            );},
        onSkip: () async { 
           SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setBool('seen', true); 
          Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  Home()),
            );},
        showSkipButton: true,
        skipFlex: 0,
        nextFlex: 0,
        skip: const Icon(Icons.skip_next,
        color: Colors.white,
        size: 30,),
        // const Text(
          // 'Skip',
         // // style:TextStyle(color: Colors.white)
      //  ),
        next: const Icon(Icons.arrow_forward,
        color: Colors.white,),
        done:  const Icon(Icons.check,
        size: 30,),
          //Text('Done',
          //style: TextStyle(fontWeight: FontWeight.w600,
         // color: Colors.white),),
          controlsMargin: const EdgeInsets.all(16),
          controlsPadding: const EdgeInsets.all(4),
          dotsDecorator: const DotsDecorator(
          size: Size(10.0, 10.0),
          color: Colors.white,
          activeSize: Size(22.0, 10.0),
          activeColor: Colors.amber,
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
        dotsContainerDecorator :  ShapeDecoration(color: Colors.black54,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0)))),
      );
   //   : WillPopScope(
//onWillPop: () async => false,
//child: Scaffold(
//body: SizedBox(
//height: size.height,
//width: double.infinity,
//child: Stack(
//children: [
//Positioned(
//top: 0,
//left: 0,
//child: Image.asset('assets/2.png',
//width: size.width * 0.3,
//),
//),
//Positioned(
//bottom: 0,
//left: 0,
//child: Image.asset(
//'assets/2.png',
//width: size.width * 0.2,
//),
//),
//Center(
//child: Image.asset(
//'assets/2.png',
//width: size.width * 0.4,
//),
//),
//],
//),
//),
//),
//);
   }}


   