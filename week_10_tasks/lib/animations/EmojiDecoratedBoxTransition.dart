
import 'package:flutter/material.dart';
import 'package:emoji_app/constants/constant_colors.dart';

//class created for DecoratedBoxTransition animation for widgets
class EmojiDecoratedBoxTransition extends StatefulWidget {
  final String title;
  final String imagePath;
  final Duration duration;

  const EmojiDecoratedBoxTransition({
    Key? key,
    required this.title,
    required this.imagePath,
    required this.duration
  }) : super(key: key);

  @override
  EmojiDecoratedBoxTransitionState createState() => EmojiDecoratedBoxTransitionState();
}

class EmojiDecoratedBoxTransitionState extends State<EmojiDecoratedBoxTransition>
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

  final DecorationTween decorationTween = DecorationTween(
    begin: BoxDecoration(
      color: darkerColor,
      border: Border.all(style: BorderStyle.none),
      borderRadius: BorderRadius.circular(60.0),
    ),
    end: BoxDecoration(
      color: lighterColor,
      border: Border.all(
        style: BorderStyle.none,
      ),
      borderRadius: BorderRadius.zero,
    ),
  );

  final ColorTween textTween = ColorTween(
      begin: lighterColor, end: darkerColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: lighterColor,
      child: Center(
        child: DecoratedBoxTransition(
          decoration: decorationTween.animate(_controller),
          child: SizedBox(
            height: 180,
            width: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  widget.imagePath,
                  width: 100,
                  height: 100,
                ),
                AnimatedBuilder(
                  animation: _controller,
                  builder: (BuildContext context, Widget? child) {
                    return Text(
                      widget.title,
                      style: TextStyle(
                        color: textTween.animate(_controller).value,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

