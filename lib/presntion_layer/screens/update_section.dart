import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pure_soft_database/cubit/app_cubit.dart';
import 'package:pure_soft_database/cubit/app_state.dart';
import 'package:pure_soft_database/model/section_model.dart';
import 'package:pure_soft_database/presntion_layer/screens/home_screen.dart';

import '../../size_config.dart';
import '../widgets/input_field.dart';

class UpdateSection extends StatefulWidget {
  final SectionModel sectionModel;

  const UpdateSection({Key? key, required this.sectionModel}) : super(key: key);

  @override
  State<UpdateSection> createState() => _UpdateSectionState();
}

final GlobalKey<FormState> _key = GlobalKey<FormState>();
final titelInArController = TextEditingController();
final titelInEnController = TextEditingController();
final desInArController = TextEditingController();
final desInEnController = TextEditingController();

class _UpdateSectionState extends State<UpdateSection> {
  @override
  void initState() {
    titelInArController.text = widget.sectionModel.titleInAr!;
    titelInEnController.text = widget.sectionModel.titleInEn!;
    desInArController.text = widget.sectionModel.desInAr!;
    desInEnController.text = widget.sectionModel.desInEn!;
    super.initState();
  }

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
            title: const Text(
              'تعديل ',
              style: TextStyle(fontSize: 20),
            ),
            centerTitle: true,
          ),
          body: Form(
            key: _key,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  InPutField(
                    controller: titelInArController,
                    hintText: 'أضافه قسم ',
                    label: const Text('اسم القسم باللغة العربيه'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'برجاء كتابه اسم القسم ';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                  ),
                  InPutField(
                    controller: titelInEnController,
                    hintText: 'أضافه قسم ',
                    label: const Text('اسم القسم باللغة الأنجليزيه'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'برجاء كتابه اسم القسم ';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                  ),
                  InPutField(
                    controller: desInArController,
                    hintText: 'تفاصيل القسم ',
                    label: const Text('تفاصيل القسم باللغة العربيه'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'برجاء كتابه تفاصيل القسم ';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                  ),
                  InPutField(
                    controller: desInEnController,
                    hintText: 'تفاصيل القسم',
                    label: const Text('تفاصيل القسم باللغة الأنجليزية'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'برجاء كتابه تفاصيل القسم ';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.04,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        cubit.pickImage(ImageSource.camera);
                      },
                      child: const Text('Upload Photo')),
                  ElevatedButton(
                      onPressed: () async {
                        if (_key.currentState!.validate()) {
                          int value = await cubit.updateData(
                              SectionModel(
                                  id: widget.sectionModel.id!,
                                  titleInAr: titelInArController.text,
                                  titleInEn: titelInEnController.text,
                                  desInAr: desInArController.text,
                                  desInEn: desInEnController.text,
                                  imagePath: cubit.imagePicked),
                              widget.sectionModel.id!);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen()));
                          log('value====${value}');
                        }
                      },
                      child: const Text('Save'))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
