import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../constants/constant_colors.dart';


//This class consists of the SmoothPageIndicator and buttons
//for functioning of HomePage

class HomePageBottom extends StatefulWidget {
  const HomePageBottom({Key? key,
    required this.controller}) : super(key: key);

  final PageController controller;

  @override
  State<HomePageBottom> createState() => _HomePageBottomState();
}

class _HomePageBottomState extends State<HomePageBottom> {

  int currentPage=0;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
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
                      IconButton(                                   //Buttons will be used to navigate
                        icon: const Icon(Icons.arrow_back_ios),      //from one page to another.
                        onPressed: (){                               //'back' or backArrow button for
                          setState(() {                              //moving to previous page and 'next'
                            widget.controller.previousPage(                //or forwardArrow button to move to
                                duration: const Duration(milliseconds: 300), //next page
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
                            widget.controller.previousPage(
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
                child: SmoothPageIndicator(                    //We create SmoothPageIndicator to
                  controller: widget.controller,                     //create a dotted bar that represents
                  count: 4,                                     //pages in PageView
                  effect: const WormEffect(
                      activeDotColor: darkestColor
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
                            widget.controller.nextPage(
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
                            widget.controller.nextPage(
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
    );
  }
}
