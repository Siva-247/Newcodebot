import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.deepPurple,
      ),
      darkTheme: ThemeData(brightness: Brightness.dark),
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _likes = 0;

  void _increaseLikes() {
    setState(() {
      _likes++;
    });
  }

  void _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 5, 5, 8),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 168, 45, 90),
        title: const Text(
          '★ My Profile ★',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            color: Colors.white,
            decoration: TextDecoration.underline,
            decorationStyle: TextDecorationStyle.double,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('lib/assets/siva.png'),
              ),
              const SizedBox(height: 20),
              const Text(
                ' I am Siva Kavitha K, an aspiring Flutter and Python developer with a keen intrest in building user-friendly, cross-platform mobile apps and solving real-world problems using code. with a strong foundation in Dart and python, I enjoy developing elegant mobile UIs in Flutter and working on Python-based projects including automation, data analysis, and machine learning. I am currently sharpening my skills in app developement , API integration, and ML-based systems, aiming to become a full-stock mobile developer. Always curious and open to learning, I am passionate about writing clean, maintainable code and bringing innovative ideas to life through technology.',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                '',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const FaIcon(FontAwesomeIcons.github),
                    onPressed: () => _launchURL('https://github.com/Siva-247'),
                    tooltip: 'GitHub',
                  ),
                  const SizedBox(width: 20),
                  IconButton(
                    icon: const FaIcon(FontAwesomeIcons.linkedin),
                    onPressed: () => _launchURL(
                      'https://www.linkedin.com/in/sivakavitha-kumaresan?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app',
                    ),
                    tooltip: 'LinkedIn',
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: _increaseLikes,
                icon: const Icon(Icons.favorite),
                label: Text('Likes: $_likes'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
