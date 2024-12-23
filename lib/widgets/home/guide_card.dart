import 'package:flutter/material.dart';

class GuideCard extends StatelessWidget {
  const GuideCard({
    super.key,
    required this.imageUrl,
    required this.buttonTitle,
    required this.title,
    required this.subTitle,
  });

  final String imageUrl;
  final String buttonTitle;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      height: 180,
      child: Card(
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        clipBehavior: Clip.hardEdge,
        child: Stack(
          children: [
            Image.asset(
              imageUrl,
              width: double.infinity, // Set image to take the full width
              fit: BoxFit.cover,
            ),
            Container(
              width: double.infinity,
              // height: 190,
              color: Colors.black.withOpacity(0.6),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      subTitle,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(116, 238, 21, 1),
                        minimumSize:
                            const Size(0, 24), // Set the minimum height to 24
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8), // Adjust padding
                      ),
                      child: Text(
                        buttonTitle,
                        style: const TextStyle(
                            fontSize: 10,
                            color: Color.fromARGB(255, 56, 55, 55),
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
