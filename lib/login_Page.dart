

// ignore_for_file: prefer_const_constructors
import 'package:abdo/Widgets/CustomEmailText.dart';
import 'package:abdo/Widgets/CustomTextPassword.dart';
import 'package:abdo/Widgets/CustomUserText.dart';
import 'package:abdo/home_page.dart';
import 'package:abdo/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn_platform_interface.dart';
//import 'package:collection/collection.dart';

// class User {
//   String email;
//   String password;

//   User({required this.email, required this.password});
// }

// class UserService {
//   static List<User> users = [];

//   static void initializeUsers() {
//     // Fetch users from an API or database and populate the 'users' list.
//     // For demonstration purposes, I'm adding some dummy data.
//     users = [
//       User(email: "abdo@gmail.com", password: "12345"),
//       User(email: "kero@gmail.com", password: "12345"),
//       // Add other users as needed
//     ];
//   }
// }

class LoginPage extends StatefulWidget {
   LoginPage({super.key});
  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
        ),
        body: Center(
          child: Text('Welcome to the Home Page!'),
        ),
      ),
    );
  }
}

// ignore: use_key_in_widget_constructors
class Login extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Login({super.key}) {
  //   // Initialize users when the Login widget is created.
  //   UserService.initializeUsers();
  // }

  Widget buildImage() {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomRight: Radius.circular(250),
        bottomLeft: Radius.circular(0),
      ),
      child: Image.asset(
        'assets/test.jpg',
        width: 500.0,
        fit: BoxFit.fitWidth,
        height: 300,
      ),
    );
  }

  Widget buildTextField(String labelText, IconData iconData,
      {bool obscureText = false, TextEditingController? controller}) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFBF8E7),
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: labelText,
          icon: Icon(iconData),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(10.0),
        ),
      ),
    );
  }

  Widget buildTextFields() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Text(
            'Sign In',
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          const Text(
            'Welcome Back',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 40.0),
          CustomEmailTextFiled(
            hintText: ' Enter email',
          ),
          const SizedBox(height: 40.0),
          CustomPasswordTextFiled(
            hintText: '     Enter password',

          ),
          const SizedBox(height: 10.0),
          GestureDetector(
            onTap: () {
              print('Forgot Password');
            },
            child: const Text(
              'Forgot Password?',
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10.0),
        ],
      ),
    );
  }

  Widget buildSignInButton(BuildContext context) {
    return Column(
      children: [
        // ElevatedButton(
        //   onPressed: () {
          //   String enteredEmail = emailController.text;
          //   String enteredPassword = passwordController.text;

          //   User? authenticatedUser = UserService.users.firstWhereOrNull(
          //     (user) =>
          //         user.email == enteredEmail &&
          //         user.password == enteredPassword,
          //   );

          //   if (authenticatedUser != null) {
          //     // Navigate to HomePage on successful sign-in
          //     Navigator.pushReplacement(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => HomePage(),
          //       ),
          //     );
          //   } else {
          //     showSnackBar(context, 'Invalid email or password', false);
          //   }
        //   // },
        //   style: ElevatedButton.styleFrom(
        //     primary: const Color(0xFF3C2D28),
        //     onPrimary: const Color(0xFFFBF8E7),
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(10.0),
        //       side: const BorderSide(
        //         color: Colors.black,
        //         width: 2.0,
        //       ),
        //     ),
        //   ),
        //   child: const Text(
        //     'Sign In',
        //     style: TextStyle(
        //       fontSize: 32,
        //     ),
        //   ),
        // ),
                    AnimatedButton(
              height: 70,
              width: 150,
              text: 'Sign in',
              isReverse: true,
              selectedTextColor: Colors.black,
              transitionType: TransitionType.LEFT_TO_RIGHT,
              // textStyle: submitTextStyle,
              backgroundColor: Colors.orange,
              borderColor: Colors.white,
              borderRadius: 50,
              borderWidth: 2,
               onPress: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),)) ; 
                },
            ),           

        const SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Don't have an account yet?",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignUpPage(),
                  ),
                );
              },
              child: const Text(
                "Sign Up",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void showSnackBar(BuildContext context, String message, bool isSuccess) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(color: isSuccess ? Colors.green : Colors.red),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) => SingleChildScrollView(
          child: Column(
            children: [
              buildImage(),
              buildTextFields(),
              buildSignInButton(context),
            ],
          ),
        ),
      ),
    );
  }
}
