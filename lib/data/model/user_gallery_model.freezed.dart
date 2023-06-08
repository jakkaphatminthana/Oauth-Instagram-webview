// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_gallery_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserGalleryModel _$UserGalleryModelFromJson(Map<String, dynamic> json) {
  return _UserGalleryModel.fromJson(json);
}

/// @nodoc
mixin _$UserGalleryModel {
  String get username => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserGalleryModelCopyWith<UserGalleryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserGalleryModelCopyWith<$Res> {
  factory $UserGalleryModelCopyWith(
          UserGalleryModel value, $Res Function(UserGalleryModel) then) =
      _$UserGalleryModelCopyWithImpl<$Res, UserGalleryModel>;
  @useResult
  $Res call({String username, List<String> images});
}

/// @nodoc
class _$UserGalleryModelCopyWithImpl<$Res, $Val extends UserGalleryModel>
    implements $UserGalleryModelCopyWith<$Res> {
  _$UserGalleryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? images = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserGalleryModelCopyWith<$Res>
    implements $UserGalleryModelCopyWith<$Res> {
  factory _$$_UserGalleryModelCopyWith(
          _$_UserGalleryModel value, $Res Function(_$_UserGalleryModel) then) =
      __$$_UserGalleryModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String username, List<String> images});
}

/// @nodoc
class __$$_UserGalleryModelCopyWithImpl<$Res>
    extends _$UserGalleryModelCopyWithImpl<$Res, _$_UserGalleryModel>
    implements _$$_UserGalleryModelCopyWith<$Res> {
  __$$_UserGalleryModelCopyWithImpl(
      _$_UserGalleryModel _value, $Res Function(_$_UserGalleryModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? images = null,
  }) {
    return _then(_$_UserGalleryModel(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserGalleryModel implements _UserGalleryModel {
  _$_UserGalleryModel(
      {this.username = '', final List<String> images = const []})
      : _images = images;

  factory _$_UserGalleryModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserGalleryModelFromJson(json);

  @override
  @JsonKey()
  final String username;
  final List<String> _images;
  @override
  @JsonKey()
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  String toString() {
    return 'UserGalleryModel(username: $username, images: $images)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserGalleryModel &&
            (identical(other.username, username) ||
                other.username == username) &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, username, const DeepCollectionEquality().hash(_images));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserGalleryModelCopyWith<_$_UserGalleryModel> get copyWith =>
      __$$_UserGalleryModelCopyWithImpl<_$_UserGalleryModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserGalleryModelToJson(
      this,
    );
  }
}

abstract class _UserGalleryModel implements UserGalleryModel {
  factory _UserGalleryModel(
      {final String username, final List<String> images}) = _$_UserGalleryModel;

  factory _UserGalleryModel.fromJson(Map<String, dynamic> json) =
      _$_UserGalleryModel.fromJson;

  @override
  String get username;
  @override
  List<String> get images;
  @override
  @JsonKey(ignore: true)
  _$$_UserGalleryModelCopyWith<_$_UserGalleryModel> get copyWith =>
      throw _privateConstructorUsedError;
}
