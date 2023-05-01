import 'package:flutter/material.dart';

class RecipieCard extends StatelessWidget {
  const RecipieCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.amber.withOpacity(0.1),
                border: Border.all(color: Colors.orange),
                borderRadius: BorderRadius.circular(20),
              ),
              width: 70,
              child: const Center(
                child: Text(
                  'Italian',
                  style: TextStyle(color: Colors.orange),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
