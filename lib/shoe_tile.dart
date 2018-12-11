import 'package:flutter/material.dart';
import 'package:minimal_footwear/shoes.dart';

final Color _kPriceTextColor = const Color(0xFF595CFF);

class ShoeTile extends StatelessWidget {
  final Shoe shoe;
  final VoidCallback onPick;

  const ShoeTile({Key key, this.shoe, this.onPick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(shoe.image),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
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
                ),
              ],
            ),
            height: 100.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withAlpha(90),
                    blurRadius: 8.0,
                    spreadRadius: 1.0,
                    offset: Offset(0.0, 5.0)),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 24.0,
          right: 2.0,
          height: 32.0,
          width: 32.0,
          child: FloatingActionButton(
            onPressed: onPick,
            mini: true,
            child: Icon(Icons.arrow_forward),
          ),
        )
      ],
    );
  }
}
