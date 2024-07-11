import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({super.key,this.child});
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: Get.width / 3,
              height: 7,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15,),
                  color: Colors.black12
              ),
            ),
          ),
          const SizedBox(height: 15,),
          child ?? const SizedBox(),
        ],
      ),
    );
  }
}
