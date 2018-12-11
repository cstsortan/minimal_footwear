import 'package:flutter/material.dart';
import 'package:minimal_footwear/shoes.dart';

final Color _kPriceTextColor = const Color(0xFF595CFF);

class ShoePage extends StatelessWidget {
  final Shoe shoe;
  final VoidCallback onBackPressed;
  final Animation<double> animation;

  const ShoePage({Key key, this.shoe, this.animation, this.onBackPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          left: 0.0,
          right: 0.0,
          top: new Tween<double>(
            begin: -500.0,
            end: 0.0,
          ).animate(animation).value,
          child: Container(
            child: Image.asset(shoe.image),
          ),
        ),
        Positioned(
          top: new Tween<double>(
            begin: -50.0,
            end: 25.0,
          ).animate(animation).value,
          left: 15.0,
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: onBackPressed,
          ),
        ),
        Positioned(
          left: 20.0,
          right: 20.0,
          top: new Tween(
            begin: MediaQuery.of(context).size.height,
            end: MediaQuery.of(context).size.height / 2 - 32.0,
          ).animate(animation).value,
          bottom: Tween(
            begin: -MediaQuery.of(context).size.height/2,
            end: 80.0
          ).animate(animation).value,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.white,
            ),
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      shoe.name,
                      style: TextStyle(
                          fontSize: 30.0, fontWeight: FontWeight.w700),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    "\$${shoe.price}",
                    style: TextStyle(
                      color: _kPriceTextColor,
                      fontSize: 24.0,
                      fontWeight: FontWeight.w800
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
