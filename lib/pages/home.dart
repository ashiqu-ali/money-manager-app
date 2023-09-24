import 'package:flutter/material.dart';
import 'package:money_manager/components/floatingButton.dart';
import 'package:money_manager/controller/db_helper.dart';
import 'package:money_manager/components/totalBalance.dart';
import 'package:money_manager/utils/style.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  DbHelper dbhelper = DbHelper();
  int totalBalance = 0;
  int totalIncome = 0;
  int totalExpense = 0;
  getTotalBalance(Map entireData){
    totalBalance = 0;
    totalIncome = 0;
    totalExpense = 0;
    entireData.forEach((key, value) {
      print(value);
      if(value['type'] == 'Income'){
        totalBalance += (value['amount'] as int);
        totalIncome += (value['amount'] as int);
      }else if(value['type'] == 'Expense'){
        totalBalance -= (value['amount'] as int);
        totalExpense += (value['amount'] as int);
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      floatingActionButton : const FloatingButton(),
      body: SafeArea(
        child: FutureBuilder<Map>(
          future: dbhelper.fetch(),
          builder: (context,snapshot){
            if(snapshot.hasError){
              return Center(child: Text('Unexpected Error!'));
            }if(snapshot.hasData){
              if(snapshot.data!.isEmpty){
                return Center(child: Text('snapshot Empty!'));
              }
              getTotalBalance(snapshot.data!);
              return ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.person,color: icon,size: medium),
                            SizedBox(width: xsmall),
                            Text('Welcome Ashiq',style: heading2,)
                          ],
                        ),
                        Icon(Icons.settings,color: icon, size: medium)
                      ],
                    ),
                  ),
                  TotalBalance(totalBalance: totalBalance, totalIncome: totalIncome, totalExpense: totalExpense)
                ],
              );
            }else{
              return Center(child: Text('Unexpected Error!(else)'));
            }
          },
        )
      ),
    );
  }
}
