import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import '../router/app_router.dart';

class Request extends StatelessWidget {
  Request({Key? key, required this.tripname, required this.name})
      : super(key: key);
  final String tripname;
  final String name;

  var nameController = TextEditingController();
  var numberController = TextEditingController();
  var notesController = TextEditingController();
  var guestsController = TextEditingController();
  var formkey = GlobalKey<FormState>();
  var date=DateFormat.yMd().format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tripname),
      ),
      body: Form(
          key: formkey,
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                      child: Text(
                    name,
                    style: TextStyle(fontSize: 21.sp),
                  )),
                  const SizedBox(
                    height: 25.0,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Name must not be empty';
                      }
                      return null;
                    },
                    controller: nameController,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty || value.length != 11) {
                          return 'Enter a valid number';
                      }
                      return null;
                    },
                    controller: numberController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'phone',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Number Of guests must not be empty';
                      }
                      return null;
                    },
                    controller: guestsController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Number Of guests',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  TextFormField(
                    controller: notesController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      labelText: 'Special Notes',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width/2,
                    child: MaterialButton(
                      onPressed: () {



                        if (formkey.currentState!.validate()) {
                          final databaseReference =
                              FirebaseFirestore.instance.collection('requests');

                          databaseReference.doc(name).collection('req').add({
                            'count': guestsController.text,
                            'mobile': numberController.text,
                            'name': nameController.text,
                            'notes': notesController.text,
                            'title': name,
                            'trip': tripname,
                            'status': 'new',
                            'date': date

                          });

                          Navigator.pushNamed(context, Routes.homeLayout);
                        }
                      },
                      color: Colors.amber,
                      child: Text(
                        'Send Request',
                        style:
                            TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
