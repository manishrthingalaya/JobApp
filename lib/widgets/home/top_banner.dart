import 'package:flutter/material.dart';
import 'package:typethis/typethis.dart';

class TopBanner extends StatelessWidget {
  const TopBanner({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = TypeThisController();

    return Card(
      child: SizedBox(
        // height: 300,
        child: Stack(
          children: [
            Image.asset(
              'assets/Images/background1.jpg',
              width: double.infinity, // Set the desired width
              height: 190, // Set the desired height
              fit: BoxFit.cover, // Adjust how the image scales
            ),
            Container(
              width: double.infinity,
              height: 190,
              color: Colors.black.withOpacity(0.9),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'What can you do ?',
                    style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 134, 133, 133),
                        fontWeight: FontWeight.bold),
                  ),
                  const TypeThis(
                    string:
                        'I can write a 100 word of essay on any topic of your choice',
                    speed: 150,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(116, 238, 21, 1),
                    ),
                    child: const Text(
                      'Sell your skills & tools',
                      style: TextStyle(
                          color: Color.fromARGB(255, 56, 55, 55),
                          fontWeight: FontWeight.w800),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
