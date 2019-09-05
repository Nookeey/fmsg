import 'package:flutter/material.dart';

import '../models/fish.dart';
import '../pages/fish.dart';

class FishsPage extends StatefulWidget {
  final List<Fish> fishList;

  FishsPage(this.fishList);

  @override
  State<StatefulWidget> createState() {
    return _FishsPageState();
  }
}

class _FishsPageState extends State<FishsPage> {

  Widget _buildFishTitle(String name) {
    return Text(
      name,
      style: TextStyle(fontWeight: FontWeight.normal, fontSize: 26.0, fontStyle: FontStyle.italic),
    );
  }

  Widget _buildFishCart(Fish fish, int index) {
    return Column(
      children: < Widget > [
        Card(
          child: new InkWell(
            onTap: () {
              print("tapped");
              Navigator.push( context, MaterialPageRoute(builder: (context) => FishPage(fish)));
            },
            child: Card(
              semanticContainer: false,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5,
              margin: EdgeInsets.all(10),
              child: Container(
                margin: EdgeInsets.all(10.0),
                padding: EdgeInsets.all(32.0),
                child: Column(
                  children: < Widget > [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(fish.image),
                          fit: BoxFit.contain,
                        ),
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: 150.0,
                    ),
                    _buildFishTitle(fish.name),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFishList(List<Fish> fishs) {
    print(fishs[0].name);
    Widget fishCards;
    if (fishs.length > 0) {
      fishCards = ListView.builder(
        itemBuilder: (BuildContext context, int index) => _buildFishCart(fishs[index], index),
        itemCount: fishs.length,
      );
    } else {
      fishCards = Container();
    }
    return fishCards;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fish'),
      ),
      body: Center(
        child: _buildFishList(widget.fishList)
      ),
    );
  }
}
