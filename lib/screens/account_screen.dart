import 'package:flutter/material.dart';
import 'package:job_app/widgets/login/country_region_phone_input.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Log in or sign up',
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          // Dismiss the keyboard
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20), // Add some spacing
                Text(
                  'Login via phone number',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: const Color.fromARGB(255, 184, 184, 184),
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                const CountryRegionPhoneInput(),
                const SizedBox(height: 20),
                const Text(
                  'We will call or text you to confirm your number. Standard message and data rates apply.',
                  style: TextStyle(
                      color: Color.fromARGB(255, 143, 142, 142), fontSize: 12),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(116, 238, 21, 1),
                      padding: const EdgeInsets.all(14)),
                  child: const Text(
                    'Continue',
                    style: TextStyle(
                        color: Color.fromARGB(255, 56, 55, 55),
                        fontWeight: FontWeight.w800),
                  ),
                ),
                const SizedBox(height: 30),
                const Row(
                  children: [
                    // Line before "or"
                    Expanded(
                      child: Divider(
                        color: Color.fromARGB(255, 143, 142, 142), // Line color
                        thickness: 1.5, // Line thickness
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'Or',
                        style: TextStyle(
                            color: Color.fromARGB(255, 143, 142, 142),
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Color.fromARGB(255, 143, 142, 142),
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                const OtherLoginOptionButton(
                  loginType: LoginOptions.email,
                ),
                const SizedBox(
                  height: 20,
                ),
                const OtherLoginOptionButton(
                  loginType: LoginOptions.google,
                ),
                const SizedBox(
                  height: 20,
                ),
                const OtherLoginOptionButton(
                  loginType: LoginOptions.apple,
                ),
                const SizedBox(
                  height: 20,
                ),
                const OtherLoginOptionButton(
                  loginType: LoginOptions.facebook,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum LoginOptions {
  google,
  apple,
  email,
  facebook,
}

class OtherLoginOptionButton extends StatelessWidget {
  const OtherLoginOptionButton({super.key, required this.loginType});

  final LoginOptions loginType;

  String get imagePath {
    switch (loginType) {
      case LoginOptions.google:
        return 'assets/Images/search.png'; // Google image path
      case LoginOptions.apple:
        return 'assets/Images/apple.png'; // Apple image path
      case LoginOptions.email:
        return 'assets/Images/mail-inbox-app.png'; // Email image path
      case LoginOptions.facebook:
        return 'assets/Images/facebook.png'; // Facebook image path
      default:
        return ''; // Default path
    }
  }

  String get buttonText {
    switch (loginType) {
      case LoginOptions.google:
        return 'Continue with Google';
      case LoginOptions.apple:
        return 'Continue with Apple';
      case LoginOptions.email:
        return 'Continue with Email';
      case LoginOptions.facebook:
        return 'Continue with Facebook';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        // Handle button press based on loginType
      },
      style: OutlinedButton.styleFrom(
        side:
            const BorderSide(color: Colors.white, width: 0.8), // White outline
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Corner radius
        ),
        padding: const EdgeInsets.symmetric(
            vertical: 16, horizontal: 20), // Adjust padding
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Dynamic logo image based on loginType
          Image.asset(
            imagePath, // Dynamic image path
            height: 22, // Image height
            width: 22, // Image width
          ),
          const SizedBox(width: 8), // Space between the image and text
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                buttonText, // Dynamic text based on loginType
                style: const TextStyle(
                    color: Colors.white, // Text color
                    fontSize: 14,
                    fontWeight: FontWeight.bold // Text style
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
