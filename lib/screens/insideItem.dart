import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go2parts/screens/widgets/loading_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../config/config.dart';
import 'home.dart';
import 'insideCategory.dart';

class InsideItem extends StatefulWidget {
  const InsideItem({Key? key}) : super(key: key);

  @override
  _InsideItemState createState() => _InsideItemState();
}

class _InsideItemState extends State<InsideItem> {
  Container MyParts(String, imageVal) {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: Card(
            margin: const EdgeInsets.all(0),
            child: Wrap(children: <Widget>[
              Image.network(String),
            ])));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Stack(
                    children: [

                      
                      Column(
                        children: [
                          Container(
                              height: 250,
                              padding: const EdgeInsets.all(0),
                              margin: const EdgeInsets.only(top: 50),
                              width: MediaQuery.of(context).size.width,
                              color: Colors.white,
                              child: PageView(
                                scrollDirection: Axis.horizontal,
                                children: <Widget>[
                                  MyParts(
                                      "https://cdn.pixabay.com/photo/2021/02/05/21/04/tail-lights-5985913__340.jpg",
                                      ""),
                                  MyParts(
                                      "https://cdn.pixabay.com/photo/2021/01/14/03/52/gold-5915713__340.png",
                                      ""),
                                  MyParts(
                                      "https://cdn.pixabay.com/photo/2015/03/18/19/42/auto-679874__340.jpg",
                                      ""),
                                ],
                              )),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            width: MediaQuery.of(context).size.width,
                            color: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Item name',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '12',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            width: MediaQuery.of(context).size.width,
                            color: Colors.white,
                            height: 150,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Description',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'hkasgf balhbf kshdkfvbh dvjn djfs jnkljfvh ndf;kljv nsk;l hjdfk bgxjlbh kjdd dgbs dfkjbn ',
                                  style: TextStyle(fontSize: 16),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                              margin:
                                  const EdgeInsets.only(left: 15, right: 15),
                              width: MediaQuery.of(context).size.width - 30,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 3,
                                    blurRadius: 4,
                                    offset: Offset(
                                        1, 2), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Car shop name',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'shop location',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                  Icon(Icons.mode_comment)
                                ],
                              )),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width - 30,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                                        new Icon(Icons.photo),
                                                    title: new Text('Photo'),
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                    },
                                                  ),
                                                  ListTile(
                                                    leading: new Icon(
                                                        Icons.music_note),
                                                    title: new Text('Music'),
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                    },
                                                  ),
                                                  ListTile(
                                                    leading: new Icon(
                                                        Icons.videocam),
                                                    title: new Text('Video'),
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                    },
                                                  ),
                                                  ListTile(
                                                    leading:
                                                        new Icon(Icons.share),
                                                    title: new Text('Share'),
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                    },
                                                  ),
                                                ],
                                              );
                                            });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.black,
                                        ),
                                        width:
                                            MediaQuery.of(context).size.width -
                                                90,
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.only(
                                            top: 15, bottom: 15),
                                        child: const Text(
                                          'Add To Cart',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      )),
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(top: 2.5, right: 5),
                                    child: Icon(Icons.favorite, size: 40),
                                  )
                                ],
                              )),
                        ],
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const insidecategory()),
                              );
                            },
                            child: Container(
                              alignment: Alignment.centerLeft,
                              height: 40,
                              color: Colors.white,
                              padding: const EdgeInsets.only(left: 10),
                              width: MediaQuery.of(context).size.width,
                              child:
                                  Icon(Icons.arrow_back, color: Colors.black),
                            )),
                      )
                    ],
                  )
                ],
              )),
        ));
  }
}
