import 'package:json_annotation/json_annotation.dart';

part 'vocModel.g.dart';

@JsonSerializable()
class vocModel {

  const vocModel({

    this.englishVoc,
    this.greekVoc,
    this.greekVocLatin,


  });

  final String? englishVoc;
  final String? greekVoc;
  final String? greekVocLatin;



}