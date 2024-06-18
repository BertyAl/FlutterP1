// import 'package:flutter/material.dart';
// import 'package:flutter_project1/utils/colors.dart';
// import 'package:flutter_project1/screens/register_screen.dart';
// import 'package:flutter_project1/responsive/navbar.dart';
//
// class LoginPage extends StatelessWidget {
//   const LoginPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         body: Container(
//           decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topRight,
//                 colors: [
//                   upper1,
//                   Colors.white70,
//                   Colors.white,
//                 ],
//               )
//           ),
//           padding: const EdgeInsets.symmetric(horizontal: 40),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               _header(context),
//               _inputField(context),
//               _signup(context),
//             ],
//
//           ),
//         ),
//       ),
//     );
//   }
//
//   _header(context) {
//     return const Column(
//       children: [
//         Text(
//           "Welcome Back",
//           style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
//         ),
//         Text("Enter your credential to login"),
//       ],
//     );
//   }
//
//   _inputField(context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         TextField(
//           decoration: InputDecoration(
//               hintText: "Username",
//               border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(18),
//                   borderSide:const BorderSide(color: Colors.black)),
//               fillColor: Colors.white,
//               filled: true,
//               prefixIcon: const Icon(Icons.person)),
//         ),
//         const SizedBox(height: 10),
//         TextField(
//           decoration: InputDecoration(
//             hintText: "Password",
//             border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(18),
//                 borderSide:const BorderSide(color: Colors.black)),
//             fillColor: Colors.white,
//             filled: true,
//             prefixIcon: const Icon(Icons.password),
//           ),
//           obscureText: true,
//         ),
//         const SizedBox(height: 10),
//         ElevatedButton(
//           onPressed: () {
//           },
//           style: ElevatedButton.styleFrom(
//             shape: const StadiumBorder(),
//             padding: const EdgeInsets.symmetric(vertical: 16),
//             backgroundColor: upper1,
//           ),
//           child: const Text(
//             "Login",
//             style: TextStyle(fontSize: 20, color: Colors.black),
//           ),
//         ),
//         const SizedBox(height: 10),
//         ElevatedButton(
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => SimpleBottomNavigation()),
//             );
//           },
//           style: ElevatedButton.styleFrom(
//             shape: const StadiumBorder(),
//             padding: const EdgeInsets.symmetric(vertical: 16),
//             backgroundColor: upper1,
//           ),
//           child: const Text(
//             "Home",
//             style: TextStyle(fontSize: 20, color: Colors.black),
//           ),
//         ),
//       ],
//     );
//   }
//
//   _forgotPassword(context) {
//     return TextButton(
//       onPressed: () {},
//       child: const Text("Forgot password?",
//         style: TextStyle(color: Colors.black),
//       ),
//     );
//   }
//
//   _signup(context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         const Text("Dont have an account? "),
//         TextButton(
//               onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => SignupPage()),
//               );
//             },
//             child: const Text(
//               "Sign Up",
//               style: TextStyle(color: Colors.black))
//         )
//       ],
//     );
//   }
//
// }

import 'package:flutter/material.dart';
import 'package:flutter_project1/utils/colors.dart';
import 'package:flutter_project1/screens/register_screen.dart';
import 'package:flutter_project1/responsive/navbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_project1/firebase_auth//firebase_auth_services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuthService _authService = FirebaseAuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                colors: [
                  upper1,
                  Colors.white70,
                  Colors.white,
                ],
              )
          ),
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _header(context),
                _inputField(context),
                _signup(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _header(context) {
    return const Column(
      children: [
        Text(
          "Welcome Back",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        Text("Enter your credential to login"),
      ],
    );
  }

  _inputField(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFormField(
          controller: _emailController,
          decoration: InputDecoration(
              hintText: "Email",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: const BorderSide(color: Colors.black)),
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
        const SizedBox(height: 10),
        TextFormField(
          controller: _passwordController,
          decoration: InputDecoration(
            hintText: "Password",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: const BorderSide(color: Colors.black)),
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
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              User? user = await _authService.signInWithEmailPassword(
                _emailController.text,
                _passwordController.text,
              );
              if (user != null) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SimpleBottomNavigation()),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Failed to sign in')),
                );
              }
            }
          },
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(vertical: 16),
            backgroundColor: upper1,
          ),
          child: const Text(
            "Login",
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SimpleBottomNavigation()),
            );
          },
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(vertical: 16),
            backgroundColor: upper1,
          ),
          child: const Text(
            "Home",
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
        ),
      ],
    );
  }

  _signup(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account? "),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignupPage()),
            );
          },
          child: const Text(
              "Sign Up",
              style: TextStyle(color: Colors.black)),
        ),
      ],
    );
  }
}
