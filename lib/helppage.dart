import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          foregroundColor: Colors.white,
          leading: const Icon(Icons.help_outline_rounded),
          title: const Text('How to use?'),
        ),
        body: const Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 50),
            child: Column(
              children: [
                SizedBox(height: 25),
                SizedBox(
                  child: Text(
                    'Welcome!',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                SizedBox(
                  child: Text(
                    'You can log in and use VCP with 3 profile.',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                SizedBox(
                  child: Text(
                    '- Written by Seferhan KAYA',
                    style: TextStyle(
                      fontSize: 20,
                    ),
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
