import 'package:chatbot/shared/figure_select_card.dart';
import 'package:chatbot/shared/figure_select_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var figureName = [
    'Buddha',
    'Aristotle',
    'Confucius',
    'Abraham Lincoln',
    'Julius Caesar',
    'Marie Curie',
    'Martin Luther King Jr.'
  ];

  var figureInfo = [
    'Siddhartha Gautama, most commonly referred to as the Buddha, was a wandering ascetic and religious teacher who lived in South Asia, during the 6th or 5th century BCE and founded Buddhism. According to Buddhist legends, he was born in Lumbini, in what is now Nepal, to royal parents of the Shakya clan, but renounced his home life to live as a wandering ascetic. After leading a life of mendicancy, asceticism, and meditation, he attained nirvana at Bodh Gaya in what is now India. \n\n- Wikipedia',
    'Aristotle was an Ancient Greek philosopher and polymath. His writings cover a broad range of subjects spanning the natural sciences, philosophy, linguistics, economics, politics, psychology, and the arts. As the founder of the Peripatetic school of philosophy in the Lyceum in Athens, he began the wider Aristotelian tradition that followed, which set the groundwork for the development of modern science. \n\n- Wikipedia',
    'Confucius, born Kong Qiu (孔丘), was a Chinese philosopher of the Spring and Autumn period who is traditionally considered the paragon of Chinese sages. Much of the shared cultural heritage of the Sinosphere originates in the philosophy and teachings of Confucius. His philosophical teachings, called Confucianism, emphasized personal and governmental morality, harmonious social relationships, righteousness, kindness, sincerity, and a ruler\'s responsibilities to lead by virtue. \n\n- Wikipedia',
    'Abraham Lincoln was the 16th president of the United States, serving from 1861 until his assassination in 1865. He led the United States through the American Civil War, defending the nation as a constitutional union, defeating the Confederacy, playing a major role in the abolition of slavery, expanding the power of the federal government, and modernizing the U.S. economy. \n\n - Wikipedia',
    'Gaius Julius Caesar was a Roman general and statesman. A member of the First Triumvirate, Caesar led the Roman armies in the Gallic Wars before defeating his political rival Pompey in a civil war, and subsequently became dictator from 49 BC until his assassination in 44 BC. He played a critical role in the events that led to the demise of the Roman Republic and the rise of the Roman Empire. \n\n- Wikipedia',
    'Maria Salomea Skłodowska-Curie, known simply as Marie Curie, was a Polish and naturalised-French physicist and chemist who conducted pioneering research on radioactivity. She was the first woman to win a Nobel Prize, the first person to win a Nobel Prize twice, and the only person to win a Nobel Prize in two scientific fields. Her husband, Pierre Curie, was a co-winner of her first Nobel Prize, making them the first married couple to win the Nobel Prize and launching the Curie family legacy of five Nobel Prizes. \n\n- Wikipedia',
    'Martin Luther King Jr. was an American Baptist minister, activist, and political philosopher who was one of the most prominent leaders in the civil rights movement from 1955 until his assassination in 1968. King advanced civil rights for people of color in the United States through the use of nonviolent resistance and nonviolent civil disobedience against Jim Crow laws and other forms of legalized discrimination. \n\n- Wikipedia',
  ];

  var heroTagList = [
    'buddha',
    'aristotle',
    'confucius',
    'lincoln',
    'caesar',
    'curie',
    'mlk'
  ];
  var screenList = [
    '/buddha_screen',
    '/aristotle_screen',
    '/confucius_screen',
    '/lincoln_screen',
    '/caesar_screen',
    '/curie_screen',
    '/mlk_screen'
  ];
  var imageList = [
    'assets/images/buddha.png',
    'assets/images/aristotle.png',
    'assets/images/confucius.png',
    'assets/images/lincoln.png',
    'assets/images/caesar.png',
    'assets/images/curie.png',
    'assets/images/mlk.png'
  ];

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () => showDisclaimer());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Figure"),
        centerTitle: true,
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 24),
      ),
      body: SafeArea(
        child: PageView.builder(
            controller: PageController(viewportFraction: 0.65),
            pageSnapping: false,
            scrollDirection: Axis.vertical,
            itemCount: imageList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => FigureSelectScreen(
                              heroTag: heroTagList[index],
                              imagePath: imageList[index],
                              screenName: screenList[index],
                              figureName: figureName[index],
                              figureInfo: figureInfo[index],
                            )));
                  },
                  child: Center(
                    child: FigureSelectCard(
                        imagePath: imageList[index],
                        heroTag: heroTagList[index]),
                  ));
            }),
      ),
    );
  }

  void showDisclaimer() {
    showDialog(
      barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Disclaimer"),
              content: SingleChildScrollView(
                child: Text(style: TextStyle(fontSize: 18),
                    "The following content has been automatically generated by an AI system and should be used for informational purposes only. We cannot guarantee the accuracy, completeness, or timeliness of the information provided. Any actions taken based on this content are at your own risk."),
              ),
              actions: [TextButton(onPressed: ()=>Navigator.of(context).pop(), child: Text(style: TextStyle(fontSize: 18, color: Colors.deepPurpleAccent), "I Understand")),TextButton(onPressed: ()=>SystemChannels.platform.invokeMethod('SystemNavigator.pop'), child: Text(style: TextStyle(fontSize: 18, color: Colors.deepPurpleAccent), "Quit"))],
            ));
  }
}
