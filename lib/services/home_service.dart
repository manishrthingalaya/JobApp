import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:job_app/model/photos.dart';

class HomeService {
  static const String _apiKey =
      '1zG66LsQ1CgsFv64lba4QB5VoDBi5kjdop4AUt9VrJAUwN64nxxJS1c7';
  static const String _baseUrl = 'https://api.pexels.com/v1/curated';

  Future<List<Photos>> fetchPhotos() async {
    final response = await http.get(
      Uri.parse('$_baseUrl?per_page=20'),
      headers: {
        'Authorization': _apiKey,
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List photos = data['photos'];
      // final photo = photos.map((photo) => Photo.fromJson(photo)).toList();
      return photos.map((photo) => Photos.fromJson(photo)).toList();
    } else {
      throw Exception('Failed to fetch photos. Error: ${response.statusCode}');
    }
  }

  Future<List<Photo>> fetchPhoto() async {
    final response = await http.get(
      Uri.parse('$_baseUrl?per_page=20'),
      headers: {
        'Authorization': _apiKey,
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List photos = data['photos'];
      // final photo = photos.map((photo) => Photo.fromJson(photo)).toList();
      return photos.map((photo) => Photo.fromJson(photo)).toList();
    } else {
      throw Exception('Failed to fetch photos. Error: ${response.statusCode}');
    }
  }

  Future<List<Photo>> searchPhoto(String query) async {
    final response = await http.get(
      Uri.parse('$_baseUrl?query=$query'),
      headers: {
        'Authorization': _apiKey,
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List photos = data['photos'];
      return photos.map((photo) => Photo.fromJson(photo)).toList();
    } else {
      throw Exception('Failed to fetch photos. Error: ${response.statusCode}');
    }
  }
}
