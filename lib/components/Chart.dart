import 'package:flutter/cupertino.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:money_manager/utils/style.dart';

import '../controller/db_helper.dart';

class Chart extends StatelessWidget {
  final Map data;
  DbHelper dbhelper = DbHelper();
  List<FlSpot> dataSet=[];
  DateTime today = DateTime.now();



  Chart({
    required this.data,
    super.key
});


  List<FlSpot> getPlotPoints(Map entireData){
    dataSet =[];
    entireData.forEach((key, value) {
      if(value['type']=='Expense' && (value['date'] as DateTime).month == today.month){
       dataSet.add(FlSpot((value['date'] as DateTime).day.toDouble(), (value['amount'] as int).toDouble()));
      }
    });
    return dataSet;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 40.0,
        horizontal: 8.0
      ),
      margin: EdgeInsets.all(small),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 5,
            blurRadius: 6,
            offset: Offset(0,4)
          )
        ]
      ),

      height: 400,
      child: LineChart(
       LineChartData(
         borderData: FlBorderData(show: false),
         lineBarsData: [
           LineChartBarData(
             spots: getPlotPoints(data!),
             isCurved: false,
             barWidth: 2.5,
             color: accent
           )
         ]
       )
      ),
    );
  }
}
