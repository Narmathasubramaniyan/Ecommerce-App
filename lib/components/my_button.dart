import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final void Function()? onTap;
  final Widget child;

  const MyButton({super.key, required this.onTap, required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              //bottom right (+) shodow is darker
              color: Theme.of(context).colorScheme.tertiary,
              offset: const Offset(5, 5),
              blurRadius: 15,
            ),
            BoxShadow(
              //top left (-) shodow is lighter
              color: Theme.of(context).colorScheme.secondary,
              offset: const Offset(-4, -4),
              blurRadius: 15,
            ),
          ],
        ),
        padding: const EdgeInsets.all(30),
        child: child,
      ),
    );
  }
}
