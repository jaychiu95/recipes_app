import 'package:flutter/material.dart';

class GoogleSignInButton extends StatelessWidget {
  final Function onPressed;
  GoogleSignInButton({this.onPressed});

  @override
  Widget build(BuildContext context) {
    Image _buildLogo() {
      return Image.asset(
        'assets/images/g-logo.png',
        height: 18,
        width: 18,
      );
    }

    Opacity _buildText() {
      return Opacity(
        opacity: 0.54,
        child: Text(
          'Sign in with Google',
          style: TextStyle(
            fontFamily: 'Roboto-Medium',
            fontSize: 14,
            color: Colors.black,
          ),
        ),
      );
    }

    return MaterialButton(
      height: 40,
      onPressed: this.onPressed,
      color: Colors.white,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _buildLogo(),
          SizedBox(
            width: 24.0,
          ),
          _buildText(),
        ],
      ),
    );
  }
}
