import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imu_vcp/helppage.dart';
import 'package:imu_vcp/prof.dart';
import 'package:imu_vcp/secratry.dart';
import 'package:imu_vcp/student.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  DateTime? _lastPressed;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controllerUsername = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  String _username = '';
  String _password = '';

  void _singIn() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _username = _controllerUsername.text;
        _password = _controllerPassword.text;

        if (_username == 'prof' && _password == 'password1') {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfPage()));
        } else if (_username == 'student' && _password == 'password2') {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const StudentPage()));
        } else if (_username == 'secretary' && _password == 'password3') {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const SecretaryPage()));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Username or password incorrect.'),
            backgroundColor: Colors.cyan,
            duration: Duration(seconds: 3),
          ));
        }
      });
    }
  }

  String? _validateField(String? value) {
    if (value == null || value.isEmpty) {
      return 'You have to enter your credentials correctly.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        final now = DateTime.now();

        if (_lastPressed == null || now.difference(_lastPressed!) > const Duration(seconds: 3)) {
          _lastPressed = now;

          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.white,
            content: Text('Are you sure to exit? If you sure, press again.'),
            duration: Duration(seconds: 3),
          ));
        } else if (!didPop) {
          SystemNavigator.pop();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          foregroundColor: Colors.white,
          leading: const Icon(Icons.home_outlined),
          title: const Text('Welcome to VCP!'),
          actions: [
            PopupMenuButton(
              onSelected: (value) {
                if (value == 1) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const HelpPage()));
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                const PopupMenuItem(
                  value: 1,
                  child: Text('Help'),
                )
              ],
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 50,
            ),
            child: Center(
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 150,
                    ),
                    SizedBox(
                      height: 150,
                      width: 300,
                      child: Image.asset('assets/images/imu_logo.png'),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                      child: TextFormField(
                        validator: _validateField,
                        controller: _controllerUsername,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                            borderSide: BorderSide(color: Colors.cyan),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                            borderSide: BorderSide(color: Colors.cyan),
                          ),
                          labelText: 'Username',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                      child: TextFormField(
                        validator: _validateField,
                        controller: _controllerPassword,
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                            borderSide: BorderSide(color: Colors.cyan),
                          ),
                          labelText: 'Password',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    ElevatedButton(
                      onPressed: _singIn,
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Colors.cyan),
                        foregroundColor: WidgetStateProperty.all(Colors.white),
                      ),
                      child: const Text('Sign In'),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
