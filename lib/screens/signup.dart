import 'package:flutter/material.dart';
import 'package:mvvm_test/screens/login.dart';
import 'package:mvvm_test/widgets/change_screen.dart';
import 'package:mvvm_test/widgets/mybutton.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
bool obserText = true;

class _SignUpState extends State<SignUp> {
  void validation() {
    final FormState? form = _formKey.currentState;
    if (form!.validate()) {
      print("Yes");
    } else {
      print("No");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 220,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const <Widget>[
                    Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 400,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    TextFormField(
                      validator: (value) {
                        if (value == "") {
                          return "Please fill this field";
                        } else if (value!.length < 6) {
                          return "Username is to short";
                        }
                        return "";
                      },
                      decoration: const InputDecoration(
                        hintText: "Username",
                        hintStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == "") {
                          return "Please fill this field";
                        }
                        return "";
                      },
                      decoration: const InputDecoration(
                        hintText: "Email",
                        hintStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    TextFormField(
                      obscureText: obserText,
                      validator: (value) {
                        if (value == "") {
                          return "U need to input your password";
                        } else if (value!.length < 6) {
                          return "Password is to short";
                        }
                        return "";
                      },
                      decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              obserText = !obserText;
                            });
                            FocusScope.of(context).unfocus();
                          },
                          child: Icon(
                            obserText == true
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.black,
                          ),
                        ),
                        hintText: "Password",
                        hintStyle: const TextStyle(color: Colors.black),
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == "") {
                          return "Please input your phone number";
                        } else if (value!.length < 9) {
                          return "Number must have 9 characters";
                        }
                        return "";
                      },
                      decoration: const InputDecoration(
                        hintText: "Phone number",
                        hintStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    MyButton(
                      name: "Sign In",
                      onPressed: () {
                        validation();
                      },
                    ),
                    ChangeScreen(
                        whichAccount: "Already have an Account?",
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: ((context) => Login()),
                            ),
                          );
                        },
                        name: "Login"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
