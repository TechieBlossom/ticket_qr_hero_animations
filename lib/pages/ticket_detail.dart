import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hero_ticket_animation/common/ticket_card.dart';
import 'package:hero_ticket_animation/model/ticket.dart';
import 'package:hero_ticket_animation/theme.dart';
import 'package:after_layout/after_layout.dart';

class TicketDetail extends StatefulWidget {
  final Ticket ticket;

  TicketDetail({@required this.ticket});

  @override
  TicketDetailState createState() {
    return new TicketDetailState();
  }
}

class TicketDetailState extends State<TicketDetail> with AfterLayoutMixin<TicketDetail> {
  bool showCorner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        children: <Widget>[
          SizedBox(height: 50.0),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: InkWell(
                child: Icon(
                  Icons.chevron_left,
                  color: Colors.white,
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
          SizedBox(height: 40.0),
          Hero(
            tag: widget.ticket.id,
            child: TicketCardWidget(
              ticket: widget.ticket,
              showQR: false,
            ),
          ),
          Spacer(),
          Hero(
            tag: "qrcode",
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                getCorners(),
                Image.asset(
                  "images/qrcode.png",
                  width: 140.0,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          SizedBox(height: 80.0),
        ],
      ),
    );
  }

  Widget getCorners() {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 300),
      width: showCorner ? 140 : 80,
      height: showCorner ? 140 : 80,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisSize: showCorner ? MainAxisSize.max : MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              RotatedBox(quarterTurns: 0, child: Image.asset("images/corners.png", width: 25.0,)),
              RotatedBox(quarterTurns: 1, child: Image.asset("images/corners.png", width: 25.0,)),
            ],
          ),
          Spacer(),
          Row(
            mainAxisSize: showCorner ? MainAxisSize.max : MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              RotatedBox(quarterTurns: 3, child: Image.asset("images/corners.png", width: 25.0,)),
              RotatedBox(quarterTurns: 2, child: Image.asset("images/corners.png", width: 25.0,)),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    startTimer();
  }

  startTimer() {
    var duration = Duration(milliseconds: 300);
    Timer(duration, showCorners);
  }

  showCorners() {
    setState(() {
      showCorner = true;
    });
  }
}
