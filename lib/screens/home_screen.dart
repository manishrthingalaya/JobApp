import 'dart:io';
import 'package:flutter/material.dart';
import 'package:job_app/model/photos.dart';
import 'package:job_app/widgets/home/guide_card.dart';
import 'package:job_app/widgets/home/job_card.dart';
import 'package:job_app/widgets/home/top_banner.dart';
import 'package:job_app/services/home_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeService _homeService = HomeService();
  late Future<List<Photo>> _jobPictures;

  @override
  void initState() {
    super.initState();
    // jobPictures = _fetchPhotosWithErrorHandling();
    _jobPictures = _fetchPhotoWithErrorHandling();
  }

  Future<List<Photo>> _fetchPhotoWithErrorHandling() async {
    try {
      return await _homeService.fetchPhoto();
    } catch (e) {
      _showErrorPopup(context, e.toString());
      return [];
    }
  }

  void _showErrorPopup(BuildContext context, String error) {
    // Determine the platform
    String message = Platform.isIOS
        ? "An error occurred. Please try again later on your iOS device."
        : "An error occurred. Please try again later on your Android device.";

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(
            message,
            style: const TextStyle(color: Colors.white),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<Photo>>(
          future: _jobPictures,
          builder: (cntx, data) {
            if (data.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (data.hasError) {
              return const Center(child: Text('Failed to load photos.'));
            } else if (data.hasData) {
              final photos = data.data!;
              if (photos.isEmpty) {
                return const Center(child: Text('No photos available.'));
              }
              return ListView.builder(
                itemCount: photos.length + 3,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return const TopBanner();
                  } else if (index == 1) {
                    return const GuideCard(
                      imageUrl: 'assets/Images/meeting1.jpg',
                      buttonTitle: 'Explore video creators',
                      title:
                          'Unleash your brands visual impact with expert video creators',
                      subTitle: 'Discover Tap video Creators on 5 Doller jobs',
                    );
                  } else if (index == 2) {
                    return const GuideCard(
                      imageUrl: 'assets/Images/meeting2.jpg',
                      buttonTitle: 'Explore work Assistants',
                      title:
                          'Harness the power of AI to Boost your productivity.',
                      subTitle: 'Hire AI-Powered work Assistants for 5 Dollers',
                    );
                  } else {
                    return JobCard(
                      imageUrl: photos[index - 3].src.original,
                      photoDetail: photos[index - 3],
                    );
                  }
                },
              );
            } else {
              return const Center(child: Text('Unknown error.'));
            }
          },
        ),
      ),
    );
  }
}
