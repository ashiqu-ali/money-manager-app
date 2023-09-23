import 'package:flutter/material.dart';
import 'package:money_manager/pages/addTransaction.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>AddTransaction()));
      },
      child: Icon(Icons.add),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35)
      ),
    );
  }
}
