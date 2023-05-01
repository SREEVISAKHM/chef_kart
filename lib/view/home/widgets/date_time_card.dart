import 'package:flutter/material.dart';

class DateTimeCard extends StatelessWidget {
  const DateTimeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Stack(
        children: [
          Container(
            color: Colors.black,
            height: 60,
          ),
          Positioned(
            top: 30,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: 90,
                width: MediaQuery.of(context).size.width - 40,
                child: Card(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  color: Colors.white,
                  elevation: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              const Icon(Icons.calendar_month_outlined),
                              width(10),
                              const Text(
                                "21 May 2021",
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                              )
                            ],
                          ),
                        ),
                        const VerticalDivider(
                          indent: 20,
                          endIndent: 20,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              const Icon(Icons.alarm),
                              width(10),
                              const Text(
                                "10:30 PM-12:30 PM",
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox width(double width) {
    return SizedBox(
      width: width,
    );
  }

  SizedBox height(double height) {
    return SizedBox(
      height: height,
    );
  }
}
