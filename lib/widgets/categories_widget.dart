import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:lilian_tech_task/widgets/one_category.dart';

import '../ui/theme.dart';

class CategoriesWidget extends StatefulWidget {
  const CategoriesWidget({super.key});

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)
      ),
      child: Column(
        children: [
          CarouselSlider(items: const [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OneCategory(categoryIcon: Icons.stars_outlined, categoryTitle: "New In"),
                    SizedBox(width: 25,),

                    OneCategory(categoryIcon: Icons.car_crash_outlined, categoryTitle: "Auto"),
                    SizedBox(width: 25,),

                    OneCategory(categoryIcon: Icons.volunteer_activism_outlined, categoryTitle: "Best Sellers")
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OneCategory(categoryIcon: IconlyBroken.activity, categoryTitle: "Activities"),
                    SizedBox(width: 25,),
                    OneCategory(categoryIcon: Icons.spa, categoryTitle: "Beauty"),
                    SizedBox(width: 25,),

                    OneCategory(categoryIcon: Icons.fastfood_outlined, categoryTitle: "Food")
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OneCategory(categoryIcon: Icons.beach_access_outlined, categoryTitle: "Getaways"),
                    SizedBox(width: 25,),

                    OneCategory(categoryIcon: IconlyBroken.work, categoryTitle: "Services"),
                    SizedBox(width: 25,),

                    OneCategory(categoryIcon: Icons.coffee_outlined, categoryTitle: "Wellness")
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    OneCategory(categoryIcon: Icons.shopping_bag_outlined, categoryTitle: "Jewellery"),
                    SizedBox(width: 25,),
                    OneCategory(categoryIcon: Icons.square_outlined, categoryTitle: "Visit Makkah"),
                    SizedBox(width: 25,),

                    OneCategory(categoryIcon: Icons.h_mobiledata_outlined, categoryTitle: "Visit Bahrain")
                  ],
                ),
              ],
            ),
          ], options: CarouselOptions(viewportFraction: 1,aspectRatio: 1.2,onPageChanged: (i,c){
            setState(() {
              _currentIndex = i;
            });
          },),),
          DotsIndicator(
            dotsCount: 2,
            position: _currentIndex,
            decorator: DotsDecorator(
              color: secondaryColor.withOpacity(0.3),
              activeColor: secondaryColor,
              spacing: EdgeInsets.zero,
              size: const Size(25, 5),
              activeSize: const Size(25, 5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
