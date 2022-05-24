import 'package:flutter/material.dart';

class IsLoading extends StatelessWidget {
  const IsLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: const EdgeInsets.all(2),
      contentPadding: const EdgeInsets.all(2),
      elevation: 0,
      content: const Text(
        "Loading",
        textAlign: TextAlign.center,
      ),
      backgroundColor: Colors.grey.withOpacity(0.03),
      title: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
