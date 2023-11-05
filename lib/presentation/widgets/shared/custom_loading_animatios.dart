import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CustomLoadingAnimation extends StatelessWidget {
  const CustomLoadingAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      body: Center(
        child: LoadingAnimationWidget.hexagonDots(
          color: Colors.white,
          size: 50,
        ),
      ),
      backgroundColor: colors.primary,
    );
  }
}
