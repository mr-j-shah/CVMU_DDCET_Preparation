import 'package:cvmuproject/models/flutter_topics_model.dart';
import 'package:cvmuproject/views/flashcard_screen.dart';
import 'package:cvmuproject/views/quiz_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    const Color bgColor = Color(0xFF4993FA);
    const Color bgColor3 = Color(0xFF5170FD);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 0, left: 15, right: 15),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.24),
                      blurRadius: 20.0,
                      offset: const Offset(0.0, 10.0),
                      spreadRadius: -10,
                      blurStyle: BlurStyle.outer,
                    )
                  ],
                ),
                child: Image.asset(
                  "assets/cvmu-logo.png",
                  height: 200,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "DDCET Preparation",
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  fontSize: 24,
                                  color: Color(0xff0065A7),
                                  fontWeight: FontWeight.w600,
                                ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.85,
                ),
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: flutterTopicsList.length,
                itemBuilder: (context, index) {
                  final topicsData = flutterTopicsList[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewCard(
                            typeOfTopic: topicsData.topicQuestions,
                            topicName: topicsData.topicName,
                          ),
                        ),
                      );
                      print(topicsData.topicName);
                    },
                    child: Card(
                      color: Color(0xff0084CA),
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              topicsData.topicIcon,
                              height: 60,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              topicsData.topicName,
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                  ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          // ignore: sort_child_properties_last
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    // Navigator.of(context).pushReplacement(
                    //     MaterialPageRoute(
                    //       builder: (context) => QuizScreen(
                    //         questionlenght: randomQuestions,
                    //         optionsList: randomOptions,
                    //         topicType: "Mock Test",
                    //       ),
                    //     ),
                    //   );
                  },
                  child: Text(
                    "Mock Test",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
                VerticalDivider(),
                InkWell(
                  onTap: () {
                    // Navigator.of(context).pushReplacement(
                    //     MaterialPageRoute(
                    //       builder: (context) => QuizScreen(
                    //         questionlenght: randomQuestions,
                    //         optionsList: randomOptions,
                    //         topicType: "Mock Test",
                    //       ),
                    //     ),
                    //   );
                  },
                  child: Text(
                    "Prep. Test",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ],
            ),
          ),
          height: MediaQuery.of(context).size.height * 0.070,
          // ignore: prefer_const_constructors
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Color(0xff0084CA),
            // ignore: prefer_const_constructors
            // gradient: LinearGradient(
            //   begin: Alignment.topCenter,
            //   end: Alignment.bottomCenter,
            //   // ignore: prefer_const_literals_to_create_immutables
            //   colors: [const Color(0xff234277), const Color(0xff0084ca)],
            // ),
          ),
        ),
      ),
    );
  }
}
