import 'package:flutter/material.dart';

class CapituloWidget extends StatefulWidget {
  const CapituloWidget({Key? key}) : super(key: key);

  @override
  _CapituloWidgetState createState() => _CapituloWidgetState();
}

class _CapituloWidgetState extends State<CapituloWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.auto_stories, size: 50.0),
          Text('Capitulos', style: Theme.of(context).textTheme.headline4)
        ],
      ),
    );
  }
}