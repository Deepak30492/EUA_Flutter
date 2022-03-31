import 'package:flutter/material.dart';

class CommonLoadingIndicator extends StatelessWidget {
  const CommonLoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  const EdgeInsets.all(10.0),
      child: const Center(
        child: CircularProgressIndicator(
          strokeWidth: 5.0,
        ),
      ),
    );
  }
}
