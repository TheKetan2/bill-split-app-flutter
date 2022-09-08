import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'bill_info_card.dart';

class ResultPage extends StatefulWidget {
  final double tax;
  final double friends;
  final double tip;
  final String bill;
  const ResultPage(
      {Key? key,
      required this.tax,
      required this.friends,
      required this.tip,
      required this.bill})
      : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  TextStyle infoStyle = GoogleFonts.montserrat(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );
  double bill = 0;
  double perFriend = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      bill = double.parse(widget.bill) +
          widget.tip +
          double.parse(widget.bill) * (widget.tax / 100);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: 70,
              left: 20,
              right: 20,
            ),
            child: billInfoCard(
                taxCount: widget.tax,
                tipCount: widget.tip,
                infoStyle: infoStyle,
                friendsCount: widget.friends,
                bill: widget.bill),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Total Bill: ",
                    style: infoStyle,
                  ),
                  Text(
                    "\$$bill",
                    style: infoStyle,
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            margin: const EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: 20,
            ),
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                "Everyone should pay \$${(bill / widget.friends).toStringAsFixed(2)}",
                style: infoStyle,
              ),
            ),
          ),
          TextButton(
              onPressed: () => Navigator.pop(context),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.green[400])),
              child: Text(
                "Calculate Again?",
                style: infoStyle.copyWith(color: Colors.white),
              )),
          Expanded(child: Container()),
          Center(
              child: Text(
            "By Ketan Ramteke @theKetan2",
            style: infoStyle.copyWith(fontSize: 15),
          )),
         const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
