import 'package:flutter/material.dart';

final _kWelcomeScreenColorTop = const Color(0xFF9BB5FF);
final _kWelcomeScreenColorBottom = const Color(0xFF5A60FF);
const _kInnerCircleColor = const Color(0xFF86A2FC);
const _kOuterCircleColor = const Color(0xFF8497FF);

class WelcomeScreen extends StatelessWidget {

  final VoidCallback onPageOpen;

  const WelcomeScreen({Key key, this.onPageOpen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                _kWelcomeScreenColorTop,
                _kWelcomeScreenColorBottom,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        Center(
          child: Container(
            height: 250.0,
            width: 250.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(125.0),
              color: _kOuterCircleColor,
            ),
          ),
        ),
        Center(
          child: Container(
            height: 150.0,
            width: 150.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(75.0),
              color: _kInnerCircleColor,
            ),
          ),
        ),
        Center(
          child: Text(
            "Welcome Christos",
            style: TextStyle(
              color: Colors.white,
              fontSize: 36.0,
              fontWeight: FontWeight.w700,
              letterSpacing: -1.0,
            ),
          ),
        ),
        Container(
          child: Align(
            alignment: Alignment(0.0, 0.9),
            child: FloatingActionButton(
              child: Icon(Icons.arrow_forward),
              backgroundColor: Colors.white,
              foregroundColor: _kWelcomeScreenColorBottom,
              onPressed: () {
                onPageOpen();
              },
            ),
          ),
        ),
      ],
    );
  }
}
