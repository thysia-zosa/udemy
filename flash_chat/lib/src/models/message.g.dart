// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      date: DateTime.parse(json['date'] as String),
      sender: json['sender'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'sender': instance.sender,
      'message': instance.message,
    };
