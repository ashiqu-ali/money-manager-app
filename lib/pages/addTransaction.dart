import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:money_manager/controller/db_helper.dart';
import 'package:money_manager/pages/home.dart';
import 'package:money_manager/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';


class AddTransaction extends StatefulWidget {
  const AddTransaction({Key? key}) : super(key: key);

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {

  int? amount;
  String note = " ";
  String type = 'Income';
  DateTime date = DateTime.now();
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

  Future<void> _selectDate(BuildContext context) async{
    final DateTime? picked = await showDatePicker(context: context,
        initialDate: date,
        firstDate: DateTime(2000),
        lastDate: DateTime.now()
    );
    if(picked != null && picked != date){
      setState(() {
        date=picked!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView(
            children: [
              SizedBox(height: medium),
              Text(
                'Add Transaction',
                style: heading1,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: medium),
              Row(
                children: [
                  Expanded(
                      child: ChoiceChip(
                          label: Text('Income',style: heading2),
                          selectedColor: Colors.blueAccent,
                          selected: type == 'Income' ? true : false,
                        onSelected: (val){
                            if(val){
                              setState(() {
                                type = 'Income';
                              });
                            }
                        },
                      )
                  ),
                  Expanded(
                      child: ChoiceChip(
                          label: Text('Expense',style: heading2),
                          selectedColor: Colors.blueAccent,
                          selected: type == "Expense" ? true : false,
                          onSelected: (val){
                            if(val){
                              setState(() {
                                type = 'Expense';
                              });
                            }
                          }
                      )
                  ),
                ],
              ),
              SizedBox(height: medium),
              TextField(
                enableSuggestions: false,
                autocorrect: false,
                cursorColor: accent,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.currency_rupee,color: icon),
                    fillColor: white,
                    filled: true,
                    hintText: '0',
                    hintStyle: p1,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none
                    )
                ),
                onChanged: (val){
                  try{
                    amount=int.parse(val);
                    print(amount);
                  }catch(e){
                    print(e);
                  }
                },
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly
                ],
                keyboardType: TextInputType.number,
                style: p2,
              ),
              SizedBox(height: small),
              TextField(
                enableSuggestions: false,
                autocorrect: false,
                cursorColor: accent,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.description_outlined,color: icon),
                    fillColor: white,
                    filled: true,
                    hintText: 'Notes',
                    hintStyle: p1,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none
                    )
                ),
                style: p2,
                onChanged: (val){
                  note = val;
                },
              ),
              SizedBox(height: small),
              Row(
                children: [
                  TextButton(
                      onPressed: (){
                        _selectDate(context);
                      },
                      style: ButtonStyle(padding: MaterialStateProperty.all(EdgeInsets.zero)),
                      child: Row(
                        children: [
                          SizedBox(width: small),
                          Icon(Icons.date_range, color: icon),
                          SizedBox(width: xsmall),
                          Text('${date.day}-${months[date.month-1]}-${date.year}',style: p2),
                        ],
                      )
                  ),
                ],
              ),
              SizedBox(height: medium),
              ElevatedButton(
                style: ButtonStyle(
                ),
                  onPressed: () async{
                    if(amount!=null && note.isNotEmpty){
                      DbHelper dbHelper =DbHelper();
                      await dbHelper.addData(amount!, date, note, type);
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                      print('value added');
                    }else{
                      print('value not provided');
                    }
                  },
                  child: Text('Add')
              )

            ],
          ),
        ),
      ),
    );
  }
}
