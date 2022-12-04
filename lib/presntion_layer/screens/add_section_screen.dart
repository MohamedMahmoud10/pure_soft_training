import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pure_soft_database/cubit/app_cubit.dart';
import 'package:pure_soft_database/cubit/app_state.dart';
import 'package:pure_soft_database/model/section_model.dart';
import 'package:pure_soft_database/size_config.dart';

import '../widgets/input_field.dart';
import 'home_screen.dart';

class AddSectionScreen extends StatelessWidget {
  AddSectionScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final titleInArController = TextEditingController();
  final titleInEnController = TextEditingController();
  final desInArController = TextEditingController();
  final desInEnController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'أضافة قسم جديد ',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            var cubit = AppCubit.get(context);
            return Form(
              key: _key,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    InPutField(
                      maxLines: 1,
                      controller: titleInArController,
                      hintText: 'أضافه قسم ',
                      label: const Text(
                        'اسم القسم باللغة العربيه',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'برجاء كتابه اسم القسم ';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                    ),
                    InPutField(
                      maxLines: 1,
                      controller: titleInEnController,
                      hintText: 'أضافه قسم ',
                      label: const Text(
                        'اسم القسم باللغة الأنجليزيه',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'برجاء كتابه اسم القسم ';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                    ),
                    InPutField(
                      maxLines: 5,
                      controller: desInArController,
                      hintText: 'تفاصيل القسم ',
                      label: const Text(
                        'تفاصيل القسم باللغة العربيه',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'برجاء كتابه تفاصيل القسم ';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                    ),
                    InPutField(
                      maxLines: 5,
                      controller: desInEnController,
                      hintText: 'تفاصيل القسم',
                      label: const Text(
                        'تفاصيل القسم باللغة الأنجليزية',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            cubit.pickImage(ImageSource.camera);
                          },
                          child: const Icon(Icons.camera_alt_outlined),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            cubit.pickImage(ImageSource.gallery);
                          },
                          child: const Icon(Icons.photo_outlined),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight * 0.02,
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          if (_key.currentState!.validate()) {
                            int value = await cubit.insertData(SectionModel(
                                titleInAr: titleInArController.text,
                                titleInEn: titleInEnController.text,
                                desInAr: desInArController.text,
                                desInEn: desInEnController.text,
                                imagePath: cubit.imagePicked));
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => const HomeScreen()),
                                (route) => false);
                            log('$value');
                          }
                        },
                        child: const Text('أضافه قسم جديد ')),
                    SizedBox(
                      height: SizeConfig.screenHeight * 0.02,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
