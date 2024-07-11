import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lilian_tech_task/controllers/tabs_controllers/home_tab_controller.dart';
import 'package:lilian_tech_task/ui/theme.dart';
import 'package:lilian_tech_task/widgets/categories_widget.dart';
import 'package:lilian_tech_task/widgets/cobone_card.dart';

class HomeTab extends GetWidget<HomeTabController> {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
          onTap: controller.onLocationTapped,
          child: Row(
            children: [
              Icon(
                Icons.location_on_sharp,
                color: primaryColor,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "Dubai",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Icon(
                Icons.arrow_drop_down_sharp,
                color: primaryColor,
              ),
            ],
          ),
        ),
        actions: const [
          Icon(
            Icons.notifications,
            size: 35,
          ),
          Icon(
            Icons.shopping_cart_sharp,
            size: 35,
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xffedf2f8),
                hintText: "Search cobone",
                suffixIcon: Icon(Icons.search),
                border: InputBorder.none,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  CarouselSlider(
                      items: [
                    ...controller.cobones.first.imagesPaths!.map((c) => Container(
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                  image: Image.network(c, fit: BoxFit.cover).image,
                                  fit: BoxFit.cover)),
                        ))
                  ]..shuffle(), options: CarouselOptions(viewportFraction: 1,onPageChanged: (i,r){
                    controller.activeDottedIndex = i;
                  }),),
                  Obx(() => DotsIndicator(
                    dotsCount: controller.cobones.first.imagesPaths!.length,
                    position: controller.activeDottedIndex,
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
                  ),),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8,vertical: 10),
                    child: Text("Unmissable Offers",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  ),
                  SizedBox(
                    height: Get.height / 2.5,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        ...controller.cobones.map((c) => CoboneCard(cobone: c,onClicked: (){
                          controller.onCoboneTapped(c);
                        },)),
                      ],
                    ),
                  ),
                  const CategoriesWidget()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
