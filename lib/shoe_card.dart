import 'package:flutter/material.dart';
import 'package:minimal_footwear/shoes.dart';

final Color _kCardColorBlue = const Color(0xFFB5D8E8);
final Color _kPriceTextColor = const Color(0xFF595CFF);

class ShoeCard extends StatelessWidget {
  final Shoe shoe;
  final VoidCallback onPick;

  const ShoeCard({Key key, this.shoe, this.onPick}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.0,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 32.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: _kCardColorBlue,
              ),
              child: Image.asset(shoe.image,),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: new ShoeCardDetails(shoe: shoe),
          ),
          Positioned(
            bottom: 10.0,
            left: 100.0,
            height: 32.0,
            width: 32.0,
            child: FloatingActionButton(
              mini: true,
              child: Icon(Icons.arrow_forward,
              size: 21.0,),
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              onPressed: onPick,
            ),
          ),
        ],
      ),
    );
  }
}

class ShoeCardDetails extends StatelessWidget {
  const ShoeCardDetails({
    Key key,
    @required this.shoe,
  }) : super(key: key);

  final Shoe shoe;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(0.0), bottom: Radius.circular(6.0))),
      height: 80.0,
      width: 120.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              shoe.name,
              style: TextStyle(
                  fontSize: 16.0, fontWeight: FontWeight.w700),
            ),
            Text(
              "\$${shoe.price}",
              style: TextStyle(
                color: _kPriceTextColor,
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
