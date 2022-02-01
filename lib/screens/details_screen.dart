import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('detail'),
        actions: [
          IconButton(
              onPressed: () => {}, icon: const Icon(Icons.search_outlined))
        ],
      ),
      body: Container(
        child: Text('DetailsScreen'),
      ),
    );
  }
}
