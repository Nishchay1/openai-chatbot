import 'package:chatbot/services/openai_service.dart';
import 'package:chatbot/theme/button.dart';
import 'package:flutter/material.dart';
import 'package:chatbot/shared/animated_figure.dart';

class FigureScreenComponents extends StatefulWidget {
  final String description;

  final String figureImagePath;

  final String figureName;

  const FigureScreenComponents(
      {super.key,
      required this.description,
      required this.figureImagePath,
      required this.figureName});

  @override
  State<FigureScreenComponents> createState() => _FigureScreenComponentsState();
}

class _FigureScreenComponentsState extends State<FigureScreenComponents>
    with SingleTickerProviderStateMixin {
  late final OpenAIService openAIService;
  final TextEditingController _messageController = TextEditingController();

  String? generatedContent;

  final animationDuration = Duration(milliseconds: 500);

  bool figureVisible = true;
  bool maintextVisible = true;
  bool messageInputVisible = true;

  late AnimationController _controller;

  int _animationCount = 0;

  final FocusNode messageFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    openAIService = OpenAIService(description: widget.description);

    _controller =
        AnimationController(duration: Duration(milliseconds: 800), vsync: this);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _animationCount++;
        if (_animationCount < 3) {
          _controller.forward();
        } else if (generatedContent == null) {
          _controller
              .forward(); // Continue looping if generatedContent is still null after fake loops
        } else {
          setState(() {
            showMainText();
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startAnimation() {
    _animationCount = 0;
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Ask ${widget.figureName}"),
          centerTitle: true,
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 24),
        ),
        body: Stack(
          children: <Widget>[
            IgnorePointer(
              ignoring: !figureVisible,
              child: AnimatedOpacity(
                opacity: figureVisible ? 1.0 : 0.0,
                duration: animationDuration,
                child: AnimatedFigure(
                  controller: _controller,
                  imagePath: widget.figureImagePath,
                ),
              ),
            ),
            IgnorePointer(
              ignoring: !maintextVisible,
              child: AnimatedOpacity(
                opacity: maintextVisible ? 1.0 : 0.0,
                duration: animationDuration,
                child: _maintext(),
              ),
            ),
            IgnorePointer(
              ignoring: !messageInputVisible,
              child: AnimatedOpacity(
                opacity: messageInputVisible ? 1.0 : 0.0,
                duration: animationDuration,
                child: _messageInput(),
              ),
            ),
          ],
        ));
  }

  Widget _maintext() {
    return Container(
        color: Colors.white,
        child: SafeArea(
          child: Center(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                        child: RichText(
                      text: TextSpan(
                          text: generatedContent == null
                              ? ""
                              : generatedContent!,
                          style: TextStyle(color: Colors.black, fontSize: 28)),
                    )),
                  ),
                  ElevatedButton(
                    style: primaryButton,
                      onPressed: showMessageInput,
                      child: Text(
                          style: TextStyle(fontSize: 24),
                          "Ask"))
                ],
              ),
            ),
          )),
        ));
  }

  Widget _messageInput() {
    return Container(
        color: Colors.white,
        child: SafeArea(
          child: Center(
              child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            child: Align(
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  Expanded(
                    child: TextField(
                      autofocus: true,
                      maxLength: 150,
                      maxLines: null,
                      style: TextStyle(fontSize: 28),
                      focusNode: messageFocusNode,
                      controller: _messageController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Type your question...",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: ElevatedButton(
                      style: primaryButton,
                        onPressed: sendMsg,
                        child: Text("Send", style: TextStyle(fontSize: 18),)),
                  )
                ],
              ),
            ),
          )),
        ));
  }

  void showMessageInput() {
    setState(() => messageInputVisible = true);
    setState(() => maintextVisible = false);
    setState(() => figureVisible = false);
    FocusScope.of(context).requestFocus(messageFocusNode);
  }

  void showMainText() {
    setState(() => messageInputVisible = false);
    setState(() => maintextVisible = true);
    setState(() => figureVisible = false);
  }

  void showFigure() {
    setState(() => messageInputVisible = false);
    setState(() => maintextVisible = false);
    setState(() => figureVisible = true);
  }

  void sendMsg() async {
    generatedContent = null;
    FocusScope.of(context).unfocus();
    showFigure();
    _startAnimation();
    String msg = _messageController.text;
    _messageController.clear();
    generatedContent = await openAIService.chatGPTAPI(msg);
    setState(() {});
  }
}
