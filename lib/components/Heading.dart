import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_manager/utils/style.dart';

class Heading extends StatelessWidget {
  final String headng;
  Heading({
    required this.headng,
    super.key
});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(small),
      child: Text(
        headng,
        style: GoogleFonts.openSans(
          fontSize: 32.0,
          color: black,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
