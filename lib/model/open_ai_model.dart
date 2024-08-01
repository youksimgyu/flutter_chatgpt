import 'package:freezed_annotation/freezed_annotation.dart';

part 'open_ai_model.freezed.dart';
part 'open_ai_model.g.dart';

@freezed
class Message with _$Message {
  const factory Message({String? role, String? content}) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
}

@freezed
class ChatCompletionModel with _$ChatCompletionModel {
  const factory ChatCompletionModel({
    String? model,
    List<Message>? messages,
    bool? stream,
  }) = _ChatCompletionModel;

  factory ChatCompletionModel.fromJson(Map<String, dynamic> json) =>
      _$ChatCompletionModelFromJson(json);
}
