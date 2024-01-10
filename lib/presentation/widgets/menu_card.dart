import 'package:flutter/material.dart';
import 'package:hotel/core/constants.dart';

class MenuCard extends StatefulWidget {
  final String icon;
  final String title;
  final bool divider;
  final Function()? onTap;

  const MenuCard({
    super.key,
    required this.icon,
    required this.title,
    required this.divider,
    required this.onTap,
  });

  @override
  State<MenuCard> createState() => _MenuCardState();
}

class _MenuCardState extends State<MenuCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             Image.asset(
                widget.icon,
                color: black,
                width: 24, height: 24,
              ),
              const SizedBox(
                width: paddin15,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.title, style: MyTextStyle.headLine2(color: black),),
                    Text('Самое необходимое', style: MyTextStyle.headLine3(color: gray),),
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: black,
                size: 24,
              ),
            ],
          ),
          if (widget.divider)
            const Divider(
                thickness: 1, color: grayDivider, indent: 40, endIndent: 5)
        ],
      ),
    );
  }
}
