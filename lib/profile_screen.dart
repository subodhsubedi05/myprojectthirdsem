import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ---------------- RECENTLY PLAYED HEADER ----------------
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Recently played",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: const [
                      Icon(Icons.notifications_outlined, color: Colors.white, size: 24),
                      SizedBox(width: 16),
                      Icon(Icons.history, color: Colors.white, size: 24),
                      SizedBox(width: 16),
                      Icon(Icons.settings_outlined, color: Colors.white, size: 24),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // ---------------- RECENTLY PLAYED ARTISTS ----------------
              Row(
                children: [
                  _buildArtistItem(name: "Lana Del Rey"),
                  const SizedBox(width: 20),
                  _buildArtistItem(name: "Marvin Gaye"),
                ],
              ),
              const SizedBox(height: 30),

              // ---------------- YOUR 2021 IN REVIEW ----------------
              const Text(
                "#SPOTIFYWRAPPED",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                "Your 2021 in review",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: _buildReviewCard(
                      title: "Your Top Songs 2021",
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildReviewCard(
                      title: "Your Artists Revealed",
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // ---------------- EDITOR'S PICKS ----------------
              const Text(
                "Editor’s picks",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: _buildEditorPickCard(
                      subtitle: "Ed Sheeran, Big Sean, Juice WRLD, Post Malone",
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildEditorPickCard(
                      subtitle: "Mitski, Tame Impala, Glass Animals, Charli XCX",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildArtistItem({required String name}) {
    return Column(
      children: [
        ClipOval(
          child: Image.asset(
            'assets/images/img.png',
            width: 90,
            height: 90,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                width: 90,
                height: 90,
                color: Colors.grey,
                child: const Icon(Icons.person, size: 50, color: Colors.white70),
              );
            },
          ),
        ),
        const SizedBox(height: 8),
        Text(
          name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildReviewCard({required String title}) {
    return Container(
      height: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: const DecorationImage(
          image: AssetImage('assets/images/img.png'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.play_circle_fill, color: Colors.white, size: 28),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEditorPickCard({required String subtitle}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            'assets/images/img.png',
            height: 170,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 170,
                color: Colors.grey,
                child: const Center(
                  child: Icon(Icons.music_note, size: 50, color: Colors.white70),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 13,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
