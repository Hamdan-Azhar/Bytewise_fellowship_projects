import 'package:flutter/material.dart';
import 'package:emoji_app/constants/constant_colors.dart';

//class created for EmojiScaleTransition animation for widgets
class EmojiScaleTransition extends StatefulWidget {
  final String title;
  final String imagePath;
  final Duration duration;

  const EmojiScaleTransition({
    Key? key,
    required this.title,
    required this.imagePath,
    required this.duration,
  }) : super(key: key);

  @override
  EmojiScaleTransitionState createState() => EmojiScaleTransitionState();
}

class EmojiScaleTransitionState extends State<EmojiScaleTransition>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: widget.duration,
  )
    ..repeat(reverse: true);

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

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
        child: ScaleTransition(
          scale:_animation,
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

