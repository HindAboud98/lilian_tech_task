import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lilian_tech_task/controllers/cobone_details_screen_controller.dart';
import 'package:lilian_tech_task/ui/theme.dart';
import 'package:lilian_tech_task/widgets/one_option_widget.dart';

class CoboneDetailsScreen extends GetView<CoboneDetailsScreenController> {
  const CoboneDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: InkWell(
          onTap: (){
            Get.back();
          },
          child: CircleAvatar(
            backgroundColor: secondaryColor,
            child: const Icon(Icons.arrow_back_ios_new,color: Colors.white,),
          ),
        ),
        actions: const [
          Icon(Icons.favorite_border,size: 35,),
          Icon(Icons.share,size: 35,),
          Icon(Icons.shopping_cart,size: 35,),
        ],
      ),
      body: ListView(
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.only(bottom: 8),
            child: Column(
              children: [
                CarouselSlider(
                  items: [
                    ...controller.currentCobone!.imagesPaths!.map((c) => Container(
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: Image.network(c, fit: BoxFit.cover).image,
                              fit: BoxFit.cover)),
                    ))
                  ]..shuffle(), options: CarouselOptions(viewportFraction: 1,onPageChanged: (i,r){
                  controller.activeDottedIndex = i;
                }),),
                Obx(() => DotsIndicator(
                  dotsCount: controller.currentCobone!.imagesPaths!.length,
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
              ],
            ),
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${controller.currentCobone!.title}",style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                const SizedBox(height: 15,),
                Text("${controller.currentCobone!.description}"),
                const SizedBox(height: 25,),

                Row(
                  children: [
                    Text("${controller.currentCobone!.rate}",style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                    Icon(controller.currentCobone!.rate! > 0 ? Icons.star : Icons.star_border,color: secondaryColor,),
                    Icon(controller.currentCobone!.rate! > 1 ? Icons.star : Icons.star_border,color: secondaryColor,),
                    Icon(controller.currentCobone!.rate! > 2 ? Icons.star : Icons.star_border,color: secondaryColor,),
                    Icon(controller.currentCobone!.rate! > 3 ? Icons.star : Icons.star_border,color: secondaryColor,),
                    Icon(controller.currentCobone!.rate! > 4 ? Icons.star : Icons.star_border,color: secondaryColor,),
                    Text("(${controller.currentCobone!.reviewsNumber})")
                  ],
                ),
                const SizedBox(height: 10,),

                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: secondaryColor.withOpacity(0.2),
                        border: Border.all(color: secondaryColor),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.schedule,color: secondaryColor,size: 20,),
                          const SizedBox(width: 5,),
                          Text(controller.currentCobone!.isLimited! ? "FOR A LIMITED TIME ONLY" : "NOT LIMITED",style: TextStyle(color: secondaryColor,fontSize: 11),)
                        ],
                      ),
                    ),
                    const SizedBox(width: 25,),
                    Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: secondaryColor.withOpacity(0.2),
                        border: Border.all(color: secondaryColor),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.check,color: secondaryColor,size: 20,),
                          const SizedBox(width: 5,),
                          Text("${controller.currentCobone!.boughtCount} BOUGHT",style: TextStyle(color: secondaryColor,fontSize: 11),)
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.symmetric(vertical: 5),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 8),
                  child: Text("CHOOSE YOUR OPTION",style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold),),
                ),
                ...controller.currentCobone!.options!.map((o) => Column(
                  children: [
                    OneOptionWidget(option: o),
                    controller.currentCobone!.options!.last == o ? const SizedBox() : const Divider()
                  ],
                ))
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.symmetric(vertical: 5),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 8),
                  child: Text("HIGHLIGHTS",style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold),),
                ),
                ...controller.currentCobone!.highlights!.map((h) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Icon(Icons.arrow_forward_ios,size: 10,),
                      ),
                      const SizedBox(width: 8,),
                      Expanded(
                        child: Text(h,overflow: TextOverflow.visible,
                          maxLines: 6,
                          softWrap: true,),
                      )
                    ],
                  ),
                ))
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.symmetric(vertical: 5),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 8),
                  child: Text("CONDITION",style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold),),
                ),
                ...controller.currentCobone!.conditions!.map((h) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Icon(Icons.arrow_forward_ios,size: 10,),
                      ),
                      const SizedBox(width: 8,),
                      Expanded(
                        child: Text(h,overflow: TextOverflow.visible,
                          maxLines: 6,
                          softWrap: true,),
                      )
                    ],
                  ),
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
