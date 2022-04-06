import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:go2parts/screens/widgets/header_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';


import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



import 'package:go2parts/config/config.dart';
//import 'package:firebase/firestore.dart';


import 'AuthService.dart';
import 'account.dart';
import 'common/theme_helper.dart';
import 'login.dart';
class signuppage extends StatefulWidget {
  const signuppage({Key? key}) : super(key: key);

  @override
  _signuppageState createState() => _signuppageState();
}

class _signuppageState extends State<signuppage> {
   double _headerHeight = 250;
   final FirebaseAuth auth = FirebaseAuth.instance;
   final _firestore =FirebaseFirestore.instance;
  final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkboxValue = false;
  // final databaseRef = FirebaseDatabase.instance.reference();
  final email = TextEditingController();
  final password = TextEditingController();//database reference object
   final confirmpassword = TextEditingController();//database reference object




  Future createUser() async {
    User firebaseUser;

    await auth
        .createUserWithEmailAndPassword(
      email: email.text.trim(),
      password: password.text.trim(),
    )
        .then((auth1) => {
          firebaseUser = auth1.user!,
        })
        .catchError((error) {
      print(error);
    });
    saveUserInfoToFireStore(auth.currentUser!);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.black26,
      content: Text('Sign up successfuly!!!'),
    ));
  }






  Future saveUserInfoToFireStore(User fUser) async {
    FirebaseFirestore.instance.collection("users").doc(fUser.uid).set({
      "uid": fUser.uid,
      "email": fUser.email,
      "name":  'Update your name..',
      "phone":  'Update your phone..',
      "address": 'Update your address..',
      // "url": userImage,
      // AutoParts.userCartList: ["garbageValue"],
    });
    await AutoParts.preferences!.setString("uid", fUser.uid);
    await AutoParts.preferences
    !.setString(AutoParts.userEmail, fUser.email!);
     // await AutoParts.preferences
     // !.setString(AutoParts.userName, firstname.text);
     // await AutoParts.preferences
     // !.setString(AutoParts.userPhone, mobile.text);
    /*await AutoParts.preferences
        !.setString(AutoParts.userAddress, 'Update your address..');*/
    // await AutoParts.preferences
    //     !.setString(AutoParts.userAvatarUrl, userImage);
    /* await AutoParts.preferences
        !.setStringList(AutoParts.userCartList, ["garbageValue"]);*/
  }




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(


                 // height: _headerHeight,
                child: Image.asset('images/img1.png') //let's create a common header widget
            ),
            SafeArea(
              child: Container(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                  // margin: EdgeInsets.fromLTRB(
                  //     20, 10, 20, 10), // This will be the login form
                  child: Column(
                    crossAxisAlignment:CrossAxisAlignment.start ,

                    children: [




                      Text(
                        'Sign up',

                        style: TextStyle(
                          fontSize: 40, fontWeight: FontWeight.bold,),
                      ),

                      SizedBox(height: 30.0),
                      Row(


                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            child:Container(
                              height: 60,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(
                                      10),
                                  // ignore: prefer_const_literals_to_create_immutables
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromARGB(
                                          255, 196, 195, 195),
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
                              child:
                              Image.network(
                                'https://res.cloudinary.com/zahernajib78/image/upload/v1645731437/Go2parts/google_1_tknxk8.png',

                                fit: BoxFit.contain,

                              ),

                            ),
                            onTap: () async {
                              await AuthService().signinWithGoggle().then((value){

                                print(value);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            AccountPage()

                                      // NextScreen(auth.currentUser.displayName,auth.currentUser.email)

                                    ));
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  backgroundColor: Colors.black26,
                                  content: Text('login successfuly!!!'),
                                ));

                              });



                            },
                          ),

                          SizedBox(width: 20),
                          InkWell(
                            child:  Container(
                              height: 60,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(
                                      10),
                                  // ignore: prefer_const_literals_to_create_immutables
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromARGB(
                                          255, 196, 195, 195),
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
                              child:
                              Image.network(
                                'https://res.cloudinary.com/zahernajib78/image/upload/c_scale,w_68/v1645731608/Go2parts/facebook_g09ujy.png',

                                fit: BoxFit.contain,
                              ),

                            ),
                            onTap: () {
                              print("facebook");
                            },
                          ),

                          SizedBox(width: 20),
                          InkWell(
                            child: Container(
                              height: 60,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(
                                      10),
                                  // ignore: prefer_const_literals_to_create_immutables
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromARGB(
                                          255, 196, 195, 195),
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
                              child:
                              Image.network(
                                'https://res.cloudinary.com/zahernajib78/image/upload/q_100/v1645732482/Go2parts/twitter_c9uit7.png',
                                fit: BoxFit.contain,
                              ),

                            ),
                            onTap: () {
                              print("Twitter");
                            },
                          ),




                        ],

                      ),

                      SizedBox(height: 30.0),

                      Container(

                        alignment: Alignment.center,
                        child:Text('or , register with Email',
                        style: TextStyle(color: Colors.black,fontSize: 15),

                      ),
                      ),
                      SizedBox(height: 15.0),


                      Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Container(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          // margin: EdgeInsets.fromLTRB(
                          //     10, 10, 10, 10),
                                child: TextFormField(
                                  decoration: ThemeHelper().textInputDecoration(
                                      'Email', 'Enter your Email '),

                                  controller: email,
                                  validator: (val) {
                                    if ((val!.isEmpty) |
                                    !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                                        .hasMatch(val)) {
                                      return "Enter a valid email address";
                                    }
                                    return null;
                                    return null;
                                  },
                                ),
                                decoration:
                                ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              SizedBox(height: 30.0),
                              Container(
                                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                // margin: EdgeInsets.fromLTRB(
                                //     10, 10, 10, 10),
                                child: TextFormField(
                                  obscureText: true,
                                  decoration: ThemeHelper().textInputDecoration(
                                      'Password', 'Enter your password'),
                                  controller: password,
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "Please enter your password";
                                    }
                                    return null;
                                  },
                                ),
                                decoration:
                                ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              SizedBox(height: 30.0),

                              Container(
                                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                // margin: EdgeInsets.fromLTRB(
                                //     10, 10, 10, 10),
                                child: TextFormField(
                                  obscureText: true,
                                  decoration: ThemeHelper().textInputDecoration(
                                      ' confirm your Password', 'Confirm your password'),
                                  controller: confirmpassword,
                                  validator: (val) {
                                    if(val!.isEmpty)
                                      return 'Empty ';
                                    if(val != password.text)
                                      return 'Not Match';
                                    return null;
                                  },
                                ),
                                decoration:
                                ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              SizedBox(height: 30),

                              Container(

                                decoration:
                                ThemeHelper().buttonBoxDecoration(context),
                                child: ElevatedButton(
                                  style: ThemeHelper().buttonStyle(),
                                  child: Padding(
                                    padding:
                                    EdgeInsets.fromLTRB(100, 0, 100, 0),
                                    child: Text(
                                      'Sign up'.toUpperCase(),
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,

                                      ),
                                    ),
                                  ),
                                  onPressed: () {

                                    if (_formKey.currentState!.validate()) {



                                      createUser().catchError((onError) => {
                                        if (onError)
                                          {
                                            print(
                                                "8alatttttt" + onError),
                                          }
                                      })
                                          .then((value) =>


                                      Navigator.of(context).pushAndRemoveUntil(
                                          MaterialPageRoute(
                                              builder: (context) => loginpage()
                                          ),
                                              (Route<dynamic> route) => false
                                      )
                                      );




                                    }

                                  },
                                ),
                              ),




                            ],
                          )),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
