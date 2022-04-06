import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomeScreens extends StatefulWidget {
  const WelcomeScreens({Key? key}) : super(key: key);

  @override
  _WelcomeScreensState createState() => _WelcomeScreensState();
}

class _WelcomeScreensState extends State<WelcomeScreens> {
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
      backgroundColor: Color.fromRGBO(247, 247, 242, 1),
      body: SafeArea(
          child: Container(
              width: WIDTH,
              height: HEIGHT,
              child: Stack(children: [
                PageView(
                  onPageChanged: (index) {
                    changepageIndex(index);
                  },
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(height: HEIGHT, width: WIDTH,
                    child: Center(
                      child: Container(
                        width: WIDTH-100,
                        height: HEIGHT/3,
                        color: Colors.red,
                      ),
                    ),),
                    Container(height: HEIGHT, width: WIDTH,
                    child: Center(
                      child: Container(
                        width: WIDTH-100,
                        height: HEIGHT/3,
                        color: Colors.yellow,
                      ),
                    ),),
                    Container(height: HEIGHT, width: WIDTH,
                    child: Center(
                      child: Container(
                        width: WIDTH-100,
                        height: HEIGHT/3,
                        color: Colors.blueAccent,
                      ),
                    ),),
                  ],
                ),
                Positioned(
                    bottom: 20,
                    left: (WIDTH / 2) - 150,
                    child: Container(
                        alignment: Alignment.center,
                        width: 300,
                        height: 20,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [                           
                            Container(
                              margin:
                                  const EdgeInsets.only(left: 10, right: 10),
                              width: pageIndex == 0 ? 10:5,
                              height: 5,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 26, 25, 25),
                                  borderRadius:
                                      BorderRadiusDirectional.circular(50)),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(left: 10, right: 10),
                              width: pageIndex == 1 ? 10:5,
                              height: 5,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 26, 25, 25),
                                  borderRadius:
                                      BorderRadiusDirectional.circular(50)),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(left: 10, right: 10),
                              width: pageIndex == 2 ? 10:5,
                              height: 5,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 26, 25, 25),
                                  borderRadius:
                                      BorderRadiusDirectional.circular(50)),
                            )
                          ],
                        )))
              ]))),
    );
  }
}
