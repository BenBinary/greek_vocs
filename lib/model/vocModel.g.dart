// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vocModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

vocModel _$vocModelFromJson(Map<String, dynamic> json) => vocModel(
      id: json['id'] as int?,
      englishVoc: json['englishVoc'] as String?,
      greekVocLatin: json['greekVocLatin'] as String?,
      greekVoc: json['greekVoc'] as String?,
      hardWord: json['hardWord'] as bool?,
      gotWord: json['gotWord'] as bool?,
    );

Map<String, dynamic> _$vocModelToJson(vocModel instance) => <String, dynamic>{
      'id': instance.id,
      'englishVoc': instance.englishVoc,
      'greekVocLatin': instance.greekVocLatin,
      'greekVoc': instance.greekVoc,
      'hardWord': instance.hardWord,
      'gotWord': instance.gotWord,
    };
