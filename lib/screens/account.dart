import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go2parts/config/config.dart';
import 'package:go2parts/screens/AuthService.dart';
import 'package:go2parts/screens/checkout.dart';
import 'package:go2parts/screens/favourites.dart';
import 'package:go2parts/screens/myaccount.dart';
import 'package:go2parts/screens/notifications.dart';
import 'package:go2parts/screens/orderhistory.dart';
import 'package:go2parts/screens/profile.dart';
import 'package:go2parts/screens/profilepage.dart';
import 'package:go2parts/screens/settings.dart';
import 'package:go2parts/screens/widgets/loading_widget.dart';

import 'home.dart';
// import 'package:go_to_parts/widgets/profile/profile.dart';

// import '../home.dart';

class AccountPage extends StatefulWidget {
  const AccountPage( {Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  String ProfilePhoto=AutoParts.preferences!
      .getString(AutoParts.userUID).toString();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Stack(
          children: [
            StreamBuilder<QuerySnapshot>(
              stream:  FirebaseFirestore.instance
                .collection("users")
                .where("uid",
                isEqualTo: AutoParts.preferences!
                    .getString(AutoParts.userUID))
                .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return circularProgress();
                return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index){
                      return Container(
                        margin: const EdgeInsets.only(top: 40),
                        height: MediaQuery.of(context).size.height - 40,
                        child: Container(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Column(
                            children: [
                              InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                          const AccountPage()),
                                    );
                                  },
                                  child:
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom:
                                            BorderSide(width: 0.5, color: Colors.grey))),
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              snapshot.data!.docs[index]
                                                  .data()['name'],
                                              style: TextStyle(
                                                color: Color.fromARGB(255, 31, 31, 31),
                                                fontSize: 26,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              snapshot.data!.docs[index]
                                                  .data()['email'],
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w300
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            InkWell(
                                                child:  Row(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  // ignore: prefer_const_literals_to_create_immutables
                                                  children: [
                                                    Text(
                                                      'View Profile',
                                                      style: TextStyle(
                                                        color: Colors.red,
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                    SizedBox(width: 1),
                                                    Icon(
                                                      Icons.arrow_right,
                                                      color: Colors.red,
                                                    )
                                                  ],
                                                ) ,
                                                onTap: (){
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(builder: (context) => Profile()),

                                                  );
                                                }
                                            ),


                                          ],
                                        ),
                                        Container(
                                          //   height: 50,
                                          //r  width: 50,








                                            child:
                                            Icon(
                                            Icons.account_circle,
                                            size: 100,
                                            color: Colors.deepPurple,
                                          ),

                                          // decoration: BoxDecoration(
                                          //     color: Colors.purple,
                                          //     borderRadius: BorderRadius.circular(50))
                                        )
                                      ],
                                    ),
                                  )),
                              Container(
                                padding: const EdgeInsets.only(top: 30, bottom: 30),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom:
                                        BorderSide(width: 0.5, color: Colors.grey))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    InkWell(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Icon(Icons.settings_outlined),
                                          SizedBox(height: 5),
                                          Text('Settings')
                                        ],
                                      ),
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => const settingspage()),

                                        );


                                      },
                                    ),

                                    InkWell(
                                      child:Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Icon(Icons.ring_volume_outlined),
                                          SizedBox(height: 5),
                                          Text('Notifications')
                                        ],
                                      ),
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => const notificationpage()),

                                        );




                                      },
                                    ),


                                    InkWell(
                                      child:Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Icon(Icons.history_outlined),
                                          SizedBox(height: 5),
                                          Text('Orders')
                                        ],
                                      ) ,
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => const orderhistory()),

                                        );



                                      },
                                    ),

                                    InkWell(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Icon(Icons.favorite_border),
                                          SizedBox(height: 5),
                                          Text('Favorites')
                                        ],
                                      ) ,
                                      onTap: () {

                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => const favourites()),

                                        );


                                      },
                                    ),





                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(top: 20, bottom: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Table bookings'),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    InkWell(
                                      child:Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                              padding: const EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                  color: Color.fromARGB(204, 240, 239, 239),
                                                  borderRadius: BorderRadius.circular(50)
                                              ),
                                              child: Icon(Icons.book_outlined)),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Your booking',
                                            style: TextStyle(
                                                color: Colors.black, fontSize: 15),
                                          ),
                                        ],
                                      ),
                                      onTap: (){
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => const checkoutpage()),
                                        );

                                      },
                                    ),




                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                color: Color.fromARGB(204, 240, 239, 239),
                                                borderRadius: BorderRadius.circular(50)
                                            ),
                                            child: Icon(Icons.help_outline_outlined)),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'Table Reservation Help',
                                          style: TextStyle(
                                              color: Colors.black, fontSize: 15),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    InkWell(
                                      child:Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                              padding: const EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                  color: Color.fromARGB(204, 240, 239, 239),
                                                  borderRadius: BorderRadius.circular(50)
                                              ),
                                              child: Icon(Icons.help_outline_outlined)),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'About',
                                            style: TextStyle(
                                                color: Colors.black, fontSize: 15),
                                          ),
                                        ],
                                      ),
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => const Homepage()),
                                        );
                                      },
                                    ),

                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(bottom: 20),
                                child:
                                InkWell(
                                  child:  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Account'),
                                      SizedBox(height: 20),

                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                              padding: const EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                  color: Color.fromARGB(204, 240, 239, 239),
                                                  borderRadius: BorderRadius.circular(50)
                                              ),
                                              child: Icon(Icons.logout_outlined)),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Logout',
                                            style: TextStyle(
                                                color: Colors.black, fontSize: 15),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  onTap: () async {
                                    SystemNavigator.pop();
                                    await FirebaseAuth.instance.signOut();
                                    AuthService().signoutgoogle();
                                    print('Logout succesful');
                                  },

                                ),



                              )
                            ],
                          ),
                        ),
                      );
                    }
                );




              }
            ),

            Positioned(
              top: 0,
              left: 0,
              child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Homepage()),
                    );
                  },
                  child: Container(
                    alignment: Alignment.centerLeft,
                    height: 40,
                    color: Colors.white,
                    padding: const EdgeInsets.only(left: 10),
                    width: MediaQuery.of(context).size.width,
                    child: Icon(Icons.arrow_back, color: Colors.black),
                  )),
            )
          ],
        )));
  }
}
