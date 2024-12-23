import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50), // Add some top padding
            // Profile Picture Section
            CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('assets/Images/profile_picture.png'),
            ),
            const SizedBox(height: 20),
            // Name
            const Text(
              'John Doe',
              style: TextStyle(
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            // Bio
            const Text(
              'Flutter Developer | Tech Enthusiast',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            // Buttons Section
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  // Edit Profile Button
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to Edit Profile
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade800,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.edit, color: Colors.white),
                        SizedBox(width: 10),
                        Text(
                          'Edit Profile',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  // Settings Button
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to Settings
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade800,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.settings, color: Colors.white),
                        SizedBox(width: 10),
                        Text(
                          'Settings',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 120),
            // Social Links Section
            const Text(
              'Follow Me',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.facebook,
                        color: Colors.blue, size: 30),
                    onPressed: () {
                      // Open Facebook Profile
                    },
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.link,
                        color: Colors.blueAccent, size: 30),
                    onPressed: () {
                      // Open LinkedIn Profile
                    },
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.camera_alt,
                        color: Colors.pink, size: 30),
                    onPressed: () {
                      // Open Instagram Profile
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
