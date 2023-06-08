import 'package:flutter_riverpod/flutter_riverpod.dart';

final imagesProvider = StateProvider<List<String>>((ref) => []);

final isFetchImageProvider = StateProvider.autoDispose((ref) => false);
