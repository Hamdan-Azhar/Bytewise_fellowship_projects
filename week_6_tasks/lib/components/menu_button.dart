import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/controllers/simple_hidden_drawer_controller.dart';


class MenuButton extends StatelessWidget {
  final bool isOpen;
  final VoidCallback press;
  final SimpleHiddenDrawerController controller;

  const MenuButton({
    Key? key,
    required this.isOpen,
    required this.press,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(left: 16),
        height: 40,
        width: 40,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 3),
              blurRadius: 8,
            ),
          ],
        ),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (child, animation) {
            return ScaleTransition(
              scale: animation,
              child: child,
            );
          },
          child: IconButton(
            key: ValueKey<bool>(isOpen),
            icon: isOpen ? const Icon(Icons.menu) : const Icon(Icons.close),
            onPressed: () {
              press();
              controller.toggle();
            },
          ),
        ),
      ),
    );
  }
}
