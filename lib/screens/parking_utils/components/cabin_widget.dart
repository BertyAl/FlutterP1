import 'package:flutter/material.dart';
import 'package:flutter_project1/screens/parking_utils/components/custom_clip_path.dart';
import 'package:flutter_project1/screens/parking_utils/components/seat_widget.dart';
import 'package:flutter_project1/utils/colors.dart';

class CabinWidget extends StatelessWidget {
  const CabinWidget({
    super.key,
    required this.index,
    this.searchBarText,
  });

  final int index;
  final String? searchBarText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    ClipPath(
                      clipper: MyCustomCliperFromTop(),
                      child: Container(
                        height: 60,
                        width: 340,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: upper1,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Row(
                        children: [
                          SeatWidget(
                            searchBarText: searchBarText,
                            seatIndex: 1 + index * 10,
                            seatType: "Tempat",
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          SeatWidget(
                            searchBarText: searchBarText,
                            seatIndex: 2 + index * 10,
                            seatType: "Tempat",
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          SeatWidget(
                            searchBarText: searchBarText,
                            seatIndex: 3 + index * 10,
                            seatType: "Tempat",
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          SeatWidget(
                            searchBarText: searchBarText,
                            seatIndex: 4 + index * 10,
                            seatType: "Tempat",
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          SeatWidget(
                            searchBarText: searchBarText,
                            seatIndex: 5 + index * 10,
                            seatType: "Tempat",
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(

              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    ClipPath(
                      clipper: MyCustomCliperFromBottom(),
                      child: Container(
                        height: 60,
                        width: 340,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: upper1,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Row(
                        children: [
                          SeatWidget(
                            searchBarText: searchBarText,
                            seatIndex: 10 + index * 10,
                            seatType: "Tempat",
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          SeatWidget(
                            searchBarText: searchBarText,
                            seatIndex: 9 + index * 10,
                            seatType: "Tempat",
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          SeatWidget(
                            searchBarText: searchBarText,
                            seatIndex: 8 + index * 10,
                            seatType: "Tempat",
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          SeatWidget(
                            searchBarText: searchBarText,
                            seatIndex: 7 + index * 10,
                            seatType: "Tempat",
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          SeatWidget(
                            searchBarText: searchBarText,
                            seatIndex: 6 + index * 10,
                            seatType: "Tempat",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // Stack(
                //   alignment: Alignment.bottomCenter,
                //   children: [
                //     ClipPath(
                //       clipper: MyCustomCliperFromBottom(),
                //       child: Container(
                //         height: 60,
                //         width: 72,
                //         decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(4),
                //           color: const Color(0xff80CBFF),
                //         ),
                //       ),
                //     ),
                //     Padding(
                //       padding: EdgeInsets.only(bottom: 5),
                //       child: SeatWidget(
                //         searchBarText: searchBarText,
                //         seatIndex: 8 + index * 8,
                //         seatType: "Tempat",
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 2),
      ],
    );
  }
}
