// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class BouncingButton extends StatefulWidget {
  final Widget child;
  final VoidCallback? onPress;
  final HitTestBehavior? behavior;
  final bool? isNotActive;

  const BouncingButton(
      {super.key,
      required this.child,
      required this.onPress,
      this.behavior,
      this.isNotActive});

  @override
  _BouncingButtonState createState() => _BouncingButtonState();
}

class _BouncingButtonState extends State<BouncingButton>
    with SingleTickerProviderStateMixin {
  double? _scale;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;
    return GestureDetector(
      behavior: widget.behavior,
      onTapDown: widget.isNotActive == true
          ? null
          : (TapDownDetails details) {
              _controller.forward();
            },
      onTapUp: widget.isNotActive == true
          ? null
          : (TapUpDetails details) async {
              await Future.delayed(const Duration(milliseconds: 80));
              _controller.reverse();
              if (widget.onPress != null) widget.onPress!();
            },
      onTapCancel: widget.isNotActive == true
          ? null
          : () async {
              await Future.delayed(const Duration(milliseconds: 80));
              _controller.reverse();
            },
      child: Transform.scale(
        scale: _scale!,
        child: widget.child,
      ),
    );
  }
}
