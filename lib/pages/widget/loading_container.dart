import 'package:flutter/material.dart';

class LoadingContainer extends StatelessWidget {
  final bool isLoading;
  final Widget child;
  final Duration delay;

  const LoadingContainer({Key? key, required this.isLoading, required this.child, required this.delay})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        child,
        Positioned(
          top: 0,
          bottom: 0,
          left: 0,
          right: 0,
          child: StreamBuilder(
            stream: Future.delayed(delay).asStream(),
            builder: (context, snapshot) => Visibility(
              visible: (isLoading) ||
                  (snapshot.connectionState == ConnectionState.waiting),
              child: _createCircularLoading(),
            ),
          ),
        )
      ],
    );
  }

  Widget _createCircularLoading() => Container(
        alignment: Alignment.center,
        color: Colors.white.withOpacity(0.8),
        child:
            FittedBox(fit: BoxFit.contain, child: CircularProgressIndicator()),
      );
}
