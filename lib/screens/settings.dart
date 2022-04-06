import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go2parts/screens/profile.dart';
import 'package:settings_ui/settings_ui.dart';

import 'account.dart';
import 'notifications.dart';
class settingspage extends StatefulWidget {
  const settingspage({Key? key}) : super(key: key);

  @override
  _settingspageState createState() => _settingspageState();
}

class _settingspageState extends State<settingspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(



     // appBar: AppBar(
     //    // backgroundColor: Colors.white,
     //
     //   title: Text('Settings' ,style: TextStyle(fontSize: 20,), ),
     //   leading: IconButton( icon: Icon(
     //         Icons.arrow_back,
     //         // color: Colors.white,
     //       ),
     //       onPressed: () {
     //         // do something
     //       },),
     //
     //
     //
     //
     // ),

      body:SafeArea(
child: Stack(
  children: [
    Container( margin: const EdgeInsets.only(top: 40),
        height: MediaQuery.of(context).size.height - 40,
      child:SettingsList(
        sections: [
          SettingsSection(


            // title: Text('Settings' ,style: TextStyle(fontSize: 20,),),
            tiles: <SettingsTile>[
              SettingsTile(
                leading: Icon(Icons.language),
                title: Text('Language'),
                value: Text('English',),

              ),
              SettingsTile.switchTile(
                onToggle: (value) {

                },
                initialValue: true,
                leading: Icon(Icons.format_paint),
                title: Text('Enable custom theme'),
              ),
              SettingsTile(title: Text('Edit Profile'),leading:Icon(Icons.account_box_rounded) ,value: Text('change your name , description and profile photo'),
onPressed: (value){
  Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) =>
              Profile()));

},
              ),

              SettingsTile(title: Text('Notification settings'),leading:Icon(Icons.settings) ,value: Text('Define what alerts and Notifications you wnat to see'),
              onPressed: (value){
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            notificationpage()));
              },
              ),

              SettingsTile(title: Text('Account settings'),leading:Icon(Icons.account_box) ,value: Text('Delete your Account'),
                onPressed: (value){
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              AccountPage()));
                },
              ),


            ],
          ),
        ],
      )    ),

    Positioned(
        top: 0,
        left: 0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(

            height: 40,
            padding: const EdgeInsets.only(left: 10),
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.centerLeft,

            child: InkWell(
              child:  Row(

                children: [

                  Icon(Icons.arrow_back_ios_new, color: Colors.black),
                  SizedBox(width: 110,),

                  Text('Settings',style: TextStyle(
                      fontSize: 18,fontWeight: FontWeight.bold
                  ),)
                ],
              ),
              onTap: (){
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AccountPage()),
                );
              }
              ,
            ),

          ),
        ))


  ],
),
      )

       );
  }
}


