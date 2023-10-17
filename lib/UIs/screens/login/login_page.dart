import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:main/Domain/provider/user_auth_provider.dart';
import 'package:main/UIs/screens/login/forgotPassword_page.dart';
import 'package:main/UIs/screens/login/reg_alt.dart';
import 'package:main/UIs/screens/profile/profile.dart';
import 'package:main/UIs/themes/colors.dart';
import 'package:main/UIs/widgets/bottom_nav.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:main/Data/env/env.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var read;

  late SharedPreferences prefs;
  Future<void>? _loginFuture;

  @override
  void initState() {
    super.initState();
    initSharedPref();
    read = ref.read(userAuthNotifierProvider.notifier);
  }

  void initSharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    read = ref.read(userAuthNotifierProvider.notifier);
    _loginFuture?.catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(error.message),
        ),
      );
    });
    _loginFuture?.then((token) {
      print('Login Successful: ${read.state}');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BottomNav(token: read.state)),
      );
    });
    return FutureBuilder(
        future: _loginFuture,
        builder: (context, snapshot) {
          final isErrored = snapshot.hasError &&
              snapshot.connectionState != ConnectionState.waiting;
          final isLoading = snapshot.connectionState == ConnectionState.waiting;
          return Scaffold(
            key: _scaffoldKey,
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              iconTheme: const IconThemeData(
                color: ColorsTravelMate.primary,
              ),
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: const Text(
                          "Welcome back!",
                          style: TextStyle(
                              color: ColorsTravelMate.primary,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.25,
                      child: SvgPicture.asset("assets/svg/ch1.svg"),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: isErrored
                                ? Colors.red
                                : ColorsTravelMate.primary,
                            width: 1,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          child: TextFormField(
                            controller:
                                emailController, // Use the email controller
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              labelText: 'Username / Email',
                              border: InputBorder.none,
                              hintText: "Enter your username or email",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Password
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: isErrored
                                ? Colors.red
                                : ColorsTravelMate.primary,
                            width: 1,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          child: TextFormField(
                            obscureText: true,
                            controller: passwordController,
                            decoration: const InputDecoration(
                                labelText: 'Password',
                                border: InputBorder.none,
                                hintText: "Enter password",
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                                suffix: Icon(
                                  Icons.remove_red_eye,
                                  color: Color(0xFF8391A1),
                                  size: 20,
                                )),
                          ),
                        ),
                      ),
                    ),

                    // text line
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 20,
                        top: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment
                            .spaceBetween, // To separate the two widgets horizontally
                        children: [
                          Align(
                            alignment: Alignment
                                .centerLeft, // You can adjust the alignment as per your layout
                            child: GestureDetector(
                              onTap: () {
                                // Add your "Remember me" functionality here
                              },
                              child: Row(
                                children: [
                                  Checkbox(
                                    value:
                                        false, // Set the initial value accordingly
                                    onChanged: (bool? newValue) {
                                      // Add onChanged handler for the checkbox
                                    },
                                  ),
                                  const Text(
                                    "Remember me",
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ForgotPassword()));
                              },
                              child: const Text(
                                "Forgot Password?",
                                style: TextStyle(
                                  color: ColorsTravelMate.primary,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Login button
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 5,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              color: ColorsTravelMate.primary,
                              //onpressed only when loginfuture is null
                              onPressed: () {
                                setState(() {
                                  final email = emailController.text.trim();
                                  final password =
                                      passwordController.text.trim();
                                  final future = read.login(email, password);
                                  _loginFuture = future;
                                });
                              },
                              child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: isLoading
                                      ? const CircularProgressIndicator(
                                          color: Colors.white,
                                        )
                                      : const Text(
                                          "Login",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: Colors.grey,
                              height: 1,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: Text(
                              "OR",
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.grey,
                              height: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    // login with facebook or google
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 77,
                              height: 30,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image:
                                              AssetImage('assets/img/fb.png'),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 47,
                                    top: 0,
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'assets/img/google.png'),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have a accout? ",
                          style: TextStyle(
                              color: ColorsTravelMate.primary,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const RegisterAlt()));
                          },
                          child: const Text(
                            "Register",
                            style: TextStyle(
                              color: ColorsTravelMate.secundary,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
