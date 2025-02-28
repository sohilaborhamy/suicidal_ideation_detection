import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:dash_chat_2/dash_chat_2.dart';

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:openai/openai.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});
  static String id = 'ChatPage';

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final ChatUser _user = ChatUser(id: '1', firstName: 'Sohila'); // User object
  final ChatUser _bot = ChatUser(id: '2', firstName: 'MentalHealth'); // Bot object
  final List<ChatMessage> messages = []; // List to store chat messages
  late OpenAI _chatGpt; // OpenAI instance

  @override
  void initState() {
    super.initState();
    _initializeChatGpt();
  }

  /// Initialize the OpenAI instance with proper error handling
  void _initializeChatGpt() {
    try {
      _chatGpt = OpenAI.instance.build(
        token: 'sk-proj-IHAfTrAZIdDmNnr62am4T3BlbkFJbBSxOoK3cJ26tDbSqxrP',
        baseOption: HttpSetup(
          receiveTimeout: const Duration(seconds: 20), // Timeout setting
        ),
      );
    } catch (e) {
      debugPrint('Error initializing OpenAI: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mental Health'),
      ),
      body: DashChat(
        currentUser: _user,
        onSend: onSend,
        messages: messages,
      ),
    );
  }

  /// Handles sending messages and retrieving responses
  void onSend(ChatMessage message) async {
    setState(() {
      messages.insert(0, message); // Add user message to the chat
    });

    try {
      // Build the chat history for API request
      List<Map<String, dynamic>> messagesHistory = messages.reversed.map((msg) {
        return {
          'role': msg.user.id == _user.id ? 'user' : 'assistant',
          'content': msg.text,
        };
      }).toList();

      // Create the ChatGPT request
      var request = ChatCompleteText(
        model: GptTurbo0301ChatModel(),
        messages: messagesHistory,
        maxToken: 200,
      );

      // Send the request to OpenAI
      var response = await _chatGpt.onChatCompletion(request: request);

      // Process the response
      if (response != null && response.choices.isNotEmpty) {
        for (var element in response.choices) {
          if (element.message != null) {
            setState(() {
              messages.insert(
                0,
                ChatMessage(
                  text: element.message!.content,
                  user: _bot,
                  createdAt: DateTime.now(),
                ),
              );
            });
          }
        }
      }
    } catch (e) {
      // Handle errors gracefully
      debugPrint('Error in onSend: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred: ${e.toString()}'),
        ),
      );
    }
  }
}

