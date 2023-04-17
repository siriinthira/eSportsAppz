import 'package:app/eSports/profile/views/styles.dart';
import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'package:app/eSports/authentication/models/profile.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formKey = GlobalKey<FormState>();
  Profile profile =
      Profile(email: '', name: '', password: '', role: '', phone: '');
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  String? role = "User";

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
            body: SafeArea(
              child: Center(
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      // Welcomebacl!
                      Text(
                        'SIGN UP',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Color(0xFF112C38),
                        ),
                      ),

                      // Login here
                      Text(
                        'To Catch up E-Sport News !',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 18,
                          color: Color(0xFF112C38),
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
                                border: InputBorder.none,
                                hintText: 'Your Email',
                              ),
                              validator: RequiredValidator(
                                  errorText: "กรุณาป้อน email !!!!"),
                              keyboardType: TextInputType.emailAddress,
                              onSaved: (String? email) {
                                profile.email = email!;
                              },
                            ),
                          ),
                        ),
                      ),

                      //เว้นช่อง
                      SizedBox(height: 12),

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
                                  border: InputBorder.none,
                                  hintText: 'User Name'),
                              validator: RequiredValidator(
                                  errorText: "กรุณาป้อน name !!!!"),
                              onSaved: (String? name) {
                                profile.name = name!;
                              },
                            ),
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
                              //obscureText: true,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Password'),
                              validator: RequiredValidator(
                                  errorText: "กรุณาป้อน password !!!!"),
                              obscureText: true,
                              onSaved: (String? password) {
                                profile.password = password!;
                              },
                            ),
                          ),
                        ),
                      ),

                      //เว้นช่อง
                      SizedBox(height: 12),

                      //PASSWORD
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Role',
                          ),
                          value: role,
                          items: <String>[
                            'User',
                            'Sponsors',
                            'Students',
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              role = value!;
                              profile.role = role!;
                            });
                          },
                        ),
                      ),
                      //เว้นช่อง
                      SizedBox(height: 35),
                      //SIGNIN BTN
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 110.0),
                        child: InkWell(
                          child: Container(
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  color: kBlue,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Center(
                                child: Text(
                                  'Sign up',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              )),
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();

                              try {
                                // Create user with email and password
                                UserCredential userCredential =
                                    await FirebaseAuth.instance
                                        .createUserWithEmailAndPassword(
                                            email: profile.email,
                                            password: profile.password);

                                // Set display name and custom claim for role
                                await userCredential.user!.updateDisplayName(
                                    profile.name); // Set display name
                                await FirebaseAuth.instance.currentUser!
                                    .updateDisplayName(profile.name);
                                await FirebaseAuth.instance.currentUser!
                                    .updatePhotoURL(profile.role);

                                await FirebaseFirestore.instance
                                    .collection('users')
                                    .doc(userCredential.user!.uid)
                                    .set({
                                  'email': profile.email,
                                  'name': profile.name,
                                  'role': profile.role,
                                });

                                // Navigate to Home page
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()),
                                );
                              } catch (e) {
                                print(e);
                              }
                            }
                          },
                        ),
                      ),
                    ],
                  ),
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
