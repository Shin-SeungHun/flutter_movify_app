import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return const SizedBox(
          child: Stack(
            children: [
              RiveAnimation.asset(
                'assets/rive/background.riv',
                fit: BoxFit.fill,
              ),
            ],
          ),
        );
      },
    );
  }
}
