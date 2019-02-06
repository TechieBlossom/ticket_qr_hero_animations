import 'package:flutter/material.dart';
import 'package:hero_ticket_animation/theme.dart';

class AirportDetailWidget extends StatelessWidget {
  final String terminal, game, boarding;

  AirportDetailWidget({this.terminal, this.game, this.boarding});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        buildDetailColumn("terminal", terminal),
        Spacer(),
        buildDetailColumn("game", game),
        Spacer(),
        buildDetailColumn("boarding", boarding),
      ],
    );
  }

  Widget buildDetailColumn(String label, String value) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.max,
    children: <Widget>[
      Text(label.toUpperCase(), style: smallTextStyle),
      Text(value, style: smallBoldTextStyle),
    ],
  );
}
