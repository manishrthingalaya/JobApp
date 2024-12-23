import 'package:flutter/material.dart';
import 'package:job_app/model/photos.dart';
import 'package:job_app/screens/job_detail_screen.dart';
import 'dart:math'; // Import to use Random

class JobCard extends StatelessWidget {
  const JobCard({
    super.key,
    required this.photoDetail,
    required this.imageUrl,
  });

  final String imageUrl;
  final Photo photoDetail;

  @override
  Widget build(BuildContext context) {
    // Generate a random price between 0 and 50 for the offer price
    final random = Random();
    final randomPrice = random.nextInt(51); // Random number from 0 to 50

    return SizedBox(
      height: 350, // Set the desired height of the card
      child: Card(
        color: Theme.of(context).appBarTheme.backgroundColor,
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => JobDetailScreen(
                  photoDetail: photoDetail,
                ),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Use Image.network for dynamic image loading
              Image.network(
                imageUrl,
                height: 200, // Image height
                width: double.infinity, // Set image to take the full width
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Icon(
                      Icons.broken_image,
                      color: Colors.red,
                      size: 50,
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // Align all text to start
                  children: [
                    Text(
                      'I can deliver personalized Python script for text analysis for \$${randomPrice}.',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      photoDetail.alt,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 141, 139, 139),
                          fontSize: 12),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    // Randomize the "Offer price" value and keep its style consistent
                    Row(
                      children: [
                        const Text(
                          'Offer price',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          '\$${randomPrice}', // Randomized offer price
                          style: const TextStyle(
                              color: Color.fromRGBO(116, 238, 21, 1),
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
