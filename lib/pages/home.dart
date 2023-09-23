import 'package:flutter/material.dart';
import 'package:money_manager/components/floatingButton.dart';
import 'package:money_manager/utils/style.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      floatingActionButton : FloatingButton(),
      body: SafeArea(
        child: Center(

        ),
      ),
    );
  }
}
