import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:webview_flutter/webview_flutter.dart';

class InstagramAPI {
  static const String appId = '277864101304419';
  static const String appSecret = '115a50c0564fe65a55f793e14e860a0f';
  //หลังจากที่ผู้ใช้อนุญาตให้กับแอปพลิเคชันแล้ว พวกเขาจะถูกนำกลับมายังหน้าไหน
  static const String redirectUri = 'https://github.com/jakkaphatminthana';
  //สิ่งที่ต้องการเข้าถึงข้อมูลของ User
  static const String scope = 'user_profile,user_media';
  //บอก Authorization Server ว่าต้องการให้ return อะไรกลับมา
  static const String responseType = 'code';

  final String initialUrl =
      'https://api.instagram.com/oauth/authorize?client_id=$appId&redirect_uri=$redirectUri&scope=$scope&response_type=code';

  final Dio _dio = Dio();
  late InAppWebViewController webViewController;

  //TODO 1.1: Get Authorization Code
  //Authorization Code = Token ที่เกิดจากการ "อนุญาตสิทธิ์" ของเราให้ Client
  //เพื่อให้ Client นำ Token (Code) นี้ ส่งไปขอ Access Token อีกที
  Future<String> getAuthorizationCode(BuildContext context) async {
    final String code = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => _buildWebview(context, initialUrl),
      ),
    );
    log('code: $code');
    return code;
  }

  //TODO 1.2: Open WebView Instagram
  Widget _buildWebview(BuildContext context, String url) {
    return SafeArea(
      child: InAppWebView(
        //เปิดเว็ปตาม initialUrl
        initialUrlRequest: URLRequest(url: Uri.parse(initialUrl)),
        //เมื่อ WebView ถูกสร้างขึ้นและพร้อมใช้งาน จะเปิดให้ควบคุมจอได้
        onWebViewCreated: (controller) {
          webViewController = controller;
        },
        onLoadStart: (controller, url) {
          //Case 1: User Allow
          if (url.toString().contains('?code=')) {
            final uri = Uri.parse(url.toString());
            final authCode = uri.queryParameters['code'];

            webViewController.stopLoading();
            Navigator.pop(context, authCode);

            //Case 2: User Doesn't Allow
          } else if (url.toString().contains('error=access_denied')) {
            webViewController.stopLoading();
            Navigator.pop(context);
          }
        },
      ),
    );
  }

  //TODO 2: Get Access Token
  Future<String> getAccessToken(String authorizationCode) async {
    const String tokenUrl = 'https://api.instagram.com/oauth/access_token';

    //1.ปั้นฟอร์ม Map data ที่เราจะส่งไปขอ Access token
    final FormData formData = FormData.fromMap({
      'client_id': appId,
      'client_secret': appSecret,
      'grant_type': 'authorization_code',
      'redirect_uri': redirectUri,
      'code': authorizationCode,
    });

    //2.ยิงคำขอออกไป พร้อมกับแนบ Authorization Code
    final Response response = await _dio.post(tokenUrl, data: formData);
    log('getToken response : $response');

    //3.รับข้อมูล access token
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = response.data;
      final String accessToken = responseData['access_token'].toString();
      return accessToken;
    } else {
      throw Exception('Failed to retrieve access token');
    }
  }

  //TODO 3: Get Image data
  Future<List<String>> getInstagramImages(String accessToken) async {
    const String mediaUrl = 'https://graph.instagram.com/me/media';

    //1. get image data from api
    final Response response = await _dio.get(
      mediaUrl,
      queryParameters: {
        'fields': 'id,media_url', //ขอบเขตที่ขอ
        'access_token': accessToken, //token
      },
    );

    //2. mapping data image to List<String>
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = response.data;
      final List<dynamic> mediaData = responseData['data'];
      final List<String> imageUrls =
          mediaData.map<String>((media) => media['media_url']).toList();
      return imageUrls;
    } else {
      throw Exception('Failed to fetch Instagram images');
    }
  }

  //TODO 4: Get Username
  Future<String> getUserData(String accessToken) async {
    const String userDataUrl = 'https://graph.instagram.com/me';

    //1. get user data from api
    final Response response = await _dio.get(
      userDataUrl,
      queryParameters: {
        'fields': 'id,username', //ขอบเขตที่ขอ
        'access_token': accessToken, //token
      },
    );

    //2. return user data
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = response.data;
      final String username = responseData['username'].toString();
      return username;
    } else {
      throw Exception('Failed to fetch Instagram user data');
    }
  }
}
