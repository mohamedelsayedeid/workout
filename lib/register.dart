import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:workout/login.dart';
import 'package:workout/user_model.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool isVisible = true;
  bool isClicked = false;
  Color mainColor = Color(0xff7f1019);
  Color textColor = Colors.black54;

  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection:TextDirection.rtl, child:Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: const Text(
                      'تسجيل عضو جديد',
                      style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'flu'
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'يرجى ادخال اسم المستخدم';
                      }

                      return null;
                    },
                    controller: usernameController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      isDense: false,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          15.0,
                        ),
                      ),
                      label: const Text(
                        'اسم المستخدم',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'يرجى كتابة البريد الاليكتروني بشكل صحيح';
                      }

                      return null;
                    },
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      isDense: false,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          15.0,
                        ),
                      ),
                      label: const Text(
                        ' البريد الاليكتروني',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'يرجى كتابة الرقم السري بشكل صحيح';
                      }

                      return null;
                    },
                    controller: passwordController,
                    decoration: InputDecoration(
                      isDense: false,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          15.0,
                        ),
                      ),
                      label: const Text(
                        'الرقم السري',
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                        icon: Icon(
                          isVisible ? Icons.visibility : Icons.visibility_off,
                        ),
                      ),
                    ),
                    obscureText: isVisible,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  Container(
                    height: 42.0,
                    width: double.infinity,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      color:   mainColor,
                      borderRadius: BorderRadius.circular(
                        15.0,
                      ),
                    ),
                    child: MaterialButton(
                      height: 42.0,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          setState(() {
                            isClicked = true;
                          });

                          FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                              email: emailController.text,
                              password: passwordController.text)
                              .then((userData) {
                            // Fluttertoast.showToast(
                            //   msg: userData.user!.uid,
                            // );

                            FirebaseMessaging.instance.getToken().then((value) {
                              UserDataModel model = UserDataModel(
                                uId: userData.user!.uid,
                                image: '',
                                email: emailController.text,
                                username: usernameController.text,
                                token: value!,
                              );

                              FirebaseFirestore.instance
                                  .collection('users')
                                  .doc(userData.user!.uid)
                                  .set(model.toJson())
                                  .then((value) {
                                setState(() {
                                  isClicked = false;
                                });


                                // Navigator.push(context,MaterialPageRoute(builder: (context)=>  SignIn(),));

                              }).catchError((error) {
                                Fluttertoast.showToast(
                                  msg: error.toString(),
                                );
                              });
                            });
                          }).catchError((error) {
                            setState(() {
                              isClicked = false;
                            });

                            Fluttertoast.showToast(
                              msg: error.toString().split(']').last,
                            );
                          });
                        }
                      },
                      child: isClicked
                          ? const CupertinoActivityIndicator(
                        color: Colors.white,
                      )
                          : const Text(
                        'سجل الآن',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'flu'
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Text('لديك حساب؟', style: TextStyle(
                        fontSize: 15,
                        color: textColor,
                        fontFamily: 'flu',),
                      ),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SignIn()));

                      }, child: Text('سجل دخول الآن',style: TextStyle(
                          fontSize: 15,
                          color: mainColor,
                          fontFamily: 'flu',
                          fontWeight: FontWeight.bold
                      ),) ),
                    ],
                  ) ,
                ],
              ),

            ),

          ),
        ),
      ),
    ),
    );
  }
}