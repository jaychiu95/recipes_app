import 'package:flutter/material.dart';

import '../widgets/google_button.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BoxDecoration _buildBackground() {
      return BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/images/kitchen.jpg'),
        fit: BoxFit.cover,
      ));
    }

    Text _buildText() {
      return Text(
        'Recipes',
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 45,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      );
    }

    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Container(
        decoration: _buildBackground(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildText(),
              SizedBox(
                height: 50,
              ),
              GoogleSignInButton(
                onPressed: () =>
                    Navigator.of(context).pushReplacementNamed('/'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
