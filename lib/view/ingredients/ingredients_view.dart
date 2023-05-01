import 'package:chef_kart/utils/extension.dart';
import 'package:chef_kart/view_model/ingredients_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/response/status.dart';

class IngredientsView extends StatefulWidget {
  final String descripttion, rating;

  const IngredientsView(
      {super.key, required this.descripttion, required this.rating});

  @override
  State<IngredientsView> createState() => _IngredientsViewState();
}

class _IngredientsViewState extends State<IngredientsView> {
  final ingredientsViewModel = IngredientsViewModel();
  @override
  void initState() {
    ingredientsViewModel.fetchDetailPageData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffececec),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
      ),
      body: ChangeNotifierProvider(
        create: (_) => ingredientsViewModel,
        child: Consumer<IngredientsViewModel>(
          builder: (context, value, _) {
            switch (value.detailPageData.status) {
              case Status.loading:
                return const Center(child: CircularProgressIndicator());
              case Status.error:
                return Center(
                    child: Text(value.detailPageData.message.toString()));
              case Status.compleated:
                return Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          height: 200,
                          color: Colors.white,
                          child: Column(
                            children: [
                              height(20),
                              Row(
                                children: [
                                  Text(
                                    value.detailPageData.data!.name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 25,
                                    ),
                                  ),
                                  width(10),
                                  Container(
                                    height: 30,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.green,
                                    ),
                                    child: Align(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            widget.rating,
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
                              ),
                              height(20),
                              Text(
                                widget.descripttion,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20,
                                ),
                              ),
                              height(10),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.access_time_outlined,
                                    color: Colors.black,
                                  ),
                                  width(5),
                                  Text(
                                    value.detailPageData.data!.timeToPrepare,
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        height(5),
                        Expanded(
                          child: ListView(
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                width: MediaQuery.of(context).size.width,
                                color: Colors.white,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    height(10),
                                    const Text(
                                      'Ingredients',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 25,
                                      ),
                                    ),
                                    height(5),
                                    const Text(
                                      'For 2 People',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15,
                                      ),
                                    ),
                                    const Divider(
                                      height: 40,
                                      color: Colors.grey,
                                    ),
                                    ItemTitle(
                                      title: 'Vegitables',
                                      count: value.detailPageData.data!
                                          .ingredients.vegetables.length,
                                    ),
                                    height(10),
                                    ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: value.detailPageData.data!
                                          .ingredients.vegetables.length,
                                      itemBuilder: (_, index) {
                                        var vegitable = value
                                            .detailPageData
                                            .data!
                                            .ingredients
                                            .vegetables[index];
                                        return Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              vegitable.name,
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                              ),
                                            ),
                                            Text(
                                              '${vegitable.quantity} PC',
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ],
                                        ).giveBPadding(padding: 5);
                                      },
                                    ),
                                    height(10),
                                    ItemTitle(
                                      title: 'Spices',
                                      count: value.detailPageData.data!
                                          .ingredients.spices.length,
                                    ),
                                    height(10),
                                    ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: value.detailPageData.data!
                                          .ingredients.spices.length,
                                      itemBuilder: (_, index) {
                                        var spice = value.detailPageData.data!
                                            .ingredients.spices[index];
                                        return Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              spice.name,
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                              ),
                                            ),
                                            Text(
                                              '${spice.quantity} PC',
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ],
                                        ).giveBPadding(padding: 5);
                                      },
                                    ),
                                    height(10),
                                    const Text(
                                      'Appliances',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 25,
                                      ),
                                    ),
                                    height(10),
                                    SizedBox(
                                      height: 150,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        itemCount: value.detailPageData.data!
                                            .ingredients.appliances.length,
                                        itemBuilder: (_, index) {
                                          var appliance = value
                                              .detailPageData
                                              .data!
                                              .ingredients
                                              .appliances[index];
                                          return Container(
                                            width: 90,
                                            decoration: BoxDecoration(
                                                color: const Color(0xfff5f5f5),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Column(
                                              children: [
                                                const SizedBox(
                                                  height: 90,
                                                  width: 80,
                                                  child: Image(
                                                      image: AssetImage(
                                                          'assets/images/fridge.png')),
                                                ),
                                                height(10),
                                                Text(
                                                  appliance.name,
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ).giveRPadding(padding: 5);
                                        },
                                      ),
                                    ),
                                    height(10),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Positioned(
                      right: 0,
                      top: 70,
                      child: SizedBox(
                        height: 170,
                        width: 240,
                        child: Image(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/images/recipie.png'),
                        ),
                      ),
                    ),
                  ],
                );
              default:
                break;
            }
            return const SizedBox();
          },
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

class ItemTitle extends StatelessWidget {
  final String title;
  final int count;
  const ItemTitle({
    super.key,
    required this.title,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$title ($count)',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 22,
          ),
        ),
        width(5),
        const Icon(Icons.arrow_drop_down)
      ],
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
