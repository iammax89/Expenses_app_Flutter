import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctOftotal;

  ChartBar(
      {@required this.label,
      @required this.spendingAmount,
      @required this.spendingPctOftotal});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      child: Column(
        children: [
          Container(
              child: FittedBox(
                  child: Text(
            '\$${spendingAmount.toStringAsFixed(2)}',
            style: TextStyle(fontSize: 12),
          ))),
          Container(
            margin: EdgeInsets.only(top: 4, bottom: 4),
            height: 60,
            width: 10,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.black12),
                ),
                FractionallySizedBox(
                  heightFactor: spendingPctOftotal,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Theme.of(context).primaryColor),
                  ),
                )
              ],
            ),
          ),
          Text(label)
        ],
      ),
    );
  }
}
