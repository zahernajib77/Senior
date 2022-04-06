// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:go2parts/screens/widgets/loading_widget.dart';
// import 'package:go_to_parts/widgets/home.dart';

import '../config/config.dart';
import 'home.dart';
import 'insideItem.dart';

class ShopClientSide extends StatefulWidget {
  const ShopClientSide({Key? key}) : super(key: key);

  @override
  _ShopClientSideState createState() => _ShopClientSideState();
}

class _ShopClientSideState extends State<ShopClientSide> {
  String chosen = 'shop';
  bool upBarHeight = false;
  PageController pageViewController = PageController(initialPage: 0);
  ScrollController mainListController = ScrollController();
  void toAbout(int index) {
    setState(() {
      if (index == 0) {
        pageViewController.animateToPage(1,
            duration: const Duration(milliseconds: 300), curve: Curves.ease);
        chosen = 'about';
      } else if (index == 1) {
        return null;
      }
    });
  }

  void toShop(int index) {
    setState(() {
      if (index == 1) {
        pageViewController.animateToPage(0,
            duration: const Duration(milliseconds: 300), curve: Curves.ease);
        chosen = 'shop';
      } else if (index == 0) {
        return null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(247, 247, 242, 1),
        body: SafeArea(
          child: Stack(
            children: [
              NotificationListener(
                onNotification: ((ScrollNotification notification) {
                  if (notification is ScrollUpdateNotification) {
                    if (notification.metrics.pixels > 60) {
                      if (upBarHeight == false) {
                        setState(() {
                          upBarHeight = true;
                        });
                      }
                    }
                    else{
                      if (upBarHeight == true) {
                        setState(() {
                          upBarHeight = false;
                        });
                      }
                    }
                  }
                  return true;
                }),
                child:  ListView(
        physics: ClampingScrollPhysics(),
    controller: mainListController,

    children: [
    Container(
    margin: const EdgeInsets.only(top: 40),
    width: MediaQuery.of(context).size.width,
    child: Container(
    padding: const EdgeInsets.only(bottom: 15),
    color: Colors.white,
    child: Column(
    children: [
    SizedBox(height: 10),
    Container(
    padding: const EdgeInsets.only(
    left: 15, right: 15),
    child: Column(
    children: [
    Row(
    mainAxisAlignment:
    MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Column(
    crossAxisAlignment:
    CrossAxisAlignment.start,
    // ignore: prefer_const_literals_to_create_immutables
    children: [
    Text('Shop name',
    style: TextStyle(
    fontSize: 18,
    fontWeight:
    FontWeight.bold)),
    SizedBox(height: 7),
    Text(
    'Bahsas - MAin Street',
    style: TextStyle(
    fontSize: 16,
    ),
    )
    ],
    ),
    InkWell(
    onTap: () {
    setState(() {
    upBarHeight = true;
    });
    },
    child: Icon(Icons.message),
    )
    ],
    )
    ],
    )),
    //About us
    SizedBox(height: 7),
    Container(
    padding: const EdgeInsets.only(
    left: 15, right: 15),
    alignment: Alignment.centerLeft,
    child: Column(
    children: [
    Column(
    crossAxisAlignment:
    CrossAxisAlignment.start,
    mainAxisAlignment:
    MainAxisAlignment.start,
    // ignore: prefer_const_literals_to_create_immutables
    children: [
    Text(
    'Bahsas - MAin Street sadhcb hksgdb cay jas bc jhdb  jab  jab ashd basj dbjsdb jasdb jh b adjd akdh ba shg sa iyerf uesjhbv dsyvhgv ehgver hh s sjak s sgdv sjg uyghs gvcer ggvshg vysd hsv csdvchsv hdsvc sdvhsdcv hdsgcv dshgcvsdh vd',
    style: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w300),
    ),
    SizedBox(height: 15),
    Container(
    width: MediaQuery.of(context)
        .size
        .width,
    height: 170,
    child: ClipRRect(
    borderRadius:
    BorderRadius.circular(5),
    child:
    FadeInImage.assetNetwork(
    fit: BoxFit.cover,
    placeholder:
    'assets/gifs/Rolling-1s-137px.gif',
    image:
    'https://media.istockphoto.com/vectors/thirteen-days-left-icon-13-days-to-go-vector-vector-id1253037922?s=612x612',
    )))
    ],
    ),
    ],
    ),
    ),
    SizedBox(height: 5),
    ],
    ))),
    SizedBox(height: 15),
    Container(
    height: 40,
    color: Colors.white,
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.center,
    // ignore: prefer_const_literals_to_create_immutables
    children: [
    InkWell(
    onTap: (() => setState(() {
    toShop(1);
    })),
    child: Container(
    decoration: BoxDecoration(
    border: Border(
    bottom: BorderSide(
    width: 0.5,
    color: chosen == 'shop'
    ? Colors.black
        : Colors.transparent))),
    alignment: Alignment.center,
    width: MediaQuery.of(context).size.width / 4,
    child: Text('All',
    style: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold)),
    )),
    InkWell(
    onTap: (() => setState(() {
    toAbout(0);
    })),
    child: Container(
    decoration: BoxDecoration(
    border: Border(
    bottom: BorderSide(
    width: 0.5,
    color: chosen == 'about'
    ? Colors.black
        : Colors.transparent))),
    alignment: Alignment.center,
    width: MediaQuery.of(context).size.width / 4,
    child: Text(
    'Top Rated',
    style: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.grey),
    ),
    )),
    InkWell(
    onTap: (() => setState(() {
    toAbout(0);
    })),
    child: Container(
    decoration: BoxDecoration(
    border: Border(
    bottom: BorderSide(
    width: 0.5,
    color: chosen == 'about'
    ? Colors.black
        : Colors.transparent))),
    alignment: Alignment.center,
    width: MediaQuery.of(context).size.width / 4,
    child: Text(
    'Recent',
    style: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.grey),
    ),
    )),
    InkWell(
    onTap: (() => setState(() {
    toAbout(0);
    })),
    child: Container(
    decoration: BoxDecoration(
    border: Border(
    bottom: BorderSide(
    width: 0.5,
    color: chosen == 'about'
    ? Colors.black
        : Colors.transparent))),
    alignment: Alignment.center,
    width: MediaQuery.of(context).size.width / 4,
    child: Text(
    'Best',
    style: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.grey),
    ),
    ))
    ],
    ),
    ),
    Container(
    height: MediaQuery.of(context).size.height - 120,
    child: PageView(
    onPageChanged: ((index) => setState(() {
    if (index == 0) {
    chosen = 'shop';
    } else if (index == 1) {
    chosen = 'about';
    }
    })),
    controller: pageViewController,
    scrollDirection: Axis.horizontal,
    children: [
    Container(
    color: Colors.white,
    child: NotificationListener(
    onNotification:
    ((ScrollNotification notification) {
    if (notification is ScrollStartNotification) {
    mainListController.animateTo(
    mainListController
        .position.maxScrollExtent,
    duration: Duration(milliseconds: 800),
    curve: Curves.ease);
    }
    if (notification
    is ScrollUpdateNotification) {
    if (notification.metrics.pixels ==
    notification.metrics.maxScrollExtent) {
    mainListController.animateTo(
    mainListController
        .position.maxScrollExtent,
    duration: Duration(milliseconds: 800),
    curve: Curves.ease);
    } else if (notification.metrics.pixels ==
    notification.metrics.minScrollExtent) {
    mainListController.animateTo(
    mainListController
        .position.minScrollExtent,
    duration: Duration(milliseconds: 800),
    curve: Curves.ease);
    }
    }
    return true;
    }),
    child: GridView.builder(
    padding: const EdgeInsets.all(15),
    itemCount: 1,
    gridDelegate:
    const SliverGridDelegateWithMaxCrossAxisExtent(
    maxCrossAxisExtent: 200,
    childAspectRatio: 6 / 8.5,
    crossAxisSpacing: 15,
    mainAxisSpacing: 30),
    itemBuilder: (context, index) {
    return ItemIndividual();
    }),
    )),
    Container(
    height: 500,
    child: Column(
    children: [
    ],
    ))
    ],
    ),
    )
    ],
    ),


              ),
              Positioned(
                  top: 0,
                  left: 0,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Homepage()),
                      );
                    },
                    child: Container(
                        height: 40,
                        color: Colors.white,
                        padding: const EdgeInsets.only(left: 10),
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            Icon(Icons.arrow_back, color: Colors.black),
                            AnimatedOpacity(
                              opacity: upBarHeight ? 1.0 : 0.0,
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                              child: Container(
                                width: MediaQuery.of(context).size.width-50,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text('Shop name',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    Icon(Icons.comment,size: 20,)
                                  ],
                                ),
                              ),
                            )
                          ],
                        )),
                  )),
            ],
          ),
        ));
  }
}

