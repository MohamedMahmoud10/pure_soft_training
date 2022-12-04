import 'dart:developer';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pure_soft_database/cubit/app_state.dart';
import 'package:pure_soft_database/db/db_helper.dart';
import 'package:pure_soft_database/model/section_model.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());
  List<SectionModel> sectionList = [];

  static AppCubit get(context) => BlocProvider.of(context);

  Future<int> insertData(SectionModel sectionModel) async {
    int response = await DbHelper.createSection(sectionModel.toMap());
    emit(InsertDataSucess());
    getAllSections();
    emit(QueryDataSuccess());
    return response;
  }

  Future<List<SectionModel>> getAllSections() async {
    sectionList = [];
    var result = await DbHelper.allSection();
    sectionList = result.map((data) => SectionModel.fromMap(data)).toList();
    log('$sectionList');
    emit(QueryDataSuccess());
    return sectionList;
  }

  Future<int> deleteSection(int id) async {
    int value = await DbHelper.deleteSection(id);
    emit(DeleteSuccess());
    getAllSections();
    emit(QueryDataSuccess());
    return value;
  }

  Future<int> updateData(SectionModel sectionModel, int id) async {
    int response =
        await DbHelper.updateSection(sectionModel.toMap(), 'id = ?', [id]);
    emit(UpdateSuccess());
    getAllSections();
    emit(QueryDataSuccess());
    return response;
  }

  // File? image;
  // String? imagePicked;
  //
  // Future pickImage() async {
  //   try {
  //     final ImagePicker picker = ImagePicker();
  //     XFile? image;
  //     image = await picker.pickImage(
  //       source: ImageSource.gallery,
  //       maxHeight: 100,
  //       maxWidth: 100,
  //     );
  //     if (image == null) {
  //       null;
  //     }
  //     imagePicked = image!.path;
  //     emit(UploadPhotoSuccess());
  //     return image.path;
  //   } catch (e) {
  //     emit(UploadPhotoError(e.toString()));
  //   }
  // }

  File? image;
  String? imagePicked;
  final pickedFile = ImagePicker();

  Future pickImage(ImageSource source) async {
    var pickedImage = await pickedFile.pickImage(source: source);
    if (pickedImage != null) {
      image = File(pickedImage.path);
      imagePicked = image!.path;
    } else {}
    emit(UploadPhotoSuccess());
    getAllSections();
    emit(QueryDataSuccess());
    return image!.path;
  }
}
