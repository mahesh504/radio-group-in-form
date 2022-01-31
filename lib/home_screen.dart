import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final formGlobalKey = GlobalKey<FormState>();
  var controller = TextEditingController();
  List<Map> data = [
    {
      "key": "a",
      "val": "one",
    },
    {"key": "b", "val": "two"},
    {"key": "c", "val": "three"},
    {"key": "d", "val": "four"}
  ];
  String? state = '-1';

  @override
  Widget build(BuildContext context) {
    var radioList = Column(
      children: data
          .map((e) => RadioListTile(
              selected: false,
              title: Text(e['val']),
              value: state!,
              groupValue: e['key'],
              onChanged: (val) {
                setState(() {
                  state = e['key'];
                  controller.text = e['val'];
                });
              }))
          .toList(),
    );
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: formGlobalKey,
            child: Column(
              children: [
                const Text('Select one option'),
                radioList,
                TextFormField(
                  controller: controller,
                  validator: (val) {
                    if (val!.isEmpty) return 'select one option';

                    return null;
                  },
                ),
                ElevatedButton(
                    onPressed: () {
                      formGlobalKey.currentState!.validate();
                    },
                    child: Text('Submit'))
              ],
            ),
          ),
        ));
  }
}
