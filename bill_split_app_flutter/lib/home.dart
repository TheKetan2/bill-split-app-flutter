import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  double friendsCount = 0, taxCount = 0, tipCount = 0;

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
                            Text("${taxCount.toInt().toString()}%",
                                style: infoStyle),
                            Text(tipCount.toInt().toString(), style: infoStyle),
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
            Text("How many friends?", style: infoStyle),
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
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Tip",
                        style: infoStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 25,
                            height: 25,
                            child: FloatingActionButton(
                              onPressed: tipCount == 0
                                  ? null
                                  : () {
                                      setState(() {
                                        tipCount -= 1;
                                      });
                                    },
                              child: Icon(Icons.remove),
                            ),
                          ),
                          Text(
                            tipCount.toInt().toString(),
                            style: infoStyle,
                          ),
                          Container(
                            width: 25,
                            height: 25,
                            child: FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  tipCount += 1;
                                });
                              },
                              child: Icon(Icons.add),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          taxCount = double.parse(value);
                        });
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Tax In %",
                          labelStyle: infoStyle.copyWith(fontSize: 15),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                    ),
                  ),
                )
              ],
            )
            // Text("How much tax?}", style: infoStyle),
            // Slider(
            //     min: 0,
            //     max: 15,
            //     divisions: 15,
            //     activeColor: Colors.yellow,
            //     inactiveColor: Colors.grey,
            //     value: taxCount,
            //     onChanged: (value) {
            //       setState(() {
            //         taxCount = value;
            //       });
            //     }),
            // Text("How much Tip?}", style: infoStyle),
            // Slider(
            //     min: 0,
            //     max: 15,
            //     divisions: 15,
            //     activeColor: Colors.yellow,
            //     inactiveColor: Colors.grey,
            //     value: tipCount,
            //     onChanged: (value) {
            //       setState(() {
            //         tipCount = value;
            //       });
            //     }),
          ],
        ),
      ),
    );
  }
}
