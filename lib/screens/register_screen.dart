// import 'package:flutter/material.dart';
// import 'package:flutter_project1/utils/colors.dart';
// import 'package:flutter_project1/screens/login_screen.dart';
//
// class SignupPage extends StatelessWidget {
//   const SignupPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         body: SingleChildScrollView(
//           child: Container(
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topRight,
//                 colors: [
//                   upper1,
//                   Colors.white10,
//                   Colors.white,
//                 ],
//               )
//             ),
//             padding: const EdgeInsets.symmetric(horizontal: 40),
//             height: MediaQuery.of(context).size.height - 50,
//             width: double.infinity,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: <Widget>[
//                 Column(
//                   children: <Widget>[
//                     const SizedBox(height: 60.0),
//
//                     const Text(
//                       "Sign up",
//                       style: TextStyle(
//                         fontSize: 30,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     Text(
//                       "Create your account",
//                       style: TextStyle(fontSize: 15, color: Colors.grey[700]),
//                     )
//                   ],
//                 ),
//                 Column(
//                   children: <Widget>[
//                     TextField(
//                       decoration: InputDecoration(
//                           hintText: "Username",
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(18),
//                               borderSide:const BorderSide(color: Colors.black)),
//                           fillColor: Colors.white,
//                           filled: true,
//                           prefixIcon: const Icon(Icons.person)),
//                     ),
//
//                     const SizedBox(height: 20),
//
//                     TextField(
//                       decoration: InputDecoration(
//                           hintText: "Email",
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(18),
//                               borderSide:const BorderSide(color: Colors.black)),
//                           fillColor: Colors.white,
//                           filled: true,
//                           prefixIcon: const Icon(Icons.email)),
//                     ),
//
//                     const SizedBox(height: 20),
//
//                     TextField(
//                       decoration: InputDecoration(
//                         hintText: "Password",
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(18),
//                             borderSide:const BorderSide(color: Colors.black)),
//                         fillColor: Colors.white,
//                         filled: true,
//                         prefixIcon: const Icon(Icons.password),
//                       ),
//                       obscureText: true,
//                     ),
//
//                     const SizedBox(height: 20),
//
//                     TextField(
//                       decoration: InputDecoration(
//                         hintText: "Confirm Password",
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(18),
//                             borderSide:const BorderSide(color: Colors.black)),
//                         fillColor: Colors.white,
//                         filled: true,
//                         prefixIcon: const Icon(Icons.password),
//                       ),
//                       obscureText: true,
//                     ),
//                   ],
//                 ),
//                 Container(
//                     padding: const EdgeInsets.only(top: 3, left: 3),
//
//                     child: ElevatedButton(
//                       onPressed: () {
//                       },
//                       child: const Text(
//                         "Sign up",
//                         style: TextStyle(
//                             fontSize: 20,
//                             color: Colors.black,
//                         ),
//                       ),
//                       style: ElevatedButton.styleFrom(
//                         shape: const StadiumBorder(),
//                         padding: const EdgeInsets.symmetric(vertical: 16),
//                         backgroundColor: upper1,
//                       ),
//                     )
//                 ),
//
//                 const Center(child: Text("Or")),
//
//                 Container(
//                   height: 45,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(25),
//                     border: Border.all(
//                       color: Colors.lightGreen,
//                     ),
//                     boxShadow: [
//                       BoxShadow(
//                         color: upper1,
//                         spreadRadius: 1,
//                         blurRadius: 1,
//                         offset: const Offset(0, 1), // changes position of shadow
//                       ),
//                     ],
//                   ),
//                   child: TextButton(
//                     onPressed: () {},
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Container(
//                           height: 30.0,
//                           width: 30.0,
//                           decoration: const BoxDecoration(
//                             image: DecorationImage(
//                                 image:   AssetImage('assets/images/login_signup/google.png'),
//                                 fit: BoxFit.cover),
//                             shape: BoxShape.circle,
//                           ),
//                         ),
//
//
//                         const Text("Sign In with Google",
//                           style: TextStyle(
//                             fontSize: 16,
//                             color: Colors.black,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     const Text("Already have an account?"),
//                     TextButton(
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) => LoginPage()),
//                           );
//                         },
//                         child: const Text("Login", style: TextStyle(color: Colors.black),)
//                     )
//                   ],
//                 )
//               ],
//             ),
//
//           ),
//         ),
//         backgroundColor: Colors.white,
//
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_project1/utils/colors.dart';
import 'package:flutter_project1/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_project1/firebase_auth//firebase_auth_services.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final FirebaseAuthService _authService = FirebaseAuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  colors: [
                    upper1,
                    Colors.white10,
                    Colors.white,
                  ],
                )
            ),
            padding: const EdgeInsets.symmetric(horizontal: 40),
            height: MediaQuery.of(context).size.height - 50,
            width: double.infinity,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      const SizedBox(height: 60.0),
                      const Text(
                        "Sign up",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Create your account",
                        style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                            hintText: "Email",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                                borderSide:const BorderSide(color: Colors.black)),
                            fillColor: Colors.white,
                            filled: true,
                            prefixIcon: const Icon(Icons.email)),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          hintText: "Password",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide:const BorderSide(color: Colors.black)),
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon: const Icon(Icons.password),
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _confirmPasswordController,
                        decoration: InputDecoration(
                          hintText: "Confirm Password",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide:const BorderSide(color: Colors.black)),
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon: const Icon(Icons.password),
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm your password';
                          } else if (value != _passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                  Container(
                      padding: const EdgeInsets.only(top: 3, left: 3),
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            User? user = await _authService.signUpWithEmailPassword(
                              _emailController.text,
                              _passwordController.text,
                            );
                            if (user != null) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => LoginPage()),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Failed to sign up')),
                              );
                            }
                          }
                        },
                        child: const Text(
                          "Sign up",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          backgroundColor: upper1,
                        ),
                      )
                  ),
                  const Center(child: Text("Or")),
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color: Colors.lightGreen,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: upper1,
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 30.0,
                            width: 30.0,
                            decoration: const BoxDecoration(
                              // image: DecorationImage(
                              //     image: AssetImage('assets/images/login_signup/google.png'),
                              //     fit: BoxFit.cover),
                              shape: BoxShape.circle,
                            ),
                          ),
                          const Text(
                            "Sign In with Google",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text("Already have an account?"),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginPage()),
                          );
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(color: Colors.black),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
