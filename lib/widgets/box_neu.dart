import 'package:flutter/material.dart';
import '../constants/constants.dart';

class BoxNeu extends StatefulWidget {
  final bool darkMode;
  final Widget child;
  final BorderRadius borderRadius;
  final EdgeInsetsGeometry padding;

  const BoxNeu({
    required this.darkMode,
    required this.child,
    required this.borderRadius,
    required this.padding,
    Key? key,
  }) : super(key: key);

  @override
  State<BoxNeu> createState() => _BoxNeuState();
}

class _BoxNeuState extends State<BoxNeu> {
  bool _isPressed = false;

  void _onPointerDown(PointerDownEvent event) {
    setState(() {
      _isPressed = true;
    });
  }

  void _onPointerUp(PointerUpEvent event) {
    setState(() {
      _isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool darkMode = widget.darkMode;
    return Listener(
      onPointerDown: _onPointerDown,
      onPointerUp: _onPointerUp,
      child: Container(
        padding: widget.padding,
        decoration: BoxDecoration(
          color: darkMode ? colorDark : colorLight,
          borderRadius: widget.borderRadius,
          boxShadow: _isPressed
              ? [
                  BoxShadow(
                    color: darkMode ? Colors.black54 : Colors.blueGrey.shade200,
                    offset: Offset(4.0, 4.0),
                    blurRadius: 15.0,
                    spreadRadius: -10.0,
                  ),
                  BoxShadow(
                    color: darkMode ? Colors.blueGrey.shade700 : Colors.white,
                    offset: Offset(-4.0, -4.0),
                    blurRadius: 15.0,
                    spreadRadius: -10.0,
                  ),
                ]
              : [
                  BoxShadow(
                    color: darkMode ? Colors.black54 : Colors.blueGrey.shade200,
                    offset: Offset(4.0, 4.0),
                    blurRadius: 15.0,
                    spreadRadius: 1.0,
                  ),
                  BoxShadow(
                    color: darkMode ? Colors.blueGrey.shade700 : Colors.white,
                    offset: Offset(-4.0, -4.0),
                    blurRadius: 15.0,
                    spreadRadius: 1.0,
                  ),
                ],
        ),
        child: Center(child: widget.child),
      ),
    );
  }
}
