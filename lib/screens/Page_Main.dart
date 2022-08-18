import 'dart:io';

import 'package:flutter/material.dart';

import '../Globals/Contact_model.dart';
import '../app_theme_page.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({Key? key}) : super(key: key);

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  List Allcontainer = [];
  bool iconBool = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: (AppTheme.isDark) ? AppTheme.Darktheme : AppTheme.lightTheme,
      darkTheme: AppTheme.Darktheme,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            "Contacts",
          ),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  AppTheme.isDark = !AppTheme.isDark;
                  iconBool = !iconBool;
                });
              },
              icon: Icon(iconBool ? Icons.nights_stay : Icons.wb_sunny),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed('add_contact_page');
          },
          child: const Icon(
            Icons.add,
            size: 30,
          ),
        ),
        body: Container(
          alignment: Alignment.center,
          child: (Global.allcontacts.isEmpty)
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Image(
                        image:
                            AssetImage("assets/images/open-cardboard-box.png"),
                        width: 200,
                        color: Colors.brown),
                    Text(
                      "You have no contacts yet",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.grey,
                      ),
                    )
                  ],
                )
              : ListView.builder(
                  itemBuilder: (Context, i) {
                    return ListTile(
                      onTap: () {
                        Navigator.of(context).pushNamed('details_page_info',
                            arguments: Global.allcontacts[i]);
                      },
                      leading: CircleAvatar(
                        backgroundImage: (Global.allcontacts[i].image != null)
                            ? FileImage(Global.allcontacts[i].image as File)
                            : null,
                      ),
                      title: Text(
                          "${Global.allcontacts[i].first_name} ${Global.allcontacts[i].last_name}",
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                      subtitle: Text("+91 ${Global.allcontacts[i].phone_num}"),
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.phone_rounded,
                          color: Colors.black,
                        ),
                        onPressed: () {},
                      ),
                    );
                  },
                  itemCount: Global.allcontacts.length,
                ),
        ),
      ),
    );
  }
}
