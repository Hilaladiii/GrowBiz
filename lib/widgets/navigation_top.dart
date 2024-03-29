import 'package:flutter/material.dart';
import 'package:hackfest_mobile/styles/my_colors.dart';
import 'package:hackfest_mobile/styles/my_text.dart';

class NavigationTop extends StatefulWidget {
  NavigationTop({super.key, required this.label, required this.selected, required this.id});
  String label;
  int selected;
  int id;

  @override
  State<NavigationTop> createState() => _NavigationTopState();
}

class _NavigationTopState extends State<NavigationTop> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(widget.label, style: MyTextStyle.judulH4(color: widget.selected==widget.id ? MyColors.blackBase : MyColors.grey200),),
        const SizedBox(height: 5,),
        Container(
          width: MediaQuery.of(context).size.width/2,
          height: 3,
          color: widget.selected==widget.id ? MyColors.primaryBase : MyColors.neutral,
        )
      ],
    );
  }
}
