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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
    );
  }
}
