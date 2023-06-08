import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_gallery_model.freezed.dart';
part 'user_gallery_model.g.dart';

@freezed
class UserGalleryModel with _$UserGalleryModel {

  factory UserGalleryModel({
    @Default('') String username,
    @Default([]) List<String> images,
  }) = _UserGalleryModel;

  factory UserGalleryModel.fromJson(Map<String, dynamic> json) => _$UserGalleryModelFromJson(json);
}

