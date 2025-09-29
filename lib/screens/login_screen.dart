import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_fitness_app/models/users_model.dart';
import 'package:flutter_fitness_app/screens/register_screen.dart';
import 'package:flutter_fitness_app/services/auth_services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _firebaseAuth = AuthServices();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  void HandleLogin() async {
    final usermodel = UsersModel(
      email: _emailController.text,
      password: _passwordController.text,
    );
    await _firebaseAuth.loginUser(usermodel);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF232526), Color(0xFF232526), Color(0xFF414345)],
              begin: Alignment.topLeft,
              end: Alignment.topRight,
            ),
          ),

          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: Center(
                    child: Text(
                      'My Fitness Pal',
                      style: GoogleFonts.afacad(
                        color: Colors.white,
                        fontSize: 100,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Padding(
                  padding: EdgeInsets.only(),
                  child: Center(
                    child: Text(
                      'Login',
                      style: GoogleFonts.bebasNeue(
                        color: Colors.white,
                        fontSize: 55,
                      ),
                    ),
                  ),
                ),

                Container(
                  width: 250,
                  child: TextField(
                    style: TextStyle(color: Colors.white, fontSize: 16.sp),
                    controller: _emailController,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(45),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      suffixIcon: Icon(
                        Icons.email_outlined,
                        color: Colors.white.withOpacity(0.5),
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.1),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(45),
                      ),
                      labelText: 'Email',
                      labelStyle: GoogleFonts.aboreto(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24),
                Container(
                  width: 250,
                  child: TextField(
                    style: TextStyle(color: Colors.white, fontSize: 16.sp),
                    controller: _passwordController,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(45),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      suffixIcon: Icon(
                        Icons.lock_outline_rounded,
                        color: Colors.white.withOpacity(0.5),
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.1),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(45),
                      ),
                      labelText: 'Password',
                      labelStyle: GoogleFonts.aboreto(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Colors.black.withOpacity(0.2),
                    ),
                  ),
                  onPressed: () {
                    HandleLogin();
                  },
                  child: Text(
                    'Login',
                    style: GoogleFonts.aboreto(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Don't you have an account?",
                      style: GoogleFonts.aboreto(color: Colors.white),
                    ),
                    Container(
                      child: ElevatedButton(
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(Size(60, 27)),
                          backgroundColor: MaterialStateProperty.all(
                            Colors.black.withOpacity(0.2),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Register',
                          style: GoogleFonts.aboreto(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
