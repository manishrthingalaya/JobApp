import 'package:flutter/material.dart';

class CountryRegionPhoneInput extends StatelessWidget {
  const CountryRegionPhoneInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(4.0),
      // height: 200,
      decoration: BoxDecoration(
        color: Theme.of(context).appBarTheme.backgroundColor,

        border:
            Border.all(color: Colors.grey, width: 1), // Border color and width
        borderRadius: BorderRadius.circular(12), // Corner radius
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 3), // Shadow position
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Country/Region Dropdown
          // const SizedBox(height: 8),
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              border: InputBorder.none,
            ),
            items: const [
              DropdownMenuItem(
                value: "US",
                child: Text(
                  "United States",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              DropdownMenuItem(
                value: "IN",
                child: Text(
                  "India",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              DropdownMenuItem(
                  value: "UK",
                  child: Text(
                    "United Kingdom",
                    style: TextStyle(color: Colors.white),
                  )),
            ],
            onChanged: (value) {
              // Handle country/region selection
            },
            hint: const Text(
              "Select your country",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // const SizedBox(height: 8),
          const Divider(
            color: Colors.grey,
            thickness: 1, // Thickness of the line
            height: 16, // Space around the divider
          ),
          const TextField(
            keyboardType: TextInputType.phone,
            style: TextStyle(color: Colors.white),
            // maxLength: 10,
            decoration: InputDecoration(
              hintText: "Phone number",
              hintStyle: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              labelStyle: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              border: InputBorder.none, // Removes the underline
            ),
          ),
        ],
      ),
    );
  }
}
