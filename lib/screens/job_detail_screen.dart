import 'package:flutter/material.dart';
import 'package:job_app/model/photos.dart';

class JobDetailScreen extends StatefulWidget {
  final Photo photoDetail;

  const JobDetailScreen({super.key, required this.photoDetail});

  @override
  _JobDetailScreenState createState() => _JobDetailScreenState();
}

class _JobDetailScreenState extends State<JobDetailScreen> {
  bool _isDetailsVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Image at the bottom of the Stack
          Positioned.fill(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _isDetailsVisible =
                      !_isDetailsVisible; // Toggle visibility of the box
                });
              },
              child: Image.network(
                widget.photoDetail.src.original,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // AppBar at the top with transparency
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              title: const Text('Job Details'),
              backgroundColor: Colors.black.withOpacity(0.5),
              elevation: 0,
            ),
          ),

          // Animated box that comes up from the bottom
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            bottom: _isDetailsVisible
                ? 0
                : -MediaQuery.of(context).size.height *
                    0.3, // 30% of the image height
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height *
                  0.3, // 30% of screen height
              color:
                  Colors.black.withOpacity(0.6), // Semi-transparent background
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title for the details
                  const Text(
                    'Photo Details',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Circular profile picture of the photographer
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 24.0,
                        backgroundImage: NetworkImage(
                            widget.photoDetail.src.tiny), // Profile image URL
                      ),
                      const SizedBox(width: 12),
                      // Photographer's name
                      Text(
                        widget.photoDetail.photographer, // Photographer's name
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // Photo description
                  Text(
                    widget.photoDetail.alt, // Description
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 12),

                  Text(
                    widget.photoDetail.photographerUrl, // Description
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
