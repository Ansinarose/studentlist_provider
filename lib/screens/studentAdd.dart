import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:studentlist_provider/model/studentmodel.dart';
import 'package:studentlist_provider/provider/provideDemo.dart';
import 'package:studentlist_provider/screens/home.dart';

class StudentAdd extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  
  StudentAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text('Add student'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Container(
               color: Colors.lightBlue,
              child: custmtestfield(
                  controller: nameController,
                  keybordtype: TextInputType.name,
                  labeltext: 'Name'),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              color: Colors.lightBlue,
              child: custmtestfield(
                  controller: ageController,
                  keybordtype: TextInputType.number,
                  labeltext: 'Age'),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              
              color: Colors.lightBlue,
              child: custmtestfield(
                  controller: countryController,
                  keybordtype: TextInputType.name,
                  labeltext: 'country'),
            ),
            SizedBox(height: 30,),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.lightBlue)
              ),
                onPressed: () {
                  // You can call your add function here or perform the logic directly
                  add(context);
                  Navigator.of(context).pop();
                },
                child: const Text('Save',
                style: TextStyle(
                  color: Colors.black
                ),))
          ],
        ),
      ),
    );
  }

  void add(BuildContext context) {
    // You can implement your logic here
    if (nameController.text.isEmpty ||
        ageController.text.isEmpty ||
        countryController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.red,
          content: Text('Plese fille all details')));
    }
    final value = student(
        name: nameController.text,
        age: ageController.text,
        country: countryController.text);

    context.read<ProviderDemo>().addToPr(value);
    nameController.clear();
    ageController.clear();
    countryController.clear();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.green,
        content: Text(
          '${value.name} details added',
          style: TextStyle(fontWeight: FontWeight.w600),
        )));
  }
}