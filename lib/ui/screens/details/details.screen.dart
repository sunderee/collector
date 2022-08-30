import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final String formattedDate;

  const DetailsScreen({
    super.key,
    required this.formattedDate,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          formattedDate,
        ),
      ),
    );
  }
}
