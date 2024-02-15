import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Spacer(),
        Text("Account",style: TextStyle(fontSize: 30),),
        Spacer(),
      ],
    );
  }
}