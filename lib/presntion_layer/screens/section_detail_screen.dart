import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pure_soft_database/cubit/app_cubit.dart';
import 'package:pure_soft_database/cubit/app_state.dart';
import 'package:pure_soft_database/model/section_model.dart';
import 'package:pure_soft_database/presntion_layer/screens/home_screen.dart';
import 'package:pure_soft_database/presntion_layer/screens/update_section.dart';
import 'package:pure_soft_database/size_config.dart';

import '../widgets/action_button.dart';

class SectionDetailScreen extends StatelessWidget {
  final SectionModel sectionModel;
  int? id;

  SectionDetailScreen({Key? key, required this.sectionModel, this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text(
                'تفاصيل القسم ',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
              actions: [
                ActionButton(
                    onPressed: () {
                      cubit.deleteSection(sectionModel.id!);
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()),
                          (route) => false);
                    },
                    icon: const Icon(
                      Icons.delete,
                      size: 25,
                      color: Colors.red,
                    )),
                ActionButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            UpdateSection(sectionModel: sectionModel),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.edit,
                    size: 25,
                    color: Colors.green,
                  ),
                )
              ],
            ),
            body: Padding(
                padding: EdgeInsets.only(top: SizeConfig.screenHeight * 0.01),
                child: SizeConfig.orientation == Orientation.portrait
                    ? SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: SizeConfig.screenWidth * 0.2),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(20.0)),
                                child: Stack(children: <Widget>[
                                  Image.file(File(sectionModel.imagePath!)),
                                ]),
                              ),
                            ),
                            SizedBox(
                              height: SizeConfig.screenHeight * 0.02,
                            ),
                            Text(
                              sectionModel.titleInAr!,
                              style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 2),
                            ),
                            SizedBox(
                              height: SizeConfig.screenHeight * 0.03,
                            ),
                            Text(
                              sectionModel.titleInEn!,
                              style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 2),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: SizeConfig.screenHeight * 0.03,
                                  right: SizeConfig.screenWidth * 0.05,
                                  left: SizeConfig.screenWidth * 0.05),
                              child: ExpansionTile(
                                initiallyExpanded: true,
                                title: const Text('نفاصيل القسم'),
                                children: [
                                  ListTile(
                                    title: Text(sectionModel.desInAr!),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: ExpansionTile(
                                initiallyExpanded: true,
                                title: const Text('Section Details '),
                                children: [
                                  ListTile(
                                    title: Text(sectionModel.desInEn!),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    : SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                FittedBox(
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20.0)),
                                    child: Stack(children: <Widget>[
                                      Image.file(
                                        File(sectionModel.imagePath!),
                                        width: 300,
                                        height: 200,
                                        fit: BoxFit.cover,
                                      ),
                                    ]),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      sectionModel.titleInAr!,
                                      style: const TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 2),
                                    ),
                                    Text(
                                      sectionModel.titleInEn!,
                                      style: const TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 2),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            // SizedBox(
                            //   height: SizeConfig.screenHeight * 0.03,
                            // ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: SizeConfig.screenHeight * 0.03,
                                  right: SizeConfig.screenWidth * 0.05,
                                  left: SizeConfig.screenWidth * 0.05),
                              child: ExpansionTile(
                                initiallyExpanded: true,
                                title: const Text('نفاصيل القسم'),
                                children: [
                                  ListTile(
                                    title: Text(sectionModel.desInAr!),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: ExpansionTile(
                                initiallyExpanded: true,
                                title: const Text('Section Details '),
                                children: [
                                  ListTile(
                                    title: Text(sectionModel.desInEn!),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )));
      },
    );
  }
}
