import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    body: Center(
      child: IconButton(
        onPressed: () {
          context.push('/home/profile');
        },
        icon: Icon(CupertinoIcons.profile_circled),
        iconSize: 100,
      ),
    ),
  );
}
