import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, required this.images});
  final String images;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Image(
          image: NetworkImage(images),
          fit: BoxFit.cover,
        ),
      )
    );
  }
}
