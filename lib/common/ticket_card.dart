import 'package:flutter/material.dart';
import 'package:hero_ticket_animation/common/FadePageRoute.dart';
import 'package:hero_ticket_animation/common/airport_detail_widget.dart';
import 'package:hero_ticket_animation/common/location_widget.dart';
import 'package:hero_ticket_animation/model/ticket.dart';
import 'package:hero_ticket_animation/pages/ticket_detail.dart';
import 'package:hero_ticket_animation/theme.dart';

class TicketCardWidget extends StatelessWidget {
  final Ticket ticket;
  final bool showQR;

  TicketCardWidget({@required this.ticket, this.showQR = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210.0,
      padding: showQR
          ? const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0)
          : const EdgeInsets.all(0.0),
      child: Material(
        color: primaryColor,
        elevation: showQR ? 8.0 : 0.0,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        child: InkWell(
          onTap: () {
            Navigator.of(context)
                .push(FadePageRoute(widget: TicketDetail(ticket: ticket)));
          },
          child: Container(
            margin: const EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          LocationWidget(
                            stationName: ticket.sourceStation,
                            cityName: ticket.sourceCity,
                            time: ticket.departureTime,
                          ),
                          Spacer(),
                          Icon(
                            Icons.flight_takeoff,
                            color: Colors.white,
                            size: 40.0,
                          ),
                          Spacer(),
                          LocationWidget(
                            stationName: ticket.destinationStation,
                            cityName: ticket.destinationCity,
                            time: ticket.arrivalTime,
                          ),
                        ],
                      ),
                      SizedBox(height: 16.0),
                      Container(
                        height: 0.5,
                        color: Colors.white,
                      ),
                      SizedBox(height: 16.0),
                      AirportDetailWidget(
                        terminal: ticket.terminal,
                        boarding: ticket.boardingTime,
                        game: ticket.game,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10.0),
                showQR
                    ? Hero(
                        tag: "qrcode",
                        child: Image.asset(
                          "images/qrcode.png",
                          width: 80.0,
                          color: Colors.white,
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
