import 'package:vector_math/vector_math_64.dart' as vector;

import 'package:flutter/material.dart';

const _imageColor = Color(0xffc8b853);

class BatamnButton extends StatelessWidget {
  const BatamnButton({
    Key key,
    this.onTap,
    this.text,
    this.left = true,
  }) : super(key: key);

  final VoidCallback onTap;
  final String text;
  final bool left;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xfffde86a),
      child: InkWell(
        onTap: onTap,
        child: ClipRRect(
          child: SizedBox(
            height: 55,
            child: Stack(
              children: [
                if (left)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..translate(-10.0)
                        ..rotateZ(vector.radians(35)),
                      child: Image.asset(
                        'assets/batman_logo.png',
                        height: 40,
                        color: _imageColor,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                Center(
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if (!left)
                  Align(
                    alignment: Alignment.centerRight,
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..translate(10.0)
                        ..rotateZ(vector.radians(-35)),
                      child: Image.asset(
                        'assets/batman_logo.png',
                        height: 40,
                        color: _imageColor,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
