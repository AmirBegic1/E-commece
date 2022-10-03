import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mvvm_test/screens/signup.dart';
import 'package:mvvm_test/widgets/change_screen.dart';
import '../widgets/mybutton.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
var email;
var password;

void validation() async {
  final FormState? _form = _formKey.currentState;
  if (!_form!.validate()) {
    try {
      UserCredential result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      print(result.user?.uid);
    } on PlatformException catch (e) {
      print(e.message.toString());
    }
  } else {}
}

bool obserText = true;

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 350,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      const Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 50, fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                        onChanged: (value) {
                          setState(() {
                            email = value;
                          });
                        },
                        validator: (value) {
                          if (value == "") {
                            return "Please fill this field";
                          }
                          return "";
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(
                            Icons.email,
                            color: Colors.black,
                          ),
                          hintText: "Email",
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      TextFormField(
                        onChanged: (value) {
                          setState(() {
                            password = value;
                          });
                        },
                        obscureText: obserText,
                        validator: (value) {
                          if (value == "") {
                            return "Please fill this field";
                          } else if (value!.length < 6) {
                            return "Password is too short";
                          }
                          return "";
                        },
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: "Password",
                          suffixIcon: GestureDetector(
                            onTap: () {
                              FocusScope.of(context).unfocus();
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
                          hintStyle: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      MyButton(
                          name: "Login",
                          onPressed: () {
                            validation();
                          }),
                      ChangeScreen(
                          whichAccount: "Don't have an account?",
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: ((context) => const SignUp()),
                              ),
                            );
                          },
                          name: "SignUp"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
