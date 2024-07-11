import 'package:flutter/material.dart';
import 'package:lilian_tech_task/models/cobone_option.dart';
import '../ui/theme.dart';

class OneOptionWidget extends StatefulWidget {
  const OneOptionWidget({super.key,required this.option});
  final CoboneOption option;

  @override
  State<OneOptionWidget> createState() => _OneOptionWidgetState();
}

class _OneOptionWidgetState extends State<OneOptionWidget> {
  late int _counter;

  @override
  void initState() {
    super.initState();
    _counter = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("${widget.option.title}",style: const TextStyle(fontWeight: FontWeight.bold),),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text("SAR ${(widget.option.price! * widget.option.discount! /100).ceil()} ",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                Text("${widget.option.price} ",style: const TextStyle(decoration: TextDecoration.lineThrough,color: Colors.black38),),
                Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        color: secondaryColor.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(30)
                    ),
                    child: Text("${widget.option.discount}%",style: TextStyle(color: secondaryColor),)),
              ],
            ),
            Row(
              children: [
                IconButton(onPressed: (){
                  setState(() {
                    _counter--;
                  });
                },icon: const Icon(Icons.remove,color: Colors.black12,)),
                const SizedBox(width: 8,),
                Text("$_counter",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                const SizedBox(width: 8,),
                IconButton(onPressed: (){
                  setState(() {
                    _counter++;
                  });
                } ,icon: const Icon(Icons.add_box_outlined,color: Colors.black45,)),
              ],
            )
          ],
        )

      ],
    );
  }
}
