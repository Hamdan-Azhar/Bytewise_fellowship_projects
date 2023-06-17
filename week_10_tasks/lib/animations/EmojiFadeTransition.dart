
import 'package:flutter/material.dart';
import 'package:emoji_app/constants/constant_colors.dart';

//class created for EmojiFadeTransition animation for widgets
class EmojiFadeTransition extends StatefulWidget {
  final String title;
  final String imagePath;
  final Duration duration;

  const EmojiFadeTransition({
    Key? key,
    required this.title,
    required this.imagePath,
    required this.duration,
  }) : super(key: key);

  @override
  EmojiFadeTransitionState createState() => EmojiFadeTransitionState();
}

class EmojiFadeTransitionState extends State<EmojiFadeTransition>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: widget.duration,
  )
    ..repeat(reverse: true);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: lighterColor,
      child: Center(
        child: FadeTransition(
          opacity: CurvedAnimation(
            parent: _controller,
            curve: Curves.easeIn,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  widget.imagePath,
                  width: 100,
                  height: 100,
                ),
                Text(
                  widget.title,
                  style: const TextStyle(
                      color: darkerColor
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
