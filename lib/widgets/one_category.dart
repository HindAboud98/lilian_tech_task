import 'package:flutter/material.dart';
import 'package:lilian_tech_task/ui/theme.dart';

class OneCategory extends StatelessWidget {
  const OneCategory({super.key,required this.categoryIcon,required this.categoryTitle});
  final IconData categoryIcon;
  final String categoryTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(15)
          ),
          child: Icon(categoryIcon),
        ),
        const SizedBox(height: 5,),
        Text(categoryTitle,style: const TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.center,)
      ],
    );
  }
}
