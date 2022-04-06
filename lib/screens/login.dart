import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go2parts/config/config.dart';
import 'package:go2parts/screens/account.dart';
import 'package:go2parts/screens/profile.dart';
import 'package:go2parts/screens/profilepage.dart';
import 'package:go2parts/screens/signup.dart';
import 'package:go2parts/screens/widgets/header_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go2parts/screens/widgets/progressdialog.dart';
import 'package:hexcolor/hexcolor.dart';
// import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'AuthService.dart';
import 'common/theme_helper.dart';
import 'forgot_password_page.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
class loginpage extends StatefulWidget {
  const loginpage({Key? key}) : super(key: key);

  @override
  _loginpageState createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {

  @override
  Widget build(BuildContext context) {

    // final databaseRef = FirebaseDatabase.instance.reference();
    final name = TextEditingController();
    final password = TextEditingController();
    final googleSignIn = GoogleSignIn();
     final FirebaseAuth auth = FirebaseAuth.instance;
     final Future<FirebaseApp> _future = Firebase.initializeApp();
    double _headerHeight = 250;
    final _formKey = GlobalKey<FormState>();


    Future readEmailSignInUserData(User fUser) async {
      FirebaseFirestore.instance
          .collection("users")
          .doc(fUser.uid)
          .get()
          .then((dataSnapshot) async {
        await AutoParts.preferences!
            .setString("uid", dataSnapshot.data()[AutoParts.userUID]);
        await AutoParts.preferences!.setString(
            AutoParts.userEmail, dataSnapshot.data()[AutoParts.userEmail]);
        await AutoParts.preferences!.setString(
            AutoParts.userName, dataSnapshot.data()[AutoParts.userName]);
        /*await AutoParts.sharedPreferences.setString(AutoParts.userAvatarUrl,
          dataSnapshot.data()[AutoParts.userAvatarUrl]);
      List<String> cartList =
      dataSnapshot.data()[AutoParts.userCartList].cast<String>();
      await AutoParts.sharedPreferences
          .setStringList(AutoParts.userCartList, cartList);*/
      });
    }


    //  Future init() async {
    //   SharedPreferences _preferences = await SharedPreferences.getInstance();
    // }

    Future<void> login(String data, String data2) async {
      // this is for the real time database
      // databaseRef.child(" logged in").push().set({'name': data, 'password': data2});



      User fUser;
      UserCredential userCredential =
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: data,
        password: data2,
      );


      fUser = userCredential.user;
      readEmailSignInUserData(fUser);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.black26,
        content: Text('login successfuly!!!'),
      ));

    }

    Future init() async {
      SharedPreferences _preferences = await SharedPreferences.getInstance();
    }







    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: _headerHeight,
              child: Image.asset('images/img1.png'),

              //let's create a common header widget
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
                        'Login',

                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold,),
                      ),

                       SizedBox(height: 30.0),
                      Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          // margin: EdgeInsets.fromLTRB(
                          //     20, 10, 20, 10),
                                child: TextFormField(
                                  decoration: ThemeHelper().textInputDecoration(
                                      'Email', 'Enter your Email '),


                                  controller: name,
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
                              SizedBox(height: 15.0),
                              Container(
                                margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
                                alignment: Alignment.topRight,

                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ForgotPasswordPage()),
                                    );
                                  },
                                  child: Text(
                                    "Forgot your password?",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                decoration:
                                ThemeHelper().buttonBoxDecoration(context),
                                child: ElevatedButton(
                                  style: ThemeHelper().buttonStyle(),
                                  child: Padding(
                                    padding:
                                    EdgeInsets.fromLTRB(100, 0, 100, 0),
                                    child: Text(
                                      'Login'.toUpperCase(),
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                     ),
                                    ),
                                  ),
                                  onPressed: () {

                                    if (_formKey.currentState!.validate()) {

                                      final user = login(
                                          name.text, password.text)
                                          .catchError((onError) => {
                                        if (onError)
                                          {
                                            print(
                                                "8alatttttt" + onError),
                                          }
                                      })
                                          .then((value) =>
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      AccountPage())),


                                     //    CupertinoAlertDialog(title: Text('login'),content: Text("Login succeful")),


                                      );
                                      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                      //   backgroundColor: Colors.black26,
                                      //   content: Text('login successfuly!!!'),
                                      // ));





                                    }

                                  },
                                ),
                              ),
                              SizedBox(height: 20.0),
                              Container(child:Text('or,login with...',
                                style: TextStyle(color: Colors.black,fontSize: 17),

                              ),
                              ),
                              SizedBox(height: 20),

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
                              Container(
                                margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                                //child: Text('Don\'t have an account? Create'),
                                child: Text.rich(TextSpan(children: [
                                  TextSpan(text: "Don\'t have an account? "),
                                  TextSpan(
                                    text: 'Create',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    signuppage()));
                                      },
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).accentColor),
                                  ),
                                ])),
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
