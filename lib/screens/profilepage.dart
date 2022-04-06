
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go2parts/config/config.dart';
import 'package:go2parts/screens/login.dart';
class profilepage extends StatefulWidget {
  const profilepage({Key? key}) : super(key: key);

  @override
  _profilepageState createState() => _profilepageState();
}

class _profilepageState extends State<profilepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: Colors.white,
        body: SafeArea(
            child: Stack(
              children: [
                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                .collection("users")
                .where("uid",
                isEqualTo: AutoParts.preferences!
                    .getString(AutoParts.userUID))
                .snapshots(),
                  builder: (context, snapshot) {
                    return Container(
                      margin: const EdgeInsets.only(top: 60),
                      height: MediaQuery.of(context).size.height - 40,
                      child: Container(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom:
                                      BorderSide(width: 0.5, color: Colors.grey))),
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Abdel',style: TextStyle(color: Colors.black,fontSize:35 ,fontWeight: FontWeight.bold, ),),
                                      SizedBox(height: 5,),

                                      Text('outhamcnfrrffffff@gmail.com',style: TextStyle(fontSize:20,  ),),
                                      SizedBox(height: 8,),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        // ignore: prefer_const_literals_to_create_immutables
                                        children: [
                                          Text('View activity',style: TextStyle(color: Colors.red,fontSize:15 , ),),
                                          SizedBox(width: 1),
                                          Icon(Icons.arrow_right,color: Colors.red,)
                                        ],
                                      )
                                    ],
                                  ),
                                  Container(
                                   //   height: 50,
                                    //r  width: 50,
                                      child:Icon(Icons.account_circle,size: 100,color: Colors.deepPurple,) ,

                                      // decoration: BoxDecoration(
                                      //     color: Colors.purple,
                                      //     borderRadius: BorderRadius.circular(50))
                            )
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 20,bottom: 20),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom:
                                      BorderSide(width: 0.5, color: Colors.grey))
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [

                                      Icon(Icons.favorite),
                                      Text('Likes')
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Icon(Icons.notifications),Text('Notification')
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Icon(Icons.settings),Text('Settings')
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Icon(Icons.payment),Text('Payment')
                                    ],
                                  )

                                ],
                              ),

                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 20,bottom: 20),

                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Table bookings'),
                                  SizedBox(height: 20,),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,

                                    children: [
                                      Icon(Icons.book),
                                      SizedBox(width: 5,),
                                      Text('Your booking',style: TextStyle(color: Colors.black,fontSize: 15),),


                                    ],

                                  ),
                                  SizedBox(height: 10,),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,

                                    children: [
                                      Icon(Icons.help),
                                      SizedBox(width: 5,),
                                      Text('Table Reservation Help',style: TextStyle(color: Colors.black,fontSize: 15),),


                                    ],

                                  ),
                                  SizedBox(height: 10,),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,

                                    children: [
                                      Icon(Icons.help),
                                      SizedBox(width: 5,),
                                      Text('About',style: TextStyle(color: Colors.black,fontSize: 15),),


                                    ],

                                  ),
                                  // SizedBox(height: 10,),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,

                                    children: [
                                     // Text('Send Feedback',style: TextStyle(color: Colors.black,fontSize: 15),),
                                      TextButton(
                                          child: Text('Send Feedback',style: TextStyle(color: Colors.black,fontSize: 15),),
                                          onPressed: () {
                                            print('Pressed');
                                          }
                                      )


                                    ],

                                  ),
                                  // SizedBox(height: 10,),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,

                                    children: [
                                     // Text('Rate us on the play store',style: TextStyle(color: Colors.black,fontSize: 15),),
                                      TextButton(
                                          child: Text('Rate us on the play store',style: TextStyle(color: Colors.black,fontSize: 15),),
                                          onPressed: () {
                                            print('Pressed');
                                          }
                                      )

                                    ],

                                  ),
                                  // SizedBox(height: 10,),
                                  Row(
                                     crossAxisAlignment: CrossAxisAlignment.center,

                                    children: [
                                      TextButton(
                                          child: Text('Logout',style: TextStyle(color: Colors.black,fontSize: 15),),
                                          onPressed: () async {
                                            SystemNavigator.pop();
                                            await FirebaseAuth.instance.signOut();
                                            print('Logout succesful');
                                          }
                                      )


                                    ],

                                  ),





                                ],
                              ),
                              
                            )

                          ],
                        ),
                      ),
                    );
                  }
                ),
                Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      height: 40,
                      color: Colors.white,
                      padding: const EdgeInsets.only(left: 10),
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.centerLeft,
                       //child: Icon(Icons.arrow_back_ios_new, color: Colors.black),
                      child: IconButton( onPressed: () { Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  loginpage())); }, icon: const Icon(Icons.arrow_back_ios_new),),


                    ))
              ],
            )));

  }
}
