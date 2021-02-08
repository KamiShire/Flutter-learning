import 'package:flutter/material.dart';
import 'package:my_expense/widgets/chart.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAm;
  final double spendingPct;

  ChartBar(this.label, this.spendingAm, this.spendingPct);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 20,
          child: FittedBox(
              child: Text('€${spendingAm.toStringAsFixed(2)}')),
        ),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 100,
          width: 10,
          child: Stack( children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black38, width: 1),
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            FractionallySizedBox(
              heightFactor: spendingPct,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius:  BorderRadius.circular(20),
                ),
              ),
            )
          ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(label),
      ],
    );
  }
}
