import 'package:json_annotation/json_annotation.dart';

part 'vocModel.g.dart';

@JsonSerializable()
class vocModel {

  const vocModel({

    this.englishVoc,
    this.greekVocLatin,
    this.greekVoc,


  });

  final String? englishVoc;
  final String? greekVocLatin;
  final String? greekVoc;


  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory vocModel.fromJson(Map<String, dynamic> json) => _$vocModelFromJson(json);


  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$vocModelToJson(this);


}