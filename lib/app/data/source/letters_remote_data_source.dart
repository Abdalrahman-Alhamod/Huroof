import 'dart:io';
import 'package:dio/dio.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/instance_manager.dart' show Get;
import 'package:huroof/app/data/model/submit_response.dart';
import 'package:huroof/app/data/source/letters_data_source.dart';
import 'package:mime/mime.dart';

import '../../../core/data/model/list_model.dart';
import '../../../core/data/sources/remote/app_url.dart';
import '../../../core/services/api_services.dart';
import '../model/letter.dart';

class LettersRemoteDataSource extends LettersDataSource {
  final ApiServices _apiServices = Get.find<ApiServices>();

  @override
  Future<ListModel<Letter>> getLetters() async {
    final response = await _apiServices.get(AppUrl.listLetters);
    return ListModel.fromJson(
      response,
      (itemJson) => Letter.fromJson(itemJson),
    );
  }

  @override
  Future<Letter> getLetterDetails({required String letterKey}) async {
    final response = await _apiServices.get(AppUrl.letterDetails(letterKey));
    return Letter.fromJson(response);
  }

  @override
  Future<SubmitResponse> submit({
    required String letterKey,
    required String syllalbleKey,
    required String audioPath,
    void Function(int sent, int total)? onSendProgress,
  }) async {

    final file = File(audioPath);
    final fileName = file.path.split('/').last;
    final mimeType = lookupMimeType(file.path) ?? 'application/octet-stream';
    final mimeTypeData = mimeType.split('/');

    final formData = FormData.fromMap({
      'letter_key': letterKey,
      'syllalble_key': syllalbleKey,
      'audio': await MultipartFile.fromFile(
        file.path,
        filename: fileName,
        contentType: DioMediaType(mimeTypeData[0], mimeTypeData[1]),
      ),
    });

    final response = await _apiServices.postFiles(
      AppUrl.submit(letterKey, syllalbleKey),
      formData: formData,
      onSendProgress: onSendProgress,
    );
    
    return SubmitResponse.fromJson(response);
  }
}
