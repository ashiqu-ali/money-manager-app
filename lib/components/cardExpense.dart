import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_manager/utils/style.dart';

class CardExpense extends StatelessWidget {
  List<String> months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];
  final String type;
  final String amount;
  final String note;
  final DateTime date;
  CardExpense({
    required this.type,
    required this.amount,
    required this.note,
    required this.date,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(small),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Color(0xffced4eb),
          borderRadius: BorderRadius.circular(xsmall),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${date.day}-${months[date.month-1]}',style: p3),
                  Text(note,style: p3),
                  Text(amount,style: GoogleFonts.poppins(color: Colors.red, fontSize: 18,fontWeight: FontWeight.w500)
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
