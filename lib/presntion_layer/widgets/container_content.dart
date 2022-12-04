import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pure_soft_database/model/section_model.dart';

import '../../size_config.dart';

class ContainerContent extends StatelessWidget {
  final SectionModel sectionModel;

  const ContainerContent({Key? key, required this.sectionModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).devicePixelRatio * 6),
      child: Container(
        width: SizeConfig.screenWidth * 0.7,
        height: SizeConfig.screenHeight * 0.7,
        decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: Colors.blue),
            borderRadius: SizeConfig.orientation == Orientation.portrait
                ? BorderRadius.circular(
                    MediaQuery.of(context).devicePixelRatio * 100)
                : BorderRadius.circular(
                    MediaQuery.of(context).devicePixelRatio * 100)),
        child: ClipRRect(
            borderRadius: SizeConfig.orientation == Orientation.portrait
                ? BorderRadius.circular(
                    MediaQuery.of(context).devicePixelRatio * 100)
                : BorderRadius.circular(
                    MediaQuery.of(context).devicePixelRatio * 100),
            child: Stack(
              children: [
                Image.file(
                  File(
                    sectionModel.imagePath!,
                  ),
                  width: SizeConfig.screenWidth * 0.5,
                  height: SizeConfig.screenHeight * 0.5,
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                  colorBlendMode: BlendMode.darken,
                  color: Colors.grey.withOpacity(0.2),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    sectionModel.titleInAr!,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).textScaleFactor * 22,
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
