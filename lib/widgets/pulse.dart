import 'package:flutter/material.dart';

class Pulse extends StatefulWidget {
  final Widget child;

  Pulse({required this.child});

  @override
  _PulseState createState() => _PulseState();
}

class _PulseState extends State<Pulse> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) {
        return Transform.scale(
          scale: 0.6 + 0.4 * (_controller.value % 0.5),
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
