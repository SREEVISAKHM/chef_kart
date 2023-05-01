import 'package:chef_kart/model/home_page_model.dart';
import 'package:chef_kart/view/ingredients/ingredients_view.dart';
import 'package:flutter/material.dart';

class RecommendedCard extends StatelessWidget {
  final Dish dish;
  const RecommendedCard({super.key, required this.dish});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        height: 130,
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Row(
                            children: [
                              Text(
                                dish.name,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              width(5),
                              const Icon(
                                Icons.adjust,
                                color: Colors.green,
                                size: 20,
                              ),
                              width(5),
                              Container(
                                height: 20,
                                width: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.green,
                                ),
                                child: Align(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${dish.rating} ',
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Icon(
                                        Icons.star,
                                        color: Colors.white,
                                        size: 13,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  height(5),
                  Row(
                    children: [
                      Row(
                        children: [
                          const RefrigeratorCard(),
                          width(5),
                          const RefrigeratorCard(),
                          width(5),
                        ],
                      ),
                      width(10),
                      Container(
                        height: 30,
                        width: 1,
                        color: Colors.grey,
                      ),
                      width(10),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => IngredientsView(
                                descripttion: dish.description,
                                rating: dish.rating.toString(),
                              ),
                            ),
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Ingredients',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'View List >',
                              style: TextStyle(
                                  color: Colors.orange,
                                  fontSize: 8,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  height(10),
                  Text(
                    dish.description,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  )
                ],
              ),
            ),
            Align(
              child: SizedBox(
                height: 150,
                width: 150,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(dish.image),
                          ),
                        ),
                        height: 100,
                        width: 150,
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 0,
                      left: 0,
                      child: Align(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.orange),
                          ),
                          height: 40,
                          width: 80,
                          child: const Center(
                            child: Text(
                              'Add +',
                              style:
                                  TextStyle(color: Colors.orange, fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
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

class RefrigeratorCard extends StatelessWidget {
  const RefrigeratorCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Icon(
          Icons.check_box_outline_blank,
          color: Colors.grey,
          size: 15,
        ),
        Icon(
          Icons.check_box_outline_blank,
          color: Colors.grey,
          size: 15,
        ),
        Text(
          'Refrigerator',
          style: TextStyle(color: Colors.black, fontSize: 8),
        )
      ],
    );
  }
}
