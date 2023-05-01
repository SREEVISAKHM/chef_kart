import 'package:chef_kart/data/response/status.dart';
import 'package:chef_kart/utils/extension.dart';
import 'package:chef_kart/view/home/widgets/date_time_card.dart';
import 'package:chef_kart/view/home/widgets/popular_dish_card.dart';
import 'package:chef_kart/view/home/widgets/recipie_card.dart';
import 'package:chef_kart/view/home/widgets/recommended_card.dart';
import 'package:chef_kart/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeViewModel homeViewModel = HomeViewModel();
  @override
  void initState() {
    homeViewModel.fetchHomeData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: false,
        title: const Text(
          'Select Dishes',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 17,
          ),
        ),
      ),
      body: ChangeNotifierProvider(
        create: (_) => homeViewModel,
        child: Consumer<HomeViewModel>(
          builder: (context, value, _) {
            switch (value.homePageData.status) {
              case Status.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );

              case Status.compleated:
                return Column(
                  children: [
                    const DateTimeCard(),
                    height(20),
                    const RecipieCard().giveLPadding(padding: 10),
                    height(20),
                    PopularDishes(
                        popularDishes: value.homePageData.data!.popularDishes),
                    height(10),
                    Expanded(
                      child: ListView.builder(
                        itemCount: value.homePageData.data!.dishes.length,
                        itemBuilder: (_, index) {
                          return index == 0
                              ? Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: const [
                                            Text(
                                              'Recommended',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Icon(
                                              Icons.arrow_drop_down,
                                              color: Colors.black,
                                              size: 25,
                                            ),
                                          ],
                                        ),
                                        Container(
                                          height: 35,
                                          width: 80,
                                          decoration: BoxDecoration(
                                            boxShadow: const [
                                              BoxShadow(
                                                  color: Colors.black54,
                                                  blurRadius: 2,
                                                  offset: Offset(1, 1),
                                                  spreadRadius: 1)
                                            ],
                                            color: Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: const Center(
                                            child: Text(
                                              'Menu',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    height(20),
                                    RecommendedCard(
                                      dish: value
                                          .homePageData.data!.dishes[index],
                                    ),
                                    const Divider(
                                      color: Colors.grey,
                                    ),
                                  ],
                                )
                                  .giveHPadding(padding: 10)
                                  .giveBPadding(padding: 5)
                              : Column(
                                  children: [
                                    RecommendedCard(
                                      dish: value
                                          .homePageData.data!.dishes[index],
                                    )
                                        .giveHPadding(padding: 10)
                                        .giveBPadding(padding: 5),
                                    const Divider(
                                      color: Colors.grey,
                                    ),
                                  ],
                                );
                        },
                      ),
                    )
                  ],
                );
              case Status.error:
                return Center(
                  child: Text(value.homePageData.message.toString()),
                );
              default:
                break;
            }

            return const SizedBox();
          },
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: const Color(0xff1C1C1C),
          borderRadius: BorderRadius.circular(8),
        ),
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Icon(
              Icons.food_bank_rounded,
              color: Colors.white,
            ),
            Text(
              '3 food items selected',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
          ],
        ),
      ).giveHPadding(padding: 70).giveBPadding(padding: 10),
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
