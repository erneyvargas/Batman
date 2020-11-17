import 'package:flutter/material.dart';

class BatmanScreenTitle extends AnimatedWidget {
  BatmanScreenTitle(Animation animation) : super(listenable: animation);

  Animation get _animationLogoMoveInUp => listenable as Animation;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _animationLogoMoveInUp.value,
      child: Column(
        children: [
          Text(
            'WELCOME TO',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
          ),
          Text(
            'GOTHAM CITY',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 35),
          ),
        ],
      ),
    );
  }
}
