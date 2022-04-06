import 'package:flutter/material.dart';
import 'package:go2parts/screens/shopClientSide.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:go2parts/screens/widgets/loading_widget.dart';


import '../config/config.dart';
import 'home.dart';

class insidecategory extends StatefulWidget {
  const insidecategory({Key? key}) : super(key: key);

  @override
  _insidecategoryState createState() => _insidecategoryState();
}

class _insidecategoryState extends State<insidecategory> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
  }

  @override
  List<String> navBarItem = [
    "Item1",
    "Item2",
    "Item3",
    "Item4",
    "Item5",
    "Item6",
    "Item7"
  ];
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(247, 247, 242, 1),
        body: SafeArea(
            child: Stack(
          children: [
            StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("items")
                    // .where("uid",
                    // isEqualTo: AutoParts.preferences!
                    //     .getString(AutoParts.productID))
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return circularProgress();
                return ListView(children: [
                  Container(
                      margin: const EdgeInsets.only(top: 40),
                      height: 90,
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 0.5,
                                      color: Color.fromARGB(255, 141, 140, 140)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                hintText: 'Search for Parts...',
                                prefixIcon: Icon(Icons.search,
                                    color: Color.fromARGB(255, 43, 42, 42)),
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: BorderSide.none,
                                )),
                          )
                        ],
                      )),
                  Container(
                      height: 30,
                      padding: const EdgeInsets.only(left: 10),
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: navBarItem.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              child: Container(
                                padding: const EdgeInsets.only(left: 10, right: 10),
                                margin: const EdgeInsets.only(right: 7.5),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        width: 0.5,
                                        color: Color.fromARGB(255, 141, 140, 140)),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Center(
                                    child: Text(
                                  navBarItem[index],
                                  style: TextStyle(fontSize: 12),
                                )),
                              ),
                              onTap: () {
                                print("Tapped on container");
                              },
                            );
                          })),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      height: MediaQuery.of(context).size.height - 160,
                      padding: const EdgeInsets.only(bottom: 20),
                      child: NotificationListener(
                        onNotification: (ScrollNotification notification) {
                          if (notification is ScrollEndNotification) {
                            print('bottom reached');
                          }
                          return true;
                        },
                        child: GridView.builder(
                            physics: BouncingScrollPhysics(),
                            padding: const EdgeInsets.all(15),
                            itemCount: 5,
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
                ]);
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

