import 'package:flutter_instagram/data/model/user_gallery_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserGalleryNotifier extends StateNotifier<UserGalleryModel> {
  UserGalleryNotifier() : super(UserGalleryModel());

  void setData(String username, List<String> images) {
    state = state.copyWith(username: username, images: images);
  }
}

//============================================================================================================
final userGalleryNotiProvider =
    StateNotifierProvider<UserGalleryNotifier, UserGalleryModel>(
  (ref) => UserGalleryNotifier(),
);

final isFetchImageProvider = StateProvider.autoDispose<bool>((ref) => false);
