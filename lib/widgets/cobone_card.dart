import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lilian_tech_task/models/cobone.dart';
import 'package:lilian_tech_task/ui/theme.dart';

class CoboneCard extends StatelessWidget {
  const CoboneCard({super.key,this.onClicked,required this.cobone});
  final VoidCallback? onClicked;
  final Cobone cobone;

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: Material(
        child: InkWell(
          onTap: onClicked,
          child: SizedBox(
            width: Get.width / 1.1,
            // height: 400,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 2,
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(image: Image.network(cobone.imagesPaths?.first ?? "", fit: BoxFit.cover).image,fit: BoxFit.cover)
                      ),
                         )),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Column(
                            children: [
                              Expanded(
                                child: Text(
                                  cobone.title ?? "",
                                  maxLines: 3,
                                  style: const TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.bold,),
                                ),
                              ),
                              Row(
                                children: [
                                  Text("SAR ${(cobone.options!.first.price! * cobone.options!.first.discount! /100).ceil()} ",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                                  Text("${cobone.options!.first.price} ",style: const TextStyle(decoration: TextDecoration.lineThrough,color: Colors.black38),),
                                  Container(
                                    padding: const EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                      color: secondaryColor.withOpacity(0.3),
                                      borderRadius: BorderRadius.circular(30)
                                    ),
                                      child: Text("${cobone.options!.first.discount}%",style: TextStyle(color: secondaryColor),))
                                ],
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: secondaryColor,
                                  borderRadius: BorderRadius.circular(5)
                                ),
                                padding: const EdgeInsets.all(3),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text("${cobone.rate}",style: const TextStyle(color: Colors.white),),
                                    const Icon(Icons.star,color: Colors.white,size: 15,)
                                  ],
                                ),
                              ),
                              Text("${cobone.reviewsNumber} Reviews",)
                          
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
