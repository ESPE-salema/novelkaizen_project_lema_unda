import 'package:flutter/material.dart';

class YoWidget extends StatelessWidget {
  const YoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.account_circle, size: 50.0),
          Text('Yo', style: Theme.of(context).textTheme.headline4)
        ],
      ),
    );
  }
}
