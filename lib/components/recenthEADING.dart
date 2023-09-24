import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_manager/utils/style.dart';

class RecentHeading extends StatelessWidget {
  const RecentHeading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(small),
      child: Text(
        'Recent Transaction',
        style: GoogleFonts.openSans(
          fontSize: 32.0,
          color: black,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
