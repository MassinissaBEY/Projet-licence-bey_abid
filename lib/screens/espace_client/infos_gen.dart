import 'package:flutter/material.dart';
import 'package:flutter_application_6/localization/language/languages.dart';






class infos extends StatefulWidget {
  const infos({ Key key }) : super(key: key);

  @override
  State<infos> createState() => _infosState();
}

class _infosState extends State<infos> {
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
              SizedBox(
                height: 40,
              ),

              Container(margin: EdgeInsets.only(left: 20,right: 20,),
              child: Text(Languages.of(context).infos_parag1, style: TextStyle(fontSize: 18),),

              ),

              SizedBox(height: 10,),
               Container(margin: EdgeInsets.only(left: 20,right: 20,),
              child: Text(Languages.of(context).infos_parag2, style: TextStyle(fontSize: 18),),)
                ]))
    );
  }
}