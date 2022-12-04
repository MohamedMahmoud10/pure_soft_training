import 'package:flutter/material.dart';
import 'package:pure_soft_database/size_config.dart';

class ActionButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget icon;
  ActionButton({Key? key, required this.onPressed, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      margin: EdgeInsets.all(SizeConfig.screenHeight * 0.005),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: icon,
      ),
    );
  }
}
