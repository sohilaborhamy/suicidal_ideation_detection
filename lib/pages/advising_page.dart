import 'package:flutter/material.dart';

class AdvisingPage extends StatelessWidget {
  const AdvisingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar: AppBar(
        title: Text('Advising Page'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image(
                image: AssetImage('images/thoughtsi.png'),
              ),
              SizedBox(height: 0),
              _buildTipsBox(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTipsBox(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 187, 152, 194),
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: EdgeInsets.all(20),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "SUPPORT AND GUIDIENCE",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "If you or someone you know is struggling with depression or suicidal thoughts, it's important to seek help and support. Here are some advice and resources.\n\n"
            "Talk to Someone: Reach out to a trusted friend, family member, or mental health professional. Talking about your feelings can help alleviate some of the burden you may be feeling.\n\n"
            "Hotlines and Helplines: There are many hotlines and helplines available that provide support for individuals experiencing mental health crises. In the United States, you can contact the National Suicide Prevention Lifeline at 1-800-273-TALK (1-800-273-8255). Many countries have similar hotlines available..\n\n"
            "Seek Professional Help: Consider reaching out to a therapist, counselor, or psychologist who can provide professional support and guidance. They can help you develop coping strategies and provide treatment options tailored to your needs.\n\n"
            "Self-Care: Take care of yourself by practicing self-care activities that promote relaxation and well-being. This could include exercise, meditation, mindfulness, hobbies, or spending time in nature.\n\n"
            "Create a Safety Plan: If you're experiencing suicidal thoughts, create a safety plan with the help of a mental health professional. Identify warning signs, coping strategies, and emergency contacts.\n\n"
            "Know That You're Not Alone: Remember that many people struggle with depression and suicidal thoughts, and it's okay to ask for help. You are not alone, and there are people who care about you and want to support you through difficult times.",
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
