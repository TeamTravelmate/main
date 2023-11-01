import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:main/Data/env/env.dart';
import 'package:main/UIs/screens/login/login_page.dart';
import 'package:main/UIs/themes/colors.dart';
import 'package:main/UIs/widgets/bottom_nav.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RegisterAlt extends StatefulWidget {
  const RegisterAlt({super.key});

  @override
  State<RegisterAlt> createState() => _RegisterAltState();
}

class _RegisterAltState extends State<RegisterAlt> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void registerUser() async {
    if (_formkey.currentState!.validate()) {
      final firstName = firstNameController.text.trim();
      final lastName = firstNameController.text.trim();
      final email = emailController.text.trim();
      final password = passwordController.text;

      // Create the JSON payload to send to the backend
      final Map<String, String> data = {
        'firstName': firstName,
        'lastName': lastName,
        "birthday": "1999-04-22",
        "gender": "male",
        "username": "cheking101",
        'email': email,
        'phoneNo': '071',
        'password': password,
      };

      // Send the POST request to the backend API
      final Uri regUri = Uri.parse('$backendUrl/user/register');
      print(regUri);
      final response = await http.post(
        regUri,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data),
      );

      var responseData = jsonDecode(response.body);
      print(responseData);
      // Check the API response
      if (response.statusCode == 201) {
        // Successful login
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.red,
            content: Text('Registration Successful!'),
          ),
        );

        // Navigate to the home page after successful login and replace the current route.
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      } else if (response.statusCode == 401) {
        // Invalid email or password
        print('Invalid email or password');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.red,
            content: Text('Registration failed. Try again'),
          ),
        );
      }
    } else {
      // Registration failed
      print('Error occurred while Registration. Please try again');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error occurred while Registration. Please try again'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: const Text(
                      "Register Now!",
                      style: TextStyle(
                          color: ColorsTravelMate.primary,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 40,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: ColorsTravelMate.primary,
                        width: 1,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        controller:
                            firstNameController, // Use the email controller
                        keyboardType: TextInputType.name,
                        validator: MultiValidator([
                          RequiredValidator(errorText: 'Enter first named'),
                          MinLengthValidator(3,
                              errorText: 'Minimum 3 charecter filled name'),
                        ]),
                        decoration: const InputDecoration(
                          labelText: 'First Name',
                          border: InputBorder.none,
                          hintText: "Enter your First name",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                          errorStyle: TextStyle(fontSize: 18.0),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: ColorsTravelMate.primary,
                        width: 1,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        controller:
                            lastNameController, // Use the email controller
                        keyboardType: TextInputType.name,
                        validator: MultiValidator([
                          RequiredValidator(errorText: 'Enter Last name'),
                          MinLengthValidator(3,
                              errorText: 'Minimum 3 charecter filled name'),
                        ]),
                        decoration: const InputDecoration(
                          labelText: 'Last Name',
                          border: InputBorder.none,
                          hintText: "Enter your Last Name",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                          errorStyle: TextStyle(fontSize: 18.0),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: ColorsTravelMate.primary,
                        width: 1,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        controller: emailController, // Use the email controller
                        keyboardType: TextInputType.emailAddress,
                        validator: MultiValidator([
                          RequiredValidator(errorText: 'Enter email address'),
                          EmailValidator(
                              errorText: 'Please correct email filled'),
                        ]),
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          border: InputBorder.none,
                          hintText: "Enter your email",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                          errorStyle: TextStyle(fontSize: 18.0),
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
                        color: ColorsTravelMate.primary,
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
                        validator: MultiValidator([
                          PatternValidator(r'(?=.*?[#?!@$%^&*-])',
                              errorText:
                                  'passwords must have at least one special character'),
                          RequiredValidator(errorText: "* Required"),
                          MinLengthValidator(6,
                              errorText:
                                  "Password should be atleast 6 characters"),
                          MaxLengthValidator(15,
                              errorText:
                                  "Password should not be greater than 15 characters")
                        ]),
                        decoration: const InputDecoration(
                            labelText: 'Password',
                            border: InputBorder.none,
                            hintText: "Enter a password",
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

                SizedBox(
                  height: 10,
                ),

                // Confirm Password
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: ColorsTravelMate.primary,
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
                        controller: confirmPasswordController,
                        validator: (val){
                          if (val != passwordController.text) {
                            return 'Password doesn\'t Match';
                          }
                        },
                        decoration: const InputDecoration(
                            labelText: 'Confirm Password',
                            border: InputBorder.none,
                            hintText: "Confirm Password",
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

                const SizedBox(
                  height: 40,
                ),

                // Register button
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
                          onPressed: registerUser,
                          child: const Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Text(
                              "Register",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
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
                                      image: AssetImage('assets/img/fb.png'),
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
                                      image:
                                          AssetImage('assets/img/google.png'),
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
                      "Already have an account? ",
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
                                builder: (context) => const LoginScreen()));
                      },
                      child: const Text(
                        "Login",
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
      ),
    );
  }
}
