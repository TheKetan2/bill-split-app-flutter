import 'package:flutter/material.dart';

class billInfoCard extends StatelessWidget {
  final TextStyle infoStyle;
  final String bill;
  final double taxCount;
  final double tipCount;
  final double friendsCount;
  billInfoCard(
      {Key? key,
      required this.taxCount,
      required this.tipCount,
      required this.infoStyle,
      required this.friendsCount,
      required this.bill})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Total Amount",
                  style: infoStyle,
                ),
                Text(
                  "\$${bill == "" ? 0 : bill}",
                  style: infoStyle.copyWith(fontSize: 35),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Friends", style: infoStyle),
                    Text("Tax", style: infoStyle),
                    Text("Tip", style: infoStyle),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(friendsCount.toInt().toString(), style: infoStyle),
                    Text("${taxCount.toInt().toString()}%", style: infoStyle),
                    Text("\$${tipCount.toInt().toString()}", style: infoStyle),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
