import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:workout/ourbody.dart';
import 'package:workout/pages/days.dart';

import 'Register.dart';

class SignIn extends StatefulWidget{
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final FirebaseAuth_auth = FirebaseAuth.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final mykey = GlobalKey<FormState>();
  bool isVisible = true;
  bool isClicked = false;
  Color mainColor = Color(0xff7f1019);
  Color textColor = Colors.black54;

  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl, child: Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: mykey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/logo.png'),
                  SizedBox(height: 40,),
                  Text(
                    'تسجيل الدخول',
                    style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'flu',
                        color: textColor
                    ),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'من فضلك ادخل البريد الاليكتروني';
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
                        'البريد الأليكتروني',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'الرقم السري قصير جداً يرجى كتابة الرقم السري ';
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
                    // clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.circular(
                        10.0,
                      ),
                    ),
                    child: MaterialButton(
                      height: 42.0,
                      onPressed: () {
                        if(mykey.currentState!.validate()) {
                          setState(() {
                            isClicked = true;
                          });

                          FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                              email: emailController.text,
                              password: passwordController.text)
                              .then((value) {
                            setState(() {
                              isClicked = false;
                            });

                            Fluttertoast.showToast(
                              msg: value.user!.uid,
                            );
                            Navigator.push(context,MaterialPageRoute(builder: (context)=>  SignIn(),));
                          })
                              .catchError((error) {
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
                      ) : const Text(
                        'تأكيد',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'flu',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'ليس لديك حساب ؟',
                        style: TextStyle(fontFamily: 'flu'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(context,MaterialPageRoute(builder: (context)=> RegisterScreen(),));
                        },
                        child:  Text(
                          'انشيء حساب جديد',
                          style:TextStyle(fontFamily: 'flu',color:mainColor,fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 80.0),
                    child: TextButton (onPressed: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context)=> OurBody(),));

                    }, child:Text ('أو سجل دخول كزائر',style:TextStyle(fontFamily: 'flu',color: mainColor,fontWeight: FontWeight.bold),
                    ),
                    ),




                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),);
  }
}