import 'package:bill_split_app_flutter/result_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'bill_info_card.dart';

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
  String bill = "";

  buildButton(String label) {
    return Expanded(
        child: OutlinedButton(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.all(20),
      ),
      onPressed: label == "<"
          ? () {
              setState(() {
                bill = "";
              });
            }
          : () {
              setState(() {
                bill += label;
              });
            },
      child: Text(
        label,
        style: infoStyle,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
              billInfoCard(
                friendsCount: friendsCount,
                taxCount: taxCount,
                tipCount: tipCount,
                infoStyle: infoStyle,
                bill: bill,
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
                            taxCount = value == "" ? 0 : double.parse(value);
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
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  buildButton("1"),
                  buildButton("2"),
                  buildButton("3"),
                ],
              ),
              Row(
                children: [
                  buildButton("4"),
                  buildButton("5"),
                  buildButton("6"),
                ],
              ),
              Row(
                children: [
                  buildButton("7"),
                  buildButton("8"),
                  buildButton("9"),
                ],
              ),
              Row(
                children: [
                  buildButton("."),
                  buildButton("0"),
                  buildButton("<"),
                ],
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultPage(
                              tax: taxCount,
                              friends: friendsCount,
                              tip: tipCount,
                              bill: bill)));
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                  Colors.green[300],
                )),
                child: Center(
                  child: Text(
                    "Split Bill",
                    style: infoStyle.copyWith(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
