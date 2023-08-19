import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_management/screens/wrapper.dart';

class MyRegister extends StatelessWidget {
  const MyRegister({Key? key}) : super(key: key);
  static const routeName = '/MyRegister';

  @override
  Widget build(BuildContext context) {
    String email = '', pass = '';
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
                        InkWell(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: const Icon(Icons.arrow_back_ios)),
                      Text("Register",
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
        child: Container(
          margin: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                onChanged: (value) {
                  email = value;
                },
                decoration: const InputDecoration(hintText: 'Email'),
              ),
              TextField(
                onChanged: (value) {
                  pass = value;
                },
                obscureText: true,
                decoration: const InputDecoration(hintText: 'Password'),
              ),
              ElevatedButton(
                      style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
             Colors.purple,
                 ), 
                ),
                  onPressed: () async {
                    try {
                      UserCredential userCredential = await FirebaseAuth
                          .instance
                          .createUserWithEmailAndPassword(
                              email: email, password: pass);
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text('Registered Successfully!'),
                                  ));
                     Navigator.pushNamed(context, Wrapper.routeName);
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        print('The password provided is too weak.');
                      } else if (e.code == 'email-already-in-use') {
                        print('The account already exists for that email.');
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('The account already exists for this email!'),
                                  ));
                      }
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: const Text('Register')),
            ],
          ),
        ),
      ),
    );
  }
}