class ItemIndividual extends StatefulWidget {
  const ItemIndividual({Key? key}) : super(key: key);

  @override
  _ItemIndividualState createState() => _ItemIndividualState();
}

class _ItemIndividualState extends State<ItemIndividual> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const InsideItem()),
          );
        },
        child: Container(
          margin: const EdgeInsets.only(left: 5, right: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            // ignore: prefer_const_literals_to_create_immutables
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(157, 158, 158, 158),
                offset: const Offset(
                  0,
                  4,
                ),
                blurRadius: 2.0,
                spreadRadius: 1.0,
              )
            ],
            color: Colors.white,
          ),
          child: Column(
            children: [
              Container(
                  height: 115,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(5),topRight: Radius.circular(5)),
                    child: FadeInImage.assetNetwork(
                      fit: BoxFit.cover,
                      placeholder: 'assets/gifs/Rolling-1s-137px.gif',
                      image:
                          'https://junkmailimages.blob.core.windows.net/thumb/296fc0cc84b84e7dbafe2c6be4f35f82.jpg',
                    ),
                  )),
              Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text('Engine T2-5',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold))
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // ignore: prefer_const_literals_to_create_immutables



                        //Icons.logo_dev
                //        children: [Icon(Icons.logo_dev,color: Colors.blueGrey,)],



                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text(
                          '120 USD',
                          style: TextStyle(fontSize: 15),
                        ),
                        Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 204, 203, 203),
                              border: Border.all(width: 1,color: Color.fromARGB(255, 90, 90, 90)),
                              borderRadius: BorderRadius.circular(3)),
                          child:
                              Icon(Icons.arrow_right_alt, color: Colors.black),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
