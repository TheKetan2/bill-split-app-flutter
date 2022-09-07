import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BillSplit extends StatefulWidget {
  const BillSplit({Key? key}) : super(key: key);

  @override
  State<BillSplit> createState() => _BillSplitState();
}

class _BillSplitState extends State<BillSplit> {
  TextStyle infoStyle = GoogleFonts.montserrat(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );
  double friendsCount = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(
                top: 60,
              ),
              child: Text(
                "Split Bill",
                style: infoStyle,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
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
                          "34",
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
                            Text(friendsCount.toInt().toString(),
                                style: infoStyle),
                            Text("14%", style: infoStyle),
                            Text("15", style: infoStyle),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text("How many friends?}", style: infoStyle),
            Slider(
                min: 0,
                max: 15,
                divisions: 15,
                activeColor: Colors.yellow,
                inactiveColor: Colors.grey,
                value: friendsCount,
                onChanged: (value) {
                  setState(() {
                    friendsCount = value;
                  });
                })
          ],
        ),
      ),
    );
  }
}
