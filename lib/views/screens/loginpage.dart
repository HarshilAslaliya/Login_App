// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_app/views/screens/registerpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../modals/globals.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController usernamecontrollar = TextEditingController();
  TextEditingController passwordcontrollar = TextEditingController();

  bool showPass = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: size.height * 0.945,
            width: size.width * 1,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(35),
              ),
              color: Colors.white,
            ),
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: size.height * 0.3,
                      color: Colors.teal,
                    ),
                    Container(
                      color: Colors.white,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 30, right: 30, bottom: 10, left: 30),
                  child: Form(
                    key: formKey,
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 120,
                          ),
                          Text(
                            "Invoice \nGenerator App",
                            style: GoogleFonts.josefinSans(
                              textStyle: const TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w900,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 70,
                          ),
                          TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: usernamecontrollar,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            validator: (val) {
                              if (val != username) {
                                return 'Invalid Username';
                              }
                              return null;
                            },
                            onSaved: (val) {
                              username = val;
                            },
                            style: const TextStyle(fontSize: 20),
                            decoration: const InputDecoration(
                                suffixIcon: Icon(
                                  Icons.person,
                                  size: 27,
                                  color: Colors.grey,
                                ),
                                hintText: 'Username',
                                hintStyle: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black54,
                                )),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            obscureText: !showPass,
                            controller: passwordcontrollar,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                            validator: (value) {
                              if (value != password) {
                                return 'Please enter correct password';
                              }
                              if (value!.length < 8) {
                                return 'Password must be at least 8 characters';
                              }
                              return null;
                            },
                            onSaved: (val) {
                              password = val;
                            },
                            style: const TextStyle(fontSize: 20),
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  icon: (showPass)
                                      ? const Icon(
                                          Icons.visibility_off,
                                          color: Colors.grey,
                                        )
                                      : const Icon(
                                          Icons.visibility,
                                          color: Colors.grey,
                                        ),
                                  onPressed: () {
                                    setState(() {
                                      showPass = !showPass;
                                    });
                                  },
                                ),
                                hintText: 'Password',
                                hintStyle: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.black54,
                                )),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              height: size.height * 0.07,
                              width: size.width * 0.9,
                              child: ElevatedButton(
                                onPressed: () async {
                                  if (formKey.currentState!.validate()) {
                                    formKey.currentState!.save();

                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();

                                    username = prefs.getString('username');
                                    password = prefs.getString('password');

                                    prefs.setBool('isLogin', true);

                                    await Navigator.pushReplacementNamed(
                                        context, '/');
                                  }
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                    Colors.teal,
                                  ),
                                ),
                                child: const Text(
                                  "Login",
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 60,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                      color: Colors.black45,
                                      spreadRadius: 2,
                                      blurRadius: 4,
                                    ),
                                  ],
                                ),
                                child: const CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.white,
                                  child: Image(
                                    image: AssetImage('asset/images/fb.png'),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                      color: Colors.black45,
                                      spreadRadius: 2,
                                      blurRadius: 4,
                                    ),
                                  ],
                                ),
                                child: const CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.white,
                                  child: Image(
                                    image:
                                        AssetImage('asset/images/google.png'),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                      color: Colors.black45,
                                      spreadRadius: 2,
                                      blurRadius: 4,
                                    ),
                                  ],
                                ),
                                child: const CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.white,
                                  child: Image(
                                    image: AssetImage('asset/images/apple.png'),
                                    height: 45,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                " Don't have an account?  ",
                                style: TextStyle(
                                    fontSize: 17, color: Colors.black),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, 'register_page');
                                },
                                child: const Text(
                                  "Sign up",
                                  style: TextStyle(
                                      color: Colors.teal,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
