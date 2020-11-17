import 'package:batman_signup/batman_city.dart';
import 'package:batman_signup/batman_screen_button.dart';
import 'package:batman_signup/batman_screen_singup.dart';
import 'package:batman_signup/batman_screen_title.dart';
import 'package:flutter/material.dart';

const _batmanVerticalMovement = 60.0;

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animationLogoIn;
  Animation<double> _animationLogoMoveInUp;
  Animation<double> _animationBatmanIn;
  Animation<double> _animationButtonIn;

  AnimationController _animationControllerSignUp;
  Animation<double> _animationLogoOut;
  Animation<double> _animationBatmanUp;
  Animation<double> _animationBatmanCity;
  Animation<double> _animationButtonsIn;

  void _setupFirstAnimations() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));
    _animationLogoIn = Tween(
      begin: 35.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.0, 0.30),
      ),
    );
    _animationLogoMoveInUp = CurvedAnimation(
      parent: _animationController,
      curve: Interval(0.35, 0.60),
    );

    _animationBatmanIn = Tween(
      begin: 5.0,
      end: 1.1,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(
          0.70,
          1.0,
          curve: Curves.decelerate,
        ),
      ),
    );

    _animationButtonIn = CurvedAnimation(
      parent: _animationController,
      curve: Interval(0.75, 1.0),
    );

    _animationController.forward();
  }

  void _setupSecondAnimations() {
    _animationControllerSignUp = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );
    _animationLogoOut = CurvedAnimation(
      parent: _animationControllerSignUp,
      curve: Interval(0.0, 0.20),
    );
    _animationBatmanUp = CurvedAnimation(
      parent: _animationControllerSignUp,
      curve: Interval(0.35, 0.60),
    );

    _animationBatmanCity = CurvedAnimation(
      parent: _animationControllerSignUp,
      curve: Interval(0.65, 0.8),
    );

    _animationButtonsIn = CurvedAnimation(
      parent: _animationControllerSignUp,
      curve: Interval(0.85, 1),
    );
  }

  @override
  void initState() {
    _setupFirstAnimations();
    _setupSecondAnimations();
    super.initState();
  }

  void onSignUp() {
    _animationControllerSignUp.forward(from: 0.0);
  }

  @override
  void dispose() {
    _animationController.dispose();
    _animationControllerSignUp.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _animationController.forward(from: 0.0);
        _animationControllerSignUp.reset();
      },
      child: AnimatedBuilder(
          animation: Listenable.merge(
              [_animationController, _animationControllerSignUp]),
          builder: (context, _) {
            return Scaffold(
              backgroundColor: Color(0xff100f0b),
              body: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Image.asset(
                      'assets/batman_background.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Transform.translate(
                      offset: Offset(
                          0.0,
                          _batmanVerticalMovement * _animationLogoOut.value +
                              -_animationBatmanUp.value *
                                  _batmanVerticalMovement),
                      child: Transform.scale(
                        scale: _animationBatmanIn.value,
                        child: Image.asset(
                          'assets/batman_alone.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height / 3.8,
                    left: 40,
                    right: 40,
                    child: BatmanCity(_animationBatmanCity),
                  ),
                  Positioned(
                      top: MediaQuery.of(context).size.height / 1.7,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: BatmanScreenSingUp(_animationButtonsIn)),
                  Positioned(
                    top: MediaQuery.of(context).size.height / 2,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        Transform.translate(
                          offset: Offset(0.0, 60 * _animationLogoOut.value),
                          child: Opacity(
                              opacity: (1 - _animationLogoOut.value),
                              child: BatmanScreenTitle(_animationLogoMoveInUp)),
                        ),
                        const SizedBox(height: 30),
                        Transform.translate(
                          offset: Offset(0.0, 60 * _animationLogoOut.value),
                          child: Opacity(
                            opacity: (1 - _animationLogoOut.value),
                            child: BatmanScreenButton(
                                _animationButtonIn, onSignUp),
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height / 2.2 -
                        65 * _animationLogoMoveInUp.value,
                    left: 0,
                    right: 0,
                    child: Opacity(
                      opacity: (1 - _animationLogoOut.value),
                      child: Transform.scale(
                        scale: _animationLogoIn.value,
                        child: Image.asset(
                          'assets/batman_logo.png',
                          height: 50,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
