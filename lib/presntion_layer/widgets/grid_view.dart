import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pure_soft_database/cubit/app_cubit.dart';
import 'package:pure_soft_database/cubit/app_state.dart';
import 'package:pure_soft_database/presntion_layer/screens/section_detail_screen.dart';

import '../../size_config.dart';
import 'container_content.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return GridView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SizeConfig.orientation == Orientation.portrait
                ? const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  )
                : const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
            itemCount: cubit.sectionList.length,
            itemBuilder: (context, index) {
              log('kkkkkkkkkkk${cubit.sectionList[index]}');
              return InkWell(
                splashColor: Colors.blue,
                borderRadius: SizeConfig.orientation == Orientation.portrait
                    ? BorderRadius.circular(
                        MediaQuery.of(context).devicePixelRatio * 100)
                    : BorderRadius.circular(
                        MediaQuery.of(context).devicePixelRatio * 100),
                child: ContainerContent(
                  sectionModel: cubit.sectionList[index],
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SectionDetailScreen(
                        sectionModel: cubit.sectionList[index],
                      ),
                    ),
                  );
                },
              );
            });
      },
    );
  }
}
