import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_instagram/data/provider/images_provider.dart';
import 'package:flutter_instagram/data/services/instagram.dart';
import 'package:flutter_instagram/presentation/widgets/image_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final InstagramAPI _instagram = InstagramAPI();

  //TODO : Fetch Instagram Images
  Future<void> _fetchInstagramImages() async {
    ref.read(isFetchImageProvider.notifier).state = true;

    try {
      final String authorizationCode =
          await _instagram.getAuthorizationCode(context);
      final String accessToken =
          await _instagram.getAccessToken(authorizationCode);
      final List<String> imageUrls =
          await _instagram.getInstagramImages(accessToken);

      //fetch images data to list
      ref.read(imagesProvider.notifier).state = imageUrls;
      ref.read(isFetchImageProvider.notifier).state = false;
    } catch (e) {
      ref.read(isFetchImageProvider.notifier).state = false;
      print('Failed to fetch Instagram images: $e');
    }
  }

//=================================================================================================================
  @override
  Widget build(BuildContext context) {
    final isFetchImage = ref.watch(isFetchImageProvider);
    final imagesList = ref.watch(imagesProvider);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/images/ig.png',
              width: 24,
              height: 24,
              color: Colors.white,
            ),
            const SizedBox(width: 8),
            const Text('Instagram Gallery'),
          ],
        ),
      ),
      body: isFetchImage
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : imagesList.isEmpty
              ? const Center(
                  child: Text('No image found.'),
                )
              : Padding(
                  padding: const EdgeInsets.all(10),
                  child: GridView.builder(
                    itemCount: imagesList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, // จำนวนคอลัมน์ในกริด
                      crossAxisSpacing: 10.0, // ระยะห่างระหว่างคอลัมน์
                      mainAxisSpacing: 10.0, // ระยะห่างระหว่างแถว
                    ),
                    itemBuilder: (context, index) {
                      final String imageUrl = imagesList[index];
                      return ImageCard(imageUrl: imageUrl);
                    },
                  ),
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: _fetchInstagramImages,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
