import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile Picture
              CircleAvatar(
                radius: 60,
                backgroundColor: Colors.blueAccent,
                child: CircleAvatar(
                  radius: 55,
                  backgroundImage: AssetImage("lib/1.jpg"),
                ),
              ),
              const SizedBox(height: 16),

              // User Name
              const Text(
                "Ahmed Belhout", // Replace with the user's name
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),

              // Email
              const Text(
                "belhout@gmail.com", // Replace with user's email
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 24),

              // Buttons Section
              _buildButton(
                context: context,
                icon: Icons.edit,
                title: "Edit Profile",
                onTap: () {
                  // Navigate to Edit Profile Page
                },
              ),
              const SizedBox(height: 16),
              _buildButton(
                context: context,
                icon: Icons.bar_chart,
                title: "View Progress",
                onTap: () {
                  // Navigate to Progress Page
                },
              ),
              const SizedBox(height: 16),
              _buildButton(
                context: context,
                icon: Icons.logout,
                title: "Log Out",
                color: Colors.redAccent,
                onTap: () {
                  // Handle logout
                  Navigator.pushReplacementNamed(context, '/login');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton({
    required BuildContext context,
    required IconData icon,
    required String title,
    Color color = Colors.blueAccent,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 28,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}
