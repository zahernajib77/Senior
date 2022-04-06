// ignore_for_file: prefer_const_constructors, unnecessary_new, sized_box_for_whitespace

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go2parts/screens/login.dart';
import 'package:go2parts/screens/widgets/loading_widget.dart';
import 'dart:ui';
import '../config/config.dart';
import 'account.dart';
import 'insideCategory.dart';
import 'shopClientSide.dart';
import 'package:touchable_opacity/touchable_opacity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    final WIDTH = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Color.fromRGBO(247, 247, 242, 1),
        body: Stack(
          children: [
            ListView(
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 60),
                          height: 45,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              physics: BouncingScrollPhysics(),
                              padding: const EdgeInsets.only(
                                  left: 10, top: 15, right: 10),
                              // ignore: prefer_const_literals_to_create_immutables
                              itemBuilder: (context, index) => GestureDetector(
                                child: Container(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  margin: const EdgeInsets.only(right: 7.5),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          width: 0.5,
                                          color: Color.fromARGB(
                                              255, 141, 140, 140)),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Center(
                                      child: Text(
                                        'BMW',
                                        style: TextStyle(fontSize: 12),
                                      )),
                                ),
                                onTap: () {
                                  print("Tapped on container");
                                },
                              )),
                        ),
                        Container(
                          padding:
                          const EdgeInsets.only(top: 10, left: 10, right: 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.network(
                              'https://res.cloudinary.com/dmyspflyi/image/upload/v1622915924/samples/ecommerce/leather-bag-gray.jpg',
                              width: WIDTH,
                              height: 180,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 20),
                          child: Text('Common cars parts',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(178, 0, 0, 0))),
                        ),
                        Container(
                          height: 220,
                          margin: const EdgeInsets.only(top: 5),
                          decoration: BoxDecoration(),
                          child: GridView.count(
                              physics: const NeverScrollableScrollPhysics(),
                              crossAxisSpacing: 25,
                              mainAxisSpacing: 10,
                              crossAxisCount: 4,
                              shrinkWrap: true,
                              childAspectRatio:
                              MediaQuery.of(context).size.height / 1100,
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 10),
                              children: List.generate(
                                  8,
                                      (index) => (Container(
                                    child: Column(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            TouchableOpacity(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                      const insidecategory()),
                                                );

                                              },
                                              activeOpacity: 0.1,
                                              child: Container(
                                                height: 60,
                                                padding:
                                                const EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        10),
                                                    // ignore: prefer_const_literals_to_create_immutables
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Color.fromARGB(
                                                            255, 240, 239, 239),
                                                        offset: const Offset(
                                                          0.5,
                                                          0.5,
                                                        ),
                                                        blurRadius: 2.0,
                                                        spreadRadius: 1.0,
                                                      )
                                                    ],
                                                    border: Border.all(
                                                        width: 0.5,
                                                        color: Color.fromARGB(
                                                            255,
                                                            155,
                                                            151,
                                                            151)),
                                                    color: Colors.white),
                                                child: Image.network(
                                                  'https://res.cloudinary.com/dmyspflyi/image/upload/v1645529554/disc-brake_odgqlr.png',
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10),
                                              child: Text('adcjhd'),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  )))),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 10),
                          child: Text('Shops of the week',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(178, 0, 0, 0))),
                        ),
                        StreamBuilder<QuerySnapshot>(
                            stream:  FirebaseFirestore.instance
                                .collection('shopOwners')

                                .snapshots(),
                            builder: (context,AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (!snapshot.hasData) return circularProgress();

                              return ListView.builder(

                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: snapshot.data!.docs.length,
                                  itemBuilder: (context, index){

                                    return Container(
                                      padding:
                                      const EdgeInsets.only(left: 10, right: 10, top: 0),
                                      child: ListView.builder(
                                          padding: EdgeInsets.only(top: 10),
                                          physics: const NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount: snapshot.data!.docs.length,
                                          itemBuilder: (context, index) => (Container(
                                              width: 100,
                                              height: 290,
                                              margin:
                                              const EdgeInsets.only(top: 10, bottom: 10),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadiusDirectional.circular(10),
                                                color: Colors.white,
                                                // ignore: prefer_const_literals_to_create_immutables
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Color.fromARGB(255, 196, 195, 195),
                                                    offset: const Offset(
                                                      0.5,
                                                      0.5,
                                                    ),
                                                    blurRadius: 2.0,
                                                    spreadRadius: 1.0,
                                                  )
                                                ],
                                              ),
                                              child: InkWell(
                                                  onTap: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                          const ShopClientSide()),
                                                    );
                                                  },
                                                  child: Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                          height: 180,
                                                          child: ClipRRect(
                                                            borderRadius: BorderRadius.only(
                                                                topLeft: Radius.circular(10),
                                                                topRight: Radius.circular(10)),
                                                            child: FadeInImage.assetNetwork(
                                                              width: WIDTH,
                                                              fit: BoxFit.cover,
                                                              placeholder:
                                                              'images/Rolling-1s-137px.jpeg',
                                                              // placeholderFit: BoxFit.contain,
                                                              image:
                                                              'https://partsstore.co.uk/wp-content/uploads/2016/06/shop.jpg',
                                                            ),
                                                          )),
                                                      Padding(
                                                        padding: const EdgeInsets.all(10),
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment.center,
                                                              children: [
                                                                Text(
                                                                    "Bahsas shop"
                                                                    // snapshot.data!.docs[index]
                                                                    //     .data()['shopname']
                                                                    ,
                                                                    style: TextStyle(
                                                                        fontSize: 20,
                                                                        fontWeight:
                                                                        FontWeight.bold)
                                                                ),
                                                                Container(
                                                                  padding:
                                                                  const EdgeInsets.only(
                                                                      left: 10,
                                                                      right: 10,
                                                                      top: 2.5,
                                                                      bottom: 2.5),
                                                                  decoration: BoxDecoration(
                                                                      borderRadius:
                                                                      BorderRadius.circular(
                                                                          2.5),
                                                                      color: Colors.green,
                                                                      border: Border.all(
                                                                          width: 0.5,
                                                                          color: Color.fromARGB(
                                                                              255,
                                                                              25,
                                                                              71,
                                                                              20))),
                                                                  child: Text('4.5',
                                                                      style: TextStyle(
                                                                          fontSize: 16,
                                                                          color: Color.fromARGB(
                                                                              255,
                                                                              255,
                                                                              255,
                                                                              255))),
                                                                )
                                                              ],
                                                            ),
                                                            SizedBox(height: 2.5),
                                                            Row(
                                                              mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                              children: [
                                                                Text(
                                                                    "Bahsas"
                                                                  // snapshot.data!.docs[index]
                                                                  //     .data()['Address']
                                                                ),
                                                              ],
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets.only(
                                                                  top: 10, bottom: 10),
                                                              child: Container(
                                                                  height: 1,
                                                                  color: Color.fromARGB(
                                                                      162, 158, 158, 158)),
                                                            ),
                                                            Row(
                                                              children: [
                                                                Icon(Icons.card_travel_sharp,color: Color.fromARGB(255, 255, 109, 64),),
                                                                SizedBox(width: 10),
                                                                Text(
                                                                    'Something interrestingabout the shop',
                                                                    style: TextStyle(
                                                                        fontSize: 14,
                                                                        fontWeight:
                                                                        FontWeight.w300))
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ))))),
                                    );



                                  }
                              );




                            }
                        ),

                      ],
                    ))
              ],
            ),
            Positioned(
                top: 0,
                child: Container(
                  width: WIDTH,
                  padding:
                  EdgeInsets.only(left: 10, right: 15, top: 50, bottom: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    ListTile(
                                      leading:
                                      new Icon(Icons.location_on_outlined),
                                      title: new Text('Location'),
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                    Container(
                                      height: 100,
                                      alignment: Alignment.center,
                                      child:
                                      Text('Location permission required'),
                                    )
                                  ],
                                );
                              });
                        },
                        child: Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                  width: 35,
                                  height: 35,
                                  child: new IconButton(
                                    padding: new EdgeInsets.all(0.0),
                                    color: Color.fromARGB(178, 0, 0, 0),
                                    icon: new Icon(Icons.location_on_outlined,
                                        size: 30),
                                    onPressed: () => {},
                                  )),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  Text('Hrar',
                                      style: TextStyle(
                                          fontSize: 16,
                                          decoration: TextDecoration.none,
                                          color: Color.fromARGB(178, 0, 0, 0),
                                          fontWeight: FontWeight.bold)),
                                  Text('Main-Street',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          decoration: TextDecoration.none,
                                          color: Color.fromARGB(178, 0, 0, 0))),
                                ],
                              ),
                              Icon(Icons.arrow_drop_down)
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          if(FirebaseAuth.instance.currentUser != null){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AccountPage()),
                            );
                          }
                          else
                          {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const loginpage()),
                            );

                          }



                        },
                        child: Container(
                          width: 35,
                          height: 35,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.grey,
                          ),
                          child: Text(
                            'Ab',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ));
  }
}
