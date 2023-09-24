import 'package:flutter/cupertino.dart';
import 'package:money_manager/components/cardIncome.dart';

import 'cardExpense.dart';

class Transaction extends StatelessWidget {

  int length;
  final Map data;

  Transaction({
    required this.length,
    required this.data,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context,index){
          Map dataAtIndex = data![index];
          if(dataAtIndex['type']=='Income'){
            return CardIncome(type: dataAtIndex['type'], amount: dataAtIndex['amount'].toString(), note: dataAtIndex['note'], date : dataAtIndex['date']);
          }else{
            return CardExpense(type: dataAtIndex['type'], amount: dataAtIndex['amount'].toString(), note: dataAtIndex['note'], date : dataAtIndex['date']);
          }

        },
      ),
    );
  }
}