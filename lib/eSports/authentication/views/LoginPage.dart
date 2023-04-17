// ignore_for_file: prefer_const_constructors

import 'package:app/eSports/profile/views/styles.dart';
import 'package:flutter/material.dart';
import 'Register.dart';
import 'package:app/eSports/home/home.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:app/eSports/authentication/models/profile.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  Profile profile =
      Profile(email: '', name: '', password: '', role: '', phone: '');
  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: firebase,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Error"),
            ),
            body: Center(
              child: Text("${snapshot.error}"),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Container(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Image.asset(
                      'images/esport_logo.png',
                      height: 215,
                    ),

                    // Welcomebacl!
                    Text(
                      'Welcome',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),

                    // Login here
                    Text(
                      'To E-sport Community !',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 18,
                      ),
                    ),

                    //เว้นช่อง
                    SizedBox(height: 35),

                    //EMAIL
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          border: Border.all(
                              color: Color.fromARGB(255, 17, 44, 56)),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: TextFormField(
                              decoration: InputDecoration(
                                  border: InputBorder.none, hintText: 'Email'),
                              validator: MultiValidator([
                                RequiredValidator(
                                    errorText: "กรุณาป้อนอีเมลด้วยครับ"),
                                EmailValidator(
                                    errorText: "รูปแบบอีเมลไม่ถูกต้อง")
                              ]),
                              keyboardType: TextInputType.emailAddress,
                              onSaved: (String? email) {
                                profile.email = email!;
                              }),
                        ),
                      ),
                    ),

                    //เว้นช่อง
                    SizedBox(height: 12),

                    //PASSWORD
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          border: Border.all(color: Color(0xFF112C38)),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                                border: InputBorder.none, hintText: 'Password'),
                            validator: RequiredValidator(
                                errorText: "กรุณาป้อนรหัสผ่านด้วยครับ"),
                            onSaved: (String? password) {
                              profile.password = password!;
                            },
                          ),
                        ),
                      ),
                    ),
                    //เว้นช่อง
                    SizedBox(height: 20),
                    //SIGNIN BTN
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 110.0),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: kBlue,
                            borderRadius: BorderRadius.circular(30)),
                        child: Center(
                          child: InkWell(
                            child: Text(
                              'Sign in',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            onTap: () async {
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();
                                try {
                                  await FirebaseAuth.instance
                                      .signInWithEmailAndPassword(
                                          email: profile.email,
                                          password: profile.password)
                                      .then((value) {
                                    formKey.currentState!.reset();
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder: (context) {
                                      return HomeScreen();
                                    }));
                                  });
                                } on FirebaseAuthException catch (e) {
                                  print("error ");
                                }
                              }
                            },
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 15),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // ตรงกลาง

                      children: [
                        InkWell(
                          child: Text(
                            "Register Now",
                            style: TextStyle(
                              color: Color(0xFF19202d),
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Register()));
                          },
                        ),
                      ],
                    ),
                  ],
                  //--------------------------------------
                ),
              ),
            ),
          );
        }
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
