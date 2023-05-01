import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../model/home_page_model.dart';

class PopularDishes extends StatelessWidget {
  final List<PopularDish> popularDishes;
  const PopularDishes({super.key, required this.popularDishes});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.black12,
          offset: Offset(0, 1),
        ),
      ]),
      height: 150,
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          height(10),
          const Text(
            'Popular Dishes',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          height(10),
          SizedBox(
            height: 80,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: popularDishes.length,
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    height: 70,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.orange),
                    ),
                    child: Align(
                      child: Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(popularDishes[index].image),
                          ),
                        ),
                        height: 75,
                        width: 85,
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                          child: Container(
                            height: 75,
                            width: 85,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white.withOpacity(.1),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Center(
                                child: Text(
                                  popularDishes[index]
                                      .name
                                      .replaceAll(" ", '\n'),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
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
