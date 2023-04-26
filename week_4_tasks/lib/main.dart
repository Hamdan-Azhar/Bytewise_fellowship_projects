
import 'package:flutter/material.dart';
import 'package:emoji_app/constants/constant_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

Widget emojiDisplay(title, imagePath){           //We create a function called emojiDisplay that
                                                 // takes title and imagePath and displays the widgets
  return Container(
    color: lighterColor,
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            width: 100,
            height: 100,
          ),
          Text(
            title,
            style: const TextStyle(color: darkerColor),
          ),
        ],
      ),
    ),
  );
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _controller = PageController();          //This controller will control the PageView
  int currentPage=0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Emoji App',
            style: TextStyle(
              color: lighterColor
            ),
          ),
          backgroundColor: darkerColor,
        ),
        body: PageView(
          controller: _controller,
          physics: const NeverScrollableScrollPhysics(),
          children:[
            emojiDisplay( 'smile emoji','assets/smile.jpg'),    //We call EmojiDisplay here with
            emojiDisplay( 'sad emoji','assets/sad.jpg'),        //arguments to display content on
            emojiDisplay('angry emoji', 'assets/angry.jpg'),    // each page in PageView
            emojiDisplay('happy emoji', 'assets/happy.jpg')
          ]
        ),


        bottomNavigationBar: BottomAppBar(
          color: darkerColor,
          child:Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Flex(                                         //Flex is used to make sure that all
              direction: Axis.horizontal,                        //contents on the screen are distributed
              mainAxisAlignment: MainAxisAlignment.spaceBetween, //properly and the app is responsive
              children: [
                Flexible(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      if (currentPage > 0)
                        IconButton(                               //Buttons will be used to navigate
                          icon: const Icon(Icons.arrow_back_ios), //from one page to another.
                          onPressed: (){                          //'back' or backArrow button for
                            setState(() {                         //moving to previous page and 'next'
                              _controller.previousPage(           //or forwardArrow button to move to
                                  duration: const Duration(milliseconds: 300),  //next page
                                  curve: Curves.easeInOut);
                              currentPage--;
                            });
                          },
                          color: lighterColor,
                        ),
                      if(currentPage > 0)
                        TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: lighterColor,
                            textStyle: const TextStyle(fontSize: 24),
                          ),
                          onPressed: (){
                            setState(() {
                              _controller.previousPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut);
                              currentPage--;
                            });
                          },
                          child: const Text('Back'),
                        ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: SmoothPageIndicator(             //We create SmoothPageIndicator to
                    controller: _controller,              //create a dotted bar that represents
                    count: 4,                             //pages in PageView
                    effect: const WormEffect(
                        activeDotColor: Colors.black
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if(currentPage < 3)
                        TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: lighterColor,
                            textStyle: const TextStyle(fontSize: 24),
                          ),
                          onPressed: (){
                            setState(() {
                              _controller.nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut);
                              currentPage++;
                            });
                          },
                          child: const Text('Next'),
                        ),
                      if(currentPage < 3)
                        IconButton(
                          icon: const Icon(Icons.arrow_forward_ios),
                          onPressed: (){
                            setState(() {
                              _controller.nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut);
                              currentPage++;
                            });
                          },
                          color:lighterColor,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ),
      )
    );
  }
}
