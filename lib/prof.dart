import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imu_vcp/mainpage.dart';

class ProfPage extends StatefulWidget {
  const ProfPage({super.key});

  @override
  State<ProfPage> createState() => _ProfPageState();
}

class _ProfPageState extends State<ProfPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controllerFirstExam = TextEditingController();
  final TextEditingController _controllerFinalExam = TextEditingController();
  String _firstExam = '';
  double _firstExamInt = 0;
  String _finalExam = '';
  double _finalExamInt = 0;
  String _averageString = 'Waiting for input...';

  void _getdata() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _firstExam = _controllerFirstExam.text;
        _finalExam = _controllerFinalExam.text;

        _firstExamInt = double.parse(_firstExam);
        _finalExamInt = double.parse(_finalExam);

        _firstExamInt = (_firstExamInt * 40) / 100;
        _finalExamInt = (_finalExamInt * 60) / 100;
        _averageString = 'Student\'s average grade is ${_firstExamInt + _finalExamInt}';
      });
    }
  }

  String? _validateField(String? value) {
    if (value == null || value.isEmpty) {
      return 'You have to enter exam grades correctly.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        foregroundColor: Colors.white,
        leading: const Icon(Icons.person),
        title: const Text('Prof Control Panel'),
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              if (value == 1) {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const MainPage()));
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              const PopupMenuItem(
                value: 1,
                child: Text('Exit Account'),
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(75),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  child: TextFormField(
                    validator: _validateField,
                    controller: _controllerFirstExam,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: const InputDecoration(
                      labelText: 'First Exam Grade',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        borderSide: BorderSide(color: Colors.cyan),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  child: TextFormField(
                    validator: _validateField,
                    controller: _controllerFinalExam,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: const InputDecoration(
                      labelText: 'Final Exam Grade',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        borderSide: BorderSide(color: Colors.cyan),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.cyan),
                      foregroundColor: WidgetStatePropertyAll(Colors.white),
                    ),
                    onPressed: _getdata,
                    child: const Text('Calculate'),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  child: Text(
                    _averageString,
                    style: const TextStyle(fontSize: 30),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
