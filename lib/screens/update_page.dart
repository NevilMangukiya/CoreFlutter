import 'package:untitled1/app_colors_page.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../Globals/Contact_model.dart';

class Update_Page extends StatefulWidget {
  const Update_Page({Key? key}) : super(key: key);

  @override
  State<Update_Page> createState() => _Update_PageState();
}

class _Update_PageState extends State<Update_Page> {
  final GlobalKey<FormState> contactFormKey = GlobalKey<FormState>();
  final TextEditingController Firstnamecontroller = TextEditingController();
  final TextEditingController Lastnamecontroller = TextEditingController();
  final TextEditingController Phonecontroller = TextEditingController();
  final TextEditingController Emailcontroller = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  TextStyle Mystyle =
      const TextStyle(fontSize: 20, fontWeight: FontWeight.w600);
  @override
  Widget build(BuildContext context) {
    dynamic res = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        title: const Text("Edit Contact"),
        actions: [
          IconButton(
            onPressed: () {
              if (contactFormKey.currentState!.validate()) {
                contactFormKey.currentState!.save();
                Contact c = Contact(
                  first_name: Global.Firstname,
                  last_name: Global.Lastname,
                  email: Global.Email,
                  phone_num: Global.phone,
                  image: Global.image,
                );
                int i = Global.allcontacts.indexOf(res);
                Global.allcontacts[i] = c;

                Navigator.of(context).pop();
                Firstnamecontroller.clear();
                Lastnamecontroller.clear();
                Phonecontroller.clear();
                Emailcontroller.clear();
                setState(() {
                  Global.Firstname = "";
                  Global.Lastname = "";
                  Global.phone = "";
                  Global.Email = "";
                });
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/', (route) => false);
              }
            },
            icon: const Icon(Icons.check),
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        alignment: Alignment.center,
        child: Form(
          key: contactFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              Container(
                alignment: Alignment.center,
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                        radius: 70,
                        backgroundImage: (res.image != null)
                            ? FileImage(res.image as File)
                            : null,
                        child: (res.image != null)
                            ? const Text("")
                            : const Text(
                                "Add",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )),
                    FloatingActionButton(
                      backgroundColor: Colors.lightBlue,
                      onPressed: () async {
                        XFile? pickedFile = await _picker.pickImage(
                            source: ImageSource.gallery);

                        setState(() {
                          Global.image = File(pickedFile!.path);
                          pickedFile = res.image;
                        });
                      },
                      mini: true,
                      child: const Icon(Icons.add),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              Text("First Name", style: Mystyle),
              const SizedBox(height: 10),
              TextFormField(
                validator: (val) {
                  if (val!.isEmpty) {
                    return null;
                  }
                },
                onSaved: (val) {
                  setState(() {
                    Global.Firstname = val;
                  });
                },
                controller: Firstnamecontroller,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: "${res.first_name}",
                ),
              ),
              const SizedBox(height: 10),
              Text("Last Name", style: Mystyle),
              const SizedBox(height: 10),
              TextFormField(
                validator: (val) {
                  if (val!.isEmpty) {
                    return null;
                  }
                },
                onSaved: (val) {
                  setState(() {
                    Global.Lastname = val;
                  });
                },
                controller: Lastnamecontroller,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: "${res.last_name}",
                ),
              ),
              const SizedBox(height: 10),
              Text("Phone number", style: Mystyle),
              const SizedBox(height: 10),
              TextFormField(
                validator: (val) {
                  if (val!.isEmpty) {
                    return null;
                  }
                },
                onSaved: (val) {
                  setState(() {
                    Global.phone = val;
                  });
                },
                controller: Phonecontroller,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: "${res.phone_num}",
                ),
              ),
              const SizedBox(height: 10),
              Text("Email", style: Mystyle),
              const SizedBox(height: 10),
              TextFormField(
                validator: (val) {
                  if (val!.isEmpty) {
                    return null;
                  }
                  return null;
                },
                onSaved: (val) {
                  setState(() {
                    Global.Email = val;
                  });
                },
                controller: Emailcontroller,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: "${res.email}",
                ),
              ),
              const Spacer(
                flex: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
