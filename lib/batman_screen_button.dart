import 'package:batman_signup/batman_button.dart';
import 'package:flutter/material.dart';

class BatmanScreenButton extends AnimatedWidget {
  BatmanScreenButton(Animation animation, this.onTap)
      : super(listenable: animation);
  final VoidCallback onTap;
  Animation get _animationButtonIn => listenable as Animation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Opacity(
        opacity: _animationButtonIn.value,
        child: Transform.translate(
          offset: Offset(
            0.0,
            100 * (1 - _animationButtonIn.value),
          ),
          child: Column(
            children: [
              BatamnButton(text: 'LOGIN'),
              const SizedBox(height: 20),
              BatamnButton(
                text: 'SIGNUP',
                onTap: onTap,
              )
            ],
          ),
        ),
      ),
    );
  }
}
