import 'package:flutter/material.dart';
import 'package:job_app/widgets/notification/notification_card.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  // A sample list of notifications
  final List<Map<String, String>> notifications = [
    {
      'title': 'Learn Python',
      'description': 'Master Python programming with this comprehensive guide.',
      'imagePath': 'assets/Images/python.png',
    },
    {
      'title': 'Flutter Updates',
      'description': 'Discover the latest features in Flutter 3.0.',
      'imagePath': 'assets/Images/python.png',
    },
    {
      'title': 'Dart Tips',
      'description': 'Improve your coding with advanced Dart tips and tricks.',
      'imagePath': 'assets/Images/python.png',
    },
    {
      'title': 'Web Development',
      'description': 'Build stunning websites with modern tools.',
      'imagePath': 'assets/Images/python.png',
    },
    {
      'title': 'AI Revolution',
      'description': 'Explore the future of AI and machine learning.',
      'imagePath': 'assets/Images/python.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  'Never miss an update',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    // Clear all notifications
                    setState(() {
                      notifications.clear();
                    });
                  },
                  child: const Text(
                    'Clear All',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: notifications.isEmpty
                  ? const Center(
                      child: Text(
                        'No notifications available.',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    )
                  : ListView.builder(
                      itemCount: notifications.length,
                      itemBuilder: (context, index) {
                        final notification = notifications[index];
                        return Dismissible(
                          key: Key(notification['title']!),
                          onDismissed: (direction) {
                            setState(() {
                              notifications.removeAt(index);
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  '${notification['title']} dismissed',
                                ),
                              ),
                            );
                          },
                          background: Container(
                            color: Colors.red,
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(left: 16.0),
                            child:
                                const Icon(Icons.delete, color: Colors.white),
                          ),
                          secondaryBackground: Container(
                            color: Colors.red,
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.only(right: 16.0),
                            child:
                                const Icon(Icons.delete, color: Colors.white),
                          ),
                          child: NotificationCard(
                            title: notification['title']!,
                            description: notification['description']!,
                            imagePath: notification['imagePath']!,
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
