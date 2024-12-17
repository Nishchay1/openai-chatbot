import 'package:chatbot/services/openai_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final OpenaiService openaiService = OpenaiService();
  final TextEditingController _messageController = TextEditingController();

  String? generatedContent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ask Buddha"),
        centerTitle: true,
      ),
      body: Column(children: [
        Expanded(
          child: 
            SingleChildScrollView(
              child: Text(
                generatedContent==null ? "What is it that you seek?" : generatedContent!, 
                style: TextStyle(fontSize: 20),
              ),
            )
        ),
        _messageInput(),
      ],)
    );
  }

  Widget _messageInput(){
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 24,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                hintText: "Enter message...",
              ),
            ),
          ),
          IconButton(
            onPressed: () async {
              generatedContent = await openaiService.chatGPTAPI(_messageController.text);
              _messageController.clear();
              setState(() {});
            }, icon: Icon(Icons.send)
          )
        ],
      ),
    );
  }

}