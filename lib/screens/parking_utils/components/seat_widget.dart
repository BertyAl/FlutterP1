import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_project1/screens/parking_utils/model/seat.dart';
import 'package:flutter_project1/screens/parking_utils/provider/selection_button_provider.dart';
import 'package:flutter_project1/utils/colors.dart';

class SeatWidget extends StatefulWidget {
  SeatWidget({
    Key? key,
    required this.seatIndex,
    required this.seatType,
    this.searchBarText,
  }) : super(key: ValueKey(seatIndex));

  final int seatIndex;
  final String seatType;

  final String? searchBarText;

  @override
  State<SeatWidget> createState() => _SeatWidgetState();
}

class _SeatWidgetState extends State<SeatWidget> with AutomaticKeepAliveClientMixin<SeatWidget> {
  @override
  bool get wantKeepAlive => true;

  Seat seat = Seat();

  @override
  void initState() {
    super.initState();
    seat = Seat(seatIndex: widget.seatIndex, seatType: widget.seatType);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Consumer<SelectionButtonProvider>(
      builder: (context, provider, child) {
        log("SeatWidget Rebuilt");
        log("Seat ${seat.seatIndex} - ${provider.isSeatSelected(seat)}");
        return GestureDetector(
          onTap: () {
            if (provider.selectedSeats.contains(seat)) {
              provider.removeSeat(seat);
            } else {
              provider.addSeat(seat);
            }
          },
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: (widget.searchBarText == widget.seatIndex.toString()) ? Colors.grey.withOpacity(0.5) : Colors.transparent,
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                ),
              ],
              border: Border.all(
                color: (widget.searchBarText == widget.seatIndex.toString()) ? Colors.grey : Colors.transparent,
                width: 2,
              ),
              color: (provider.selectedSeats.contains(seat)) ? upper1 : greenlUI,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.seatIndex.toString(),
                  style: TextStyle(
                    fontSize: 16,
                    color: (provider.selectedSeats.contains(seat)) ? Colors.black : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  widget.seatType,
                  style: TextStyle(
                    fontSize: 12,
                    color: (provider.selectedSeats.contains(seat)) ? Colors.black : Colors.black,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
