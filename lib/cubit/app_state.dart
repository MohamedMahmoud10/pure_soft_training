abstract class AppStates {}

class AppInitialState extends AppStates {}

class InsertDataSucess extends AppStates {}

class QueryDataSuccess extends AppStates {}

class DeleteSuccess extends AppStates {}

class UpdateSuccess extends AppStates {}

class UploadPhotoSuccess extends AppStates {}

class UploadPhotoError extends AppStates {
  final String error;

  UploadPhotoError(this.error);
}
