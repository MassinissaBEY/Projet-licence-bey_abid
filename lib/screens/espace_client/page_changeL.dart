import 'package:flutter/material.dart';
import 'package:flutter_application_6/localization/locale_constant.dart';
import 'package:flutter_application_6/model/variables.dart';
import 'package:flutter_application_6/screens/espace_client/page_param.dart';
import 'package:direct_select/direct_select.dart';
import 'package:flutter_application_6/screens/espace_client/switching_page.dart';

class changeL extends StatefulWidget {
  const changeL({Key key}) : super(key: key);

  @override
  State<changeL> createState() => _changeLState();
}

class _changeLState extends State<changeL> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
          height: 80,
          //color: Colors.red,),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/Group 4 (6).png"),
                  fit: BoxFit.cover),
              //color: Color(0xffE5E7F3),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(0.0),
              )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  child: IconButton(
                      icon: new Icon(
                        Icons.close,
                        size: 40,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => switching_page()),
                        );
                      })),
              Expanded(child: SizedBox()),
              //Text(
              // 'Langue',
              //style: TextStyle(
              // fontWeight: FontWeight.bold,
              //color: Colors.white,
              // fontSize: 20),
              // ),
              Expanded(child: SizedBox()),
              Container(
                  child: IconButton(
                      icon: new Icon(
                        Icons.close,
                        size: 40,
                        color: Colors.transparent,
                      ),
                      onPressed: () {})),
            ],
          )),
      SizedBox(
        height: 200,
      ),
      Container(
          margin: const EdgeInsets.only(top: 10.0, left: 15, right: 15),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  offset: const Offset(0, 5),
                  blurRadius: 5.0,
                  spreadRadius: 0)
            ],
            color: Color.fromARGB(255, 247, 247, 247),
            border: Border.all(color: Color.fromARGB(255, 2, 62, 138)),
            borderRadius: BorderRadius.circular(5),
          ), //BoxDecoration

          /** CheckboxListTile Widget **/
          child: ExpansionTile(
              title: Text(
                "Langue",
                style: TextStyle(
                  color: abc[0] ? Colors.blue : Colors.black,
                ),
              ),
              children: <Widget>[
                CheckboxListTile(
                  title: Text(
                    'Français',
                    style: TextStyle(
                      color: abc[0] ? Colors.blue : Colors.black,
                    ),
                  ),
                  value: abc[0],
                  onChanged: (bool value) {
                    setState(() {
                      changeLanguage(context, 'fr');
                      abc = [true, false, false];
                      valueLang("Français");
                      var_image = "assets/Group 1 (3).png";
                      align_x = -1;
                      align_y = -1;
                    });
                  },
                ),
                CheckboxListTile(
                    title: Text(
                      'عربية',
                      style: TextStyle(
                        color: abc[1] ? Colors.blue : Colors.black,
                      ),
                    ),
                    value: abc[1],
                    onChanged: (bool value) {
                      setState(() {
                        abc = [false, true, false];
                        changeLanguage(context, 'ar');
                        valueLang("Arabe");
                        var_image = "assets/Group-1-3-Co.png";
                        align_x = 0.999;
                        align_y = -0.9;
                      });
                    }),
                CheckboxListTile(
                  title: Text(
                    'English',
                    style: TextStyle(
                      color: abc[2]
                          ? Color.fromARGB(255, 2, 62, 138)
                          : Colors.black,
                    ),
                  ),
                  value: abc[2],
                  onChanged: (bool value) {
                    setState(() {
                      abc = [false, false, true];
                      changeLanguage(context, 'en');
                      valueLang("English");
                      align_x = -1;
                      align_y = -1;
                      var_image = "assets/Group 1 (3).png";
                    });
                  },
                ),
              ])),
    ]));
  }
}
