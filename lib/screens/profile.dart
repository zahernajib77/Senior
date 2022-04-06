import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go2parts/config/config.dart';
import 'package:go2parts/screens/widgets/loading_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';



import 'account.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final address = TextEditingController();
    final phone = TextEditingController();
    final name = TextEditingController();
    final email = TextEditingController();
    final WIDTH = MediaQuery.of(context).size.width;


    Future updateUserProfileInfo() async {
      FirebaseFirestore.instance
          .collection("users")
          .doc(AutoParts.preferences!.getString(AutoParts.userUID))
          .update({
        "name": name.text.trim(),
        "phone": phone.text.trim(),
        "address": address.text.trim(),
      });
      await AutoParts.preferences!
          .setString(AutoParts.userName, name.text);
      await AutoParts.preferences!
          .setString(AutoParts.userPhone, phone.text);
      await AutoParts.preferences!
          .setString(AutoParts.userAddress, address.text);
    }

    return Scaffold(
        backgroundColor: Color.fromRGBO(247, 247, 242, 1),
        body: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(

                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
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
                            margin: EdgeInsets.only(top: 50),
                            width: WIDTH,
                            child: Column(
                              children: [
                                Container(
                                  width: WIDTH - 20,
                                  margin: const EdgeInsets.all(10),
                                  height: 180,
                                  child: Center(
                                    child: Container(
                                        width: 150,
                                        height: 150,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(80),
                                          child: FadeInImage.assetNetwork(
                                            width: WIDTH,
                                            fit: BoxFit.cover,
                                            placeholder:
                                            'assets/gifs/Rolling-1s-137px.gif',
                                            //    placeholder: BoxFit.contain,
                                            image:
                                            'https://partsstore.co.uk/wp-content/uploads/2016/06/shop.jpg',
                                          ),
                                        )
                                    ),),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  width: WIDTH - 20,
                                  margin: const EdgeInsets.all(10),
                                  height: 50,
                                                    child: TextField(
                                                      controller: name,
                                    decoration: InputDecoration(

                                      border: OutlineInputBorder(),
                                      hintText:snapshot.data!.docs[index]
                                          .data()['name'],
                                    ),
                                  ),

                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  width: WIDTH - 20,
                                  margin: const EdgeInsets.all(10),
                                  height: 50,
                                  child:  TextField(
                                    controller: phone,

                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText:snapshot.data!.docs[index]
                                          .data()['phone'] ,
                                    ),
                                  ),
                                ),
                                // Container(
                                //   decoration: BoxDecoration(
                                //       color: Colors.white,
                                //       borderRadius: BorderRadius.circular(10)),
                                //   width: WIDTH - 20,
                                //   margin: const EdgeInsets.all(10),
                                //   height: 50,
                                //   child: TextField(
                                //     decoration: InputDecoration(
                                //       border: OutlineInputBorder(),
                                //       hintText:snapshot.data!.docs[index]
                                //           .data()['email'],
                                //     ),
                                //   ),
                                //
                                // ),


                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  width: WIDTH - 20,
                                  margin: const EdgeInsets.all(10),
                                  height: 50,
                                  child:  TextField(
                                    controller: address,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: snapshot.data!.docs[index]
                                          .data()['address'],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20,),
                                Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      new RaisedButton(
                                        child: new Text("Submit"),
                                        onPressed: (){
                                          
                                          updateUserProfileInfo();
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Profile()));
                                        },
                                      ),

                                    ],
                                  ),

                                )

                              ],
                            ),
                          );
                        }
                    );

                  }
                ),
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
                      child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AccountPage()),
                            );
                          },
                          child: Icon(Icons.arrow_back, color: Colors.black)))),
            ],
          ),
        ));
  }
}


