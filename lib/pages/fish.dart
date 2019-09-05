import 'package:flutter/material.dart';

import '../models/fish.dart';

class FishPage extends StatefulWidget {
  final Fish fish;

  FishPage(this.fish);

  @override
  State<StatefulWidget> createState() {
    return _FishPageState();
  }
}

class _FishPageState extends State<FishPage> {

  Widget titleSection(String name) { 
    return Container (
      padding: const EdgeInsets.all(32),
      child: Text(name),
    );
  }

  Widget descriptionSection(String description) { 
    return Container (
      padding: const EdgeInsets.all(32),
      child: Text(description, softWrap: true,),
    );
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fish details'),
      ),
      body: ListView(
        children: <Widget>[
          Image.network(widget.fish.image, width: 600, height: 200, fit: BoxFit.fill),
          titleSection(widget.fish.name),
          descriptionSection(widget.fish.description)
        ],
      )
    );
  }
}