// ignore_for_file: unnecessary_const, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchDesign extends StatefulWidget {
  const SearchDesign({Key? key}) : super(key: key);

  @override
  _SearchDesignState createState() => _SearchDesignState();
}

class _SearchDesignState extends State<SearchDesign> {
  int pageIndex = 0;
  void changepageIndex(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final WIDTH = MediaQuery.of(context).size.width;
    final HEIGHT = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(247, 247, 242, 1),
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            width: WIDTH,
            height: HEIGHT,
            child: Container(
              height: HEIGHT,
              width: WIDTH,
              child: Stack(children: [
                Container(
                  width: WIDTH,
                  height: HEIGHT,
                  alignment: Alignment.topCenter,
                  margin: const EdgeInsets.only(top: 240),
                  child: Image.network(
                    'https://www.kindpng.com/picc/m/7-76261_impala-drawing-vintage-car-transparent-png-clipart-drawing.png',
                    fit: BoxFit.contain,
                  ),
                ),
                //rfraf
                Positioned(
                    top: 325,
                    left: 150,
                    child: Container(
                      width: 25,
                      height: 25,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 42, 212, 224),
                          borderRadius: BorderRadius.circular(50)),
                      child: const Icon(Icons.add,
                          color: const Color.fromARGB(255, 255, 255, 255)),
                    )),
                //wejha
                Positioned(
                    top: 295,
                    left: 220,
                    child: Container(
                      width: 25,
                      height: 25,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 42, 212, 224),
                          borderRadius: BorderRadius.circular(50)),
                      child: const Icon(Icons.add,
                          color: const Color.fromARGB(255, 255, 255, 255)),
                    )),
                Positioned(
                    top: 345,
                    left: 112,
                    child: Container(
                      width: 25,
                      height: 25,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 42, 212, 224),
                          borderRadius: BorderRadius.circular(50)),
                      child: const Icon(Icons.add,
                          color: Color.fromARGB(255, 255, 255, 255)),
                    )),
                // 8ata front
                Positioned(
                    top: 250,
                    left: 190,
                    child: Container(
                      width: 25,
                      height: 25,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 42, 212, 224),
                          borderRadius: BorderRadius.circular(50)),
                      child: const Icon(Icons.add,
                          color: Color.fromARGB(255, 255, 255, 255)),
                    )),
                // Mirrors
                Positioned(
                    top: 240,
                    left: 115,
                    child: Container(
                      width: 25,
                      height: 25,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 42, 212, 224),
                          borderRadius: BorderRadius.circular(50)),
                      child: const Icon(Icons.add,
                          color: Color.fromARGB(255, 255, 255, 255)),
                    ))
              ]),
            ),
          ),
          Positioned(
              top: 0,
              left: 0,
              child: Container(
                color: Colors.white,
                height: 40,
                padding: const EdgeInsets.only(left: 5),
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.centerLeft,
                child: const Icon(Icons.arrow_back, color: Colors.black),
              )),
              // right left
              Positioned(
              bottom: 170,
              left: 0,
              child: Container(
                width: WIDTH,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.arrow_circle_up_sharp,size: 30,color: Color.fromARGB(255, 12, 57, 65),),
                    SizedBox(width: 20,),
                    Icon(Icons.arrow_circle_up_sharp,size: 30,color: Color.fromARGB(255, 12, 57, 65),)
                  ],
                ),
              )),
          Positioned(
              top: 40,
              left: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white
                ),
                height: 115,
                padding: const EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.centerLeft,
                child: Column(children: [
                  Container(
                    height: 40,
                    width: WIDTH,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(width: 1, color: Colors.grey)),
                    child: Text('Search',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey)),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(75, 114, 116, 115),
                              borderRadius: BorderRadius.circular(5)),
                          child: Icon(Icons.motorcycle)),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(199, 114, 116, 115),
                              borderRadius: BorderRadius.circular(5)),
                          child: Icon(Icons.car_rental)),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(75, 114, 116, 115),
                              borderRadius: BorderRadius.circular(5)),
                          child: Icon(Icons.motorcycle)),
                    ],
                  )
                ]),
              )),
          Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                height: 140,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 12, 57, 65),
                ),
                padding: const EdgeInsets.only(top: 10),
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.topLeft,
                child: Container(
                  height: 120,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (Context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              width: 80,
                              height: 70,
                              margin: const EdgeInsets.only(left: 15),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(74, 218, 219, 219),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: Icon(Icons.car_repair_outlined,color: Colors.white),
                              )),
                          Padding(padding: const EdgeInsets.only(left: 15)
                          ,child: Text('data',style: TextStyle(color: Colors.white),),)
                        ],
                      );
                    },
                  ),
                ),
              )),
        ],
      )),
    );
  }
}
