// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'open_ai_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Message _$MessageFromJson(Map<String, dynamic> json) {
  return _Message.fromJson(json);
}

/// @nodoc
mixin _$Message {
  String? get role => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageCopyWith<Message> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageCopyWith<$Res> {
  factory $MessageCopyWith(Message value, $Res Function(Message) then) =
      _$MessageCopyWithImpl<$Res, Message>;
  @useResult
  $Res call({String? role, String? content});
}

/// @nodoc
class _$MessageCopyWithImpl<$Res, $Val extends Message>
    implements $MessageCopyWith<$Res> {
  _$MessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = freezed,
    Object? content = freezed,
  }) {
    return _then(_value.copyWith(
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MessageImplCopyWith<$Res> implements $MessageCopyWith<$Res> {
  factory _$$MessageImplCopyWith(
          _$MessageImpl value, $Res Function(_$MessageImpl) then) =
      __$$MessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? role, String? content});
}

/// @nodoc
class __$$MessageImplCopyWithImpl<$Res>
    extends _$MessageCopyWithImpl<$Res, _$MessageImpl>
    implements _$$MessageImplCopyWith<$Res> {
  __$$MessageImplCopyWithImpl(
      _$MessageImpl _value, $Res Function(_$MessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = freezed,
    Object? content = freezed,
  }) {
    return _then(_$MessageImpl(
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageImpl implements _Message {
  const _$MessageImpl({this.role, this.content});

  factory _$MessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageImplFromJson(json);

  @override
  final String? role;
  @override
  final String? content;

  @override
  String toString() {
    return 'Message(role: $role, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageImpl &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, role, content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageImplCopyWith<_$MessageImpl> get copyWith =>
      __$$MessageImplCopyWithImpl<_$MessageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageImplToJson(
      this,
    );
  }
}

abstract class _Message implements Message {
  const factory _Message({final String? role, final String? content}) =
      _$MessageImpl;

  factory _Message.fromJson(Map<String, dynamic> json) = _$MessageImpl.fromJson;

  @override
  String? get role;
  @override
  String? get content;
  @override
  @JsonKey(ignore: true)
  _$$MessageImplCopyWith<_$MessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChatCompletionModel _$ChatCompletionModelFromJson(Map<String, dynamic> json) {
  return _ChatCompletionModel.fromJson(json);
}

/// @nodoc
mixin _$ChatCompletionModel {
  String? get model => throw _privateConstructorUsedError;
  List<Message>? get messages => throw _privateConstructorUsedError;
  bool? get stream => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatCompletionModelCopyWith<ChatCompletionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatCompletionModelCopyWith<$Res> {
  factory $ChatCompletionModelCopyWith(
          ChatCompletionModel value, $Res Function(ChatCompletionModel) then) =
      _$ChatCompletionModelCopyWithImpl<$Res, ChatCompletionModel>;
  @useResult
  $Res call({String? model, List<Message>? messages, bool? stream});
}

/// @nodoc
class _$ChatCompletionModelCopyWithImpl<$Res, $Val extends ChatCompletionModel>
    implements $ChatCompletionModelCopyWith<$Res> {
  _$ChatCompletionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = freezed,
    Object? messages = freezed,
    Object? stream = freezed,
  }) {
    return _then(_value.copyWith(
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      messages: freezed == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>?,
      stream: freezed == stream
          ? _value.stream
          : stream // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatCompletionModelImplCopyWith<$Res>
    implements $ChatCompletionModelCopyWith<$Res> {
  factory _$$ChatCompletionModelImplCopyWith(_$ChatCompletionModelImpl value,
          $Res Function(_$ChatCompletionModelImpl) then) =
      __$$ChatCompletionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? model, List<Message>? messages, bool? stream});
}

/// @nodoc
class __$$ChatCompletionModelImplCopyWithImpl<$Res>
    extends _$ChatCompletionModelCopyWithImpl<$Res, _$ChatCompletionModelImpl>
    implements _$$ChatCompletionModelImplCopyWith<$Res> {
  __$$ChatCompletionModelImplCopyWithImpl(_$ChatCompletionModelImpl _value,
      $Res Function(_$ChatCompletionModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = freezed,
    Object? messages = freezed,
    Object? stream = freezed,
  }) {
    return _then(_$ChatCompletionModelImpl(
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      messages: freezed == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>?,
      stream: freezed == stream
          ? _value.stream
          : stream // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatCompletionModelImpl implements _ChatCompletionModel {
  const _$ChatCompletionModelImpl(
      {this.model, final List<Message>? messages, this.stream})
      : _messages = messages;

  factory _$ChatCompletionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatCompletionModelImplFromJson(json);

  @override
  final String? model;
  final List<Message>? _messages;
  @override
  List<Message>? get messages {
    final value = _messages;
    if (value == null) return null;
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? stream;

  @override
  String toString() {
    return 'ChatCompletionModel(model: $model, messages: $messages, stream: $stream)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatCompletionModelImpl &&
            (identical(other.model, model) || other.model == model) &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            (identical(other.stream, stream) || other.stream == stream));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, model,
      const DeepCollectionEquality().hash(_messages), stream);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatCompletionModelImplCopyWith<_$ChatCompletionModelImpl> get copyWith =>
      __$$ChatCompletionModelImplCopyWithImpl<_$ChatCompletionModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatCompletionModelImplToJson(
      this,
    );
  }
}

abstract class _ChatCompletionModel implements ChatCompletionModel {
  const factory _ChatCompletionModel(
      {final String? model,
      final List<Message>? messages,
      final bool? stream}) = _$ChatCompletionModelImpl;

  factory _ChatCompletionModel.fromJson(Map<String, dynamic> json) =
      _$ChatCompletionModelImpl.fromJson;

  @override
  String? get model;
  @override
  List<Message>? get messages;
  @override
  bool? get stream;
  @override
  @JsonKey(ignore: true)
  _$$ChatCompletionModelImplCopyWith<_$ChatCompletionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
