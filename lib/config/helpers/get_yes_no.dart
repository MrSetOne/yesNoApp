import 'package:dio/dio.dart';
import 'package:yes_no/domain/entities/message.dart';
import 'package:yes_no/infrastructure/models/yes_no_model.dart';

class GetYesNo {
  final _dio = Dio();

  Future<Message> getYesNo() async {
    final response = await _dio.get('https://yesno.wtf/api');
    final mappedResponse = YesNoModel.fromJson(response.data);
    return mappedResponse.toMessageEntity();
  }
}
