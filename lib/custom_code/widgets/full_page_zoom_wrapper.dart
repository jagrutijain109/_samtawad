// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class FullPageZoomWrapper extends StatefulWidget {
  final Widget Function() child;
  final double? width;
  final double? height;

  const FullPageZoomWrapper({
    Key? key,
    required this.child,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  State<FullPageZoomWrapper> createState() => _FullPageZoomWrapperState();
}

class _FullPageZoomWrapperState extends State<FullPageZoomWrapper>
    with SingleTickerProviderStateMixin {
  final TransformationController _controller = TransformationController();
  late AnimationController _animationController;
  Animation<Matrix4>? _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    )..addListener(() {
        if (_animation != null) {
          _controller.value = _animation!.value;
        }
      });
  }

  void _resetZoom() {
    _animation = Matrix4Tween(
      begin: _controller.value,
      end: Matrix4.identity(),
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );
    _animationController.forward(from: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    _animationController.dispose();
    super.dispose();
  }

  // @override
  // Widget build(BuildContext context) {
  //   return SizedBox(
  //     width: widget.width,
  //     height: widget.height,
  //     child: GestureDetector(
  //       onDoubleTap: _resetZoom, // Only reset on double-tap
  //       child: InteractiveViewer(
  //         transformationController: _controller,
  //         minScale: 1.0,
  //         maxScale: 3.0,
  //         panEnabled: true,
  //         // Removed onInteractionEnd to allow persistent zoom
  //         child: widget.child(),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: GestureDetector(
        onDoubleTap: _resetZoom, // Resets to original scale and position
        child: InteractiveViewer(
          transformationController: _controller,
          minScale: 1.0,
          maxScale: 3.0,
          panEnabled: true,
          scaleEnabled: true,
          boundaryMargin:
              const EdgeInsets.all(100), // Optional: improves pan freedom
          child: widget.child(),
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   final screenWidth = MediaQuery.of(context).size.width;
  //   const minComfortableWidth = 390.0;

  //   // Scale down only if screen is smaller than 390
  //   final scaleFactor = screenWidth < minComfortableWidth
  //       ? screenWidth / minComfortableWidth
  //       : 1.0;

  //   return SizedBox(
  //     width: widget.width,
  //     height: widget.height,
  //     child: Transform.scale(
  //       scale: scaleFactor,
  //       alignment: Alignment.topCenter,
  //       child: GestureDetector(
  //         onDoubleTap: _resetZoom,
  //         child: InteractiveViewer(
  //           transformationController: _controller,
  //           minScale: 1.0,
  //           maxScale: 3.0,
  //           panEnabled: true,
  //           scaleEnabled: true,
  //           child: widget.child(),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
