import 'package:flutter/material.dart';
import 'package:my_expense/model/transaction.dart';
import 'package:intl/intl.dart';
import 'package:my_expense/widgets/chart_bar.dart';
class Chart extends StatelessWidget {
  final List<Transaction> recentTxs;

  Chart(this.recentTxs);

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final wD = DateTime.now().subtract(Duration(days: index));

      var totSum = 0.0;

      for (var i = 0; i < recentTxs.length; ++i) {
        if (recentTxs[i].date.day == wD.day
        && recentTxs[i].date.month == wD.month
        && recentTxs[i].date.year == wD.year) {
          totSum += recentTxs[i].amount;
        }
      }
      return {'day': DateFormat.E().format(wD).substring(0,1), 'amount': totSum};
    }).reversed.toList();
  }
  get maxSpending {
    return groupedTransactions.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactions);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:
            groupedTransactions.map((e) {
              return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                    e['day'],
                    e['amount'],
                    maxSpending == 0.0 ?0.0 : (e['amount']  as double) / maxSpending),
              )  ;
            }).toList(),
        ),
      ),

    );
  }
}
