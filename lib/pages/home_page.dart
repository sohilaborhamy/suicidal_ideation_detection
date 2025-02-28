import 'package:detection_app/pages/advising_page.dart';
import 'package:detection_app/pages/chat_page.dart';
import 'package:detection_app/pages/contact_page.dart';
import 'package:detection_app/pages/tweet_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  static String id = 'MyHomePage';

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 60),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                  title: Text(
                    'Hi',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(color: Colors.white),
                  ),
                  subtitle: Text(
                    'Don\'t  let any stumble in the road be the end of the journey. It\'s one journey, but there are many roads',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.white54),
                  ),
                  trailing: const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('images/thoughtsi.png'),
                  ),
                ),
                const SizedBox(height: 30)
              ],
            ),
          ),
          Container(
            color: Theme.of(context).primaryColor,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(120),
                ),
              ),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 40,
                mainAxisSpacing: 30,
                children: [
                  itemDashboard(
                    'Tweet',
                    CupertinoIcons.graph_circle,
                    Color.fromARGB(255, 47, 73, 190),
                    () {
                      // Navigate to the new page when the "Tweet" item is pressed
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TweetPage()),
                      );
                    },
                  ),
                  itemDashboard(
                    'Chat Me',
                    CupertinoIcons.bolt_horizontal_circle,
                    Colors.purple,
                    () {
                      // Navigate to the new page when the "Chat Me" item is pressed
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ChatPage()),
                      );
                    },
                  ),
                  itemDashboard(
                    'Advising',
                    CupertinoIcons.question_circle,
                    Colors.blue,
                    () {
                      // Navigate to the new page when the "About" item is pressed
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AdvisingPage()),
                      );
                    },
                  ),
                  itemDashboard(
                    'Contact',
                    CupertinoIcons.phone,
                    Color.fromARGB(255, 211, 133, 198),
                    () {
                      // Navigate to the new page when the "Contact" item is pressed
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ContactPage()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          // "Sign Out" button
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: ElevatedButton(
              onPressed: () {
                // Navigate back to the sign-in page
                Navigator.pop(context);
              },
              child: Text('Sign Out'),
            ),
          ),
        ],
      ),
    );
  }

  Widget itemDashboard(
      String title, IconData iconData, Color background, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap, // Call the provided callback when the item is tapped
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 5),
              color: Theme.of(context).primaryColor.withOpacity(.2),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: background,
                shape: BoxShape.circle,
              ),
              child: Icon(iconData, color: Colors.white),
            ),
            const SizedBox(height: 8),
            Text(
              title.toUpperCase(),
              style: Theme.of(context).textTheme.titleMedium,
            )
          ],
        ),
      ),
    );
  }
}
