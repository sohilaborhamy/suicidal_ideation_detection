import 'package:detection_app/helper/classify_tweet.dart';
import 'package:flutter/material.dart';

class TweetPage extends StatefulWidget {
  static String id = 'TweetPage';

  @override
  _TweetPageState createState() => _TweetPageState();
}

class _TweetPageState extends State<TweetPage> {
  String tweet = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 245, 244, 248),
        title: Text(
          'Tweet Page',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                onChanged: (value) {
                  setState(() {
                    tweet = value;
                  });
                },
                decoration:  InputDecoration(
                  labelText: 'Enter your tweet',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () async{
                  final result = await ClassifyTweet.classifyTweet(tweet);
                  showTweetClassificationResult(result);
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> showTweetClassificationResult(String tweetText) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Tweet Result'),
          content: Text(tweetText),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
