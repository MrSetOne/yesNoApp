import 'package:dio/dio.dart';
import 'package:yes_no/domain/entities/message.dart';

class GetYesNo {
  final _dio = Dio();

  Future<Message> getYesNo() async {
    final response = await _dio.get('https://yesno.wtf/api');
    final message = Message(
        message: response.data['answer'],
        sender: Sender.other,
        imageUrl: response.data['image']);
    return message;
  }
}
