import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

import '../Globals/Contact_model.dart';
import '../app_theme_page.dart';

class Details_page extends StatefulWidget {
  const Details_page({Key? key}) : super(key: key);

  @override
  State<Details_page> createState() => _Details_pageState();
}

class _Details_pageState extends State<Details_page> {
  bool iconBool = false;

  @override
  Widget build(BuildContext context) {
    // theme: (AppTheme.isDark) ? AppTheme.Darktheme : AppTheme.lightTheme,
    dynamic res = ModalRoute.of(context)!.settings.arguments;
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
        body: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              const Spacer(flex: 2),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Spacer(flex: 22),
                  const CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.red,
                  ),
                  const Spacer(flex: 6),
                  IconButton(
                    onPressed: () {
                      Global.allcontacts.remove(res);

                      Navigator.of(context)
                          .pushNamedAndRemoveUntil('/', (route) => false);
                    },
                    icon: const Icon(Icons.delete),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed("update_page", arguments: res);
                    },
                    icon: const Icon(Icons.edit),
                  ),
                  const Spacer(flex: 1),
                ],
              ),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  "${res.first_name} ${res.last_name}",
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 70),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      "+91 ${res.phone_num}",
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              const Divider(
                color: Colors.black,
                indent: 20,
                endIndent: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    heroTag: null,
                    mini: true,
                    onPressed: () async {
                      Uri url = Uri.parse("tel: +91${res.phone_num}");

                      if (await canLaunchUrl(url)) {
                        await launchUrl(url);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Can't be lauched...."),
                            backgroundColor: Colors.redAccent,
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      }
                    },
                    backgroundColor: Colors.green,
                    child: const Icon(Icons.call),
                  ),
                  FloatingActionButton(
                    heroTag: null,
                    onPressed: () async {
                      Uri url = Uri.parse("sms:${res.phone_num}");

                      if (await canLaunchUrl(url)) {
                        await launchUrl(url);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Can't be lauched...."),
                            backgroundColor: Colors.redAccent,
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      }
                    },
                    mini: true,
                    backgroundColor: Colors.amberAccent,
                    child: Icon(Icons.message),
                  ),
                  FloatingActionButton(
                    heroTag: null,
                    mini: true,
                    onPressed: () async {
                      Uri url = Uri.parse(
                          "mailto:${res.email}?subject=Demo&body=Hello//Hii");

                      if (await canLaunchUrl(url)) {
                        await launchUrl(url);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Can't be lauched...."),
                            backgroundColor: Colors.redAccent,
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      }
                    },
                    backgroundColor: Colors.lightBlue,
                    child: Icon(Icons.email),
                  ),
                  FloatingActionButton(
                    heroTag: null,
                    mini: true,
                    onPressed: () async {
                      Uri url = Uri.parse(
                        "https://pub.dev/packages/url_launcher",
                      );

                      if (await canLaunchUrl(url)) {
                        await launchUrl(url);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Can't be lauched...."),
                            backgroundColor: Colors.redAccent,
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      }
                    },
                    backgroundColor: Colors.deepOrangeAccent,
                    child: Icon(Icons.web),
                  ),
                ],
              ),
              SizedBox(height: 10),
              const Divider(
                color: Colors.black,
                indent: 20,
                endIndent: 20,
              ),
              const Spacer(flex: 7),
            ],
          ),
        ),
      ),
    );
  }
}
