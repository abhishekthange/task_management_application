import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_management/screens/register.dart';

import 'login.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);
  static const routeName = '/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(55),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [const Color(0xFF09C153).withOpacity(0.1),const Color(0xFF1C70D2).withOpacity(0.1),const Color(0xFF4B1CD2).withOpacity(0.1)])
              ),
              child: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                      Text("Task Management App",
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff768089)
                      ),
                      )
                      ],
                    ),
                  ),
                ],
              ),
                    ),
            )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                  style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
             Colors.purple,
                 ), 
                ),
                onPressed: () {
                  Navigator.pushNamed(context, MyLogin.routeName);
                },
                child: const Text('Login')),
            ElevatedButton(
                       style: ButtonStyle(
                     backgroundColor: MaterialStateProperty.all<Color>(
             Colors.purple,
                 ), 
                ),
                onPressed: () {
                  Navigator.pushNamed(context, MyRegister.routeName);
                },
                child: const Text('Register')),
          ],
        ),
      ),
    );
  }
}