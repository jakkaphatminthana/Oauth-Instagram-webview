// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_gallery_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserGalleryModel _$$_UserGalleryModelFromJson(Map<String, dynamic> json) =>
    _$_UserGalleryModel(
      username: json['username'] as String? ?? '',
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_UserGalleryModelToJson(_$_UserGalleryModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'images': instance.images,
    };
