import 'package:flutter/material.dart';

import 'package:batman_signup/batman_button.dart';

class BatmanScreenSingUp extends AnimatedWidget {
  BatmanScreenSingUp(Animation animation) : super(listenable: animation);

  Animation get _animationButtonsIn => listenable as Animation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Opacity(
        opacity: _animationButtonsIn.value,
        child: Transform.translate(
          offset: Offset(
            0.0,
            100 * (1 - _animationButtonsIn.value),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    'GET ACCESS',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  BatmanInput(
                    label: 'FULL NAME',
                  ),
                  BatmanInput(
                    label: 'EMAIL ID',
                  ),
                  BatmanInput(
                    label: 'PASSWORD',
                    password: true,
                  ),
                  const SizedBox(height: 10),
                  BatamnButton(
                    text: 'SIGNUP',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BatmanInput extends StatelessWidget {
  const BatmanInput({
    Key key,
    this.label,
    this.password = false,
  }) : super(key: key);

  final String label;
  final bool password;

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey,
        width: 1.5,
      ),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
          decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.grey),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        enabledBorder: border,
        border: border,
        suffixIcon: password
            ? Padding(
                padding: const EdgeInsets.only(right: 10),
                child: UnconstrainedBox(
                  child: Image.asset(
                    'assets/batman_logo.png',
                    height: 15,
                  ),
                ),
              )
            : null,
      )),
    );
  }
}
