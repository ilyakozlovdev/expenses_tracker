import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double totalSpendings;

  ChartBar({this.label, this.spendingAmount, this.totalSpendings});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        children: <Widget>[
          Container(
            child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text('\$${spendingAmount.toStringAsFixed(0)}')),
            height: constraints.maxHeight * 0.15,
          ),
          SizedBox(
            height: constraints.maxHeight * 0.05,
          ),
          Container(
            height: constraints.maxHeight * 0.6,
            width: 10,
            decoration: BoxDecoration(
                color: Colors.black12, borderRadius: BorderRadius.circular(5)),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                FractionallySizedBox(
                  heightFactor:
                      totalSpendings > 0 ? spendingAmount / totalSpendings : 0,
                  child: Container(
                    child: null,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: constraints.maxHeight * 0.05,
          ),
          Container(
            child: FittedBox(fit: BoxFit.scaleDown, child: Text(label)),
            height: constraints.maxHeight * 0.15,
          ),
        ],
      );
    });
  }
}
