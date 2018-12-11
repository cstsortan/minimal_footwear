import 'package:flutter/material.dart';
import 'package:minimal_footwear/shoe_card.dart';
import 'package:minimal_footwear/shoe_page.dart';
import 'package:minimal_footwear/shoe_tile.dart';
import 'package:minimal_footwear/shoes.dart';

final Color _kMainPageColor = Color(0xFFEEEEFA);
final Color _kGreyDarkerColor = Color(0xFF8E8E8E);

final List<String> labels = [
  "Popular",
  "Trendy",
  "Top Selling",
  "Discover New"
];

class MainPage extends StatefulWidget {
  final Animation<double> animation;

  const MainPage({Key key, this.animation}) : super(key: key);

  @override
  MainPageState createState() {
    return MainPageState();
  }
}

class MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  String selectedLabel = labels[0];
  Shoe selectedShoe;

  AnimationController shoePageController;

  @override
  void initState() {
    super.initState();
    shoePageController = new AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 500,
      ),
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    shoePageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _kMainPageColor,
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              _buildHeader(),
              _buildShoesCardsList(),
              _buildLabelsList(),
              _buildShoesList(),
            ],
          ),
          selectedShoe != null
              ? ShoePage(
                  animation: shoePageController,
                  shoe: selectedShoe,
                  onBackPressed: () async {
                    await shoePageController.reverse().orCancel;
                    setState(() {
                      selectedShoe = null;
                    });
                  },
                )
              : Container(),
          Positioned(
            top: 25.0,
            right: 15.0,
                      child: SlideTransition(
              position:
                  Tween<Offset>(begin: Offset(2.0, 0.0), end: Offset(0.0, 0.0))
                      .animate(widget.animation),
              child: FloatingActionButton(
                mini: true,
                child: Icon(Icons.shopping_cart),
                onPressed: () {},
                backgroundColor: Colors.white,
                foregroundColor: _kGreyDarkerColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return SlideTransition(
      position: Tween(
        begin: Offset(0.0, 0.0),
        end: Offset(0.0, -1.0),
      ).animate(shoePageController),
      child: Container(
        margin: const EdgeInsets.only(
            left: 16.0, right: 16.0, top: 32.0, bottom: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Opacity(
              opacity: widget.animation.value,
              child: Text(
                "Welcome Christos",
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w800),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShoesList() {
    return Flexible(
      child: SlideTransition(
        position: Tween(
          begin: Offset(0.0, 0.0),
          end: Offset(0.0, 1.0),
        ).animate(shoePageController),
        child: SlideTransition(
          position: Tween<Offset>(
            begin: Offset(0.0, 1.0),
            end: Offset(0.0, 0.0),
          ).animate(widget.animation),
          child: ListView(
            padding: EdgeInsets.all(0.0),
            children: shoes.map((Shoe shoe) {
              return Padding(
                padding: EdgeInsets.only(
                    bottom: Tween(
                  begin: 100.0,
                  end: 0.0,
                ).animate(widget.animation).value),
                child: ShoeTile(
                  shoe: shoe,
                  onPick: () {
                    setState(() {
                      selectedShoe = selectedShoe == null ? shoe : null;
                    });
                    shoePageController.forward();
                  },
                ),
              );
            }).toList(),
          ),
        ),
      ),
      flex: 1,
    );
  }

  Widget _buildLabelsList() {
    return SlideTransition(
      position: Tween<Offset>(
        begin: Offset(0.0, 0.0),
        end: Offset(-1.0, 0.0),
      ).animate(shoePageController),
      child: SlideTransition(
        position: Tween<Offset>(
          begin: Offset(1.0, 0.0),
          end: Offset(0.0, 0.0),
        ).animate(widget.animation),
        child: Container(
          height: 50.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: labels.map((label) {
              return InkWell(
                onTap: () {
                  setState(() {
                    selectedLabel = label;
                  });
                },
                child: Material(
                  color: Colors.transparent,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 16.0,
                        right: Tween(
                          begin: 128.0,
                          end: 0.0,
                        ).animate(widget.animation).value,
                      ),
                      child: Container(
                        child: Text(
                          label,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w800,
                            color: selectedLabel == label
                                ? Colors.black
                                : Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildShoesCardsList() {
    return Flexible(
      flex: 1,
      child: Container(
        child: SlideTransition(
          position: new Tween<Offset>(
            begin: Offset(0.0, 0.0),
            end: Offset(1.0, 0.0),
          ).animate(shoePageController),
          child: SlideTransition(
            position: Tween<Offset>(
              begin: Offset(1.0, 0.0),
              end: Offset(0.0, 0.0),
            ).animate(widget.animation),
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              scrollDirection: Axis.horizontal,
              children: shoes.map((shoe) {
                return Padding(
                  padding: EdgeInsets.only(
                    right: Tween(
                      begin: 128.0,
                      end: 0.0,
                    ).animate(widget.animation).value,
                  ),
                  child: ShoeCard(
                    shoe: shoe,
                    key: Key(shoe.name),
                    onPick: () {
                      setState(() {
                        selectedShoe = selectedShoe == null ? shoe : null;
                      });
                      shoePageController.forward();
                    },
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
