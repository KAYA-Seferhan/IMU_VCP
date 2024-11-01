import 'package:flutter/material.dart';
import 'package:imu_vcp/mainpage.dart';

class SecretaryPage extends StatefulWidget {
  const SecretaryPage({super.key});

  @override
  State<SecretaryPage> createState() => _SecretaryPageState();
}

class _SecretaryPageState extends State<SecretaryPage> {
  final List<String> _list = [];
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controllerEntry = TextEditingController();
  String _entry = '';

  void _addItem() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _entry = _controllerEntry.text;
        _list.add(_entry);
      });
    }
  }

  String? _validateField(String? value) {
    if (value == null || value.isEmpty) {
      return 'You have to enter an announcement.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        foregroundColor: Colors.white,
        leading: const Icon(Icons.person_add_disabled_outlined),
        title: const Text('Secretary Control Panel'),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: _list.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(_list[index]),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    child: TextFormField(
                      validator: _validateField,
                      controller: _controllerEntry,
                      decoration: const InputDecoration(
                        labelText: 'New Announcement',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
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
                      style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.cyan),
                        foregroundColor: WidgetStatePropertyAll(Colors.white),
                      ),
                      onPressed: _addItem,
                      child: const Text('Add Announcement'),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
