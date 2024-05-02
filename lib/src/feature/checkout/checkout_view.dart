import 'package:flutter/material.dart';

class CheckOutView extends StatelessWidget {
  const CheckOutView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Check Out'),
        ),
        body: const Center(
          child: Text('Check Out Page'),
        ),
      );
}
