import 'package:untitled1/app_colors_page.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../Globals/Contact_model.dart';

class Contact_Page extends StatefulWidget {
  const Contact_Page({Key? key}) : super(key: key);

  @override
  State<Contact_Page> createState() => _Contact_PageState();
}

class _Contact_PageState extends State<Contact_Page> {
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        title: const Text("Add"),
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
                setState(() {
                  Global.allcontacts.add(c);
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
                        backgroundImage: (Global.image != null)
                            ? FileImage(Global.image!)
                            : null,
                        child: (Global.image != null)
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
                    return "Enter your First Name....";
                  }
                  return null;
                },
                onSaved: (val) {
                  setState(() {
                    Global.Firstname = val;
                  });
                },
                controller: Firstnamecontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              Text("Last Name", style: Mystyle),
              const SizedBox(height: 10),
              TextFormField(
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Enter your Last Name....";
                  }
                  return null;
                },
                onSaved: (val) {
                  setState(() {
                    Global.Lastname = val;
                  });
                },
                controller: Lastnamecontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              Text("Phone number", style: Mystyle),
              const SizedBox(height: 10),
              TextFormField(
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Enter your Phone Number....";
                  }
                  return null;
                },
                onSaved: (val) {
                  setState(() {
                    Global.phone = val;
                  });
                },
                controller: Phonecontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              Text("Email", style: Mystyle),
              const SizedBox(height: 10),
              TextFormField(
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Enter your Email....";
                  }
                  return null;
                },
                onSaved: (val) {
                  setState(() {
                    Global.Email = val;
                  });
                },
                controller: Emailcontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
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
