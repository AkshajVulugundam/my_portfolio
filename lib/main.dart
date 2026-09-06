import 'package:flutter/material.dart';

void main() {
  runApp(const MyPortfolioApp());
}

class MyPortfolioApp extends StatelessWidget {
  const MyPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Portfolio',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF3F51B5),
        ),
      ),
      home: const HomePage(),
    );
  }
}

// ============================================================
// COMMON APP BAR
// ============================================================

AppBar portfolioAppBar(
    BuildContext context,
    String title, {
      bool showBack = true,
    }) {
  return AppBar(
    backgroundColor: const Color(0xFF3F51B5),
    foregroundColor: Colors.white,
    automaticallyImplyLeading: showBack,
    centerTitle: true,
    title: Text(
      title,
      style: const TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

// ============================================================
// COMMON BUTTON
// ============================================================

Widget portfolioButton(
    BuildContext context,
    String title,
    Widget page,
    ) {
  return SizedBox(
    width: 200,
    height: 48,
    child: ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => page,
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF3F51B5),
        foregroundColor: Colors.white,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

// ============================================================
// HOME PAGE
// ============================================================

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: portfolioAppBar(
        context,
        'My Portfolio',
        showBack: false,
      ),

      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(25),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              // Profile placeholder
              Container(
                width: 160,
                height: 160,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFE8EAF6),
                ),
                child: const Icon(
                  Icons.person,
                  size: 90,
                  color: Color(0xFF3F51B5),
                ),
              ),

              const SizedBox(height: 25),

              const Text(
                'Akshaj Vulugundam',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF303F9F),
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'B.Tech 3rd Year • Computer Science',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                ),
              ),

              const SizedBox(height: 35),

              portfolioButton(
                context,
                'About Me',
                const AboutPage(),
              ),

              const SizedBox(height: 15),

              portfolioButton(
                context,
                'Projects',
                const ProjectsPage(),
              ),

              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================
// ABOUT PAGE
// ============================================================

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  Widget sectionCard({
    required IconData icon,
    required String title,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(25),

      decoration: BoxDecoration(
        color: const Color(0xFFE8EAF6),
        borderRadius: BorderRadius.circular(18),

        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: Offset(0, 5),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          Row(
            children: [

              Icon(
                icon,
                size: 32,
                color: const Color(0xFF3F51B5),
              ),

              const SizedBox(width: 12),

              Text(
                title,
                style: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF303F9F),
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          child,
        ],
      ),
    );
  }

  Widget skillChip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),

        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),

      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Color(0xFF303F9F),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: portfolioAppBar(
        context,
        'About Me',
      ),

      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(25),

          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 1000,
            ),

            child: Column(
              children: [

                // ------------------------------------------------
                // ABOUT ME
                // ------------------------------------------------

                sectionCard(
                  icon: Icons.person,
                  title: 'About Me',

                  child: const Text(
                    "Hello! I'm Akshaj Vulugundam, a passionate Computer Science "
                        "Engineering student interested in software development, "
                        "cybersecurity and emerging technologies. I enjoy "
                        "building practical projects, exploring new technologies "
                        "and continuously improving my technical skills.",
                    style: TextStyle(
                      fontSize: 18,
                      height: 1.6,
                      color: Colors.black87,
                    ),
                  ),
                ),

                // ------------------------------------------------
                // SKILLS
                // ------------------------------------------------

                sectionCard(
                  icon: Icons.code,
                  title: 'Skills',

                  child: Wrap(
                    spacing: 10,
                    runSpacing: 12,

                    children: [

                      skillChip('Python'),
                      skillChip('Java'),
                      skillChip('C / C++'),
                      skillChip('Dart'),
                      skillChip('Flutter'),
                      skillChip('SQL'),
                      skillChip('Git & GitHub'),
                      skillChip('Machine Learning'),
                      skillChip('Computer Networks'),
                    ],
                  ),
                ),

                // ------------------------------------------------
                // AREAS OF EXPERTISE
                // ------------------------------------------------

                sectionCard(
                  icon: Icons.psychology,
                  title: 'Areas of Expertise',

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [

                      expertiseItem(
                        'Cybersecurity',
                        'Security fundamentals, networking, '
                            'threat awareness and secure systems.',
                      ),

                      expertiseItem(
                        'Machine Learning',
                        'Building and experimenting with ML models '
                            'for practical problems.',
                      ),

                      expertiseItem(
                        'Computer Networks',
                        'Understanding networking concepts, '
                            'protocols and network communication.',
                      ),

                      expertiseItem(
                        'Software Development',
                        'Developing applications and solving '
                            'problems using modern programming technologies.',
                      ),

                      expertiseItem(
                        'AI & Emerging Technologies',
                        'Exploring artificial intelligence and '
                            'technology-driven solutions.',
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 5),

                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3F51B5),
                    foregroundColor: Colors.white,

                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 13,
                    ),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),

                  child: const Text(
                    'Back to Home',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget expertiseItem(
      String title,
      String description,
      ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          const Padding(
            padding: EdgeInsets.only(top: 5),

            child: Icon(
              Icons.check_circle,
              size: 20,
              color: Color(0xFF3F51B5),
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 17,
                  height: 1.5,
                  color: Colors.black87,
                ),

                children: [

                  TextSpan(
                    text: '$title\n',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF303F9F),
                    ),
                  ),

                  TextSpan(
                    text: description,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// PROJECTS PAGE
// ============================================================

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  Widget projectCard({
    required String title,
    required String description,
    required String technology,
  }) {
    return Container(
      width: double.infinity,

      margin: const EdgeInsets.only(
        bottom: 20,
      ),

      padding: const EdgeInsets.all(25),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),

        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: Offset(0, 5),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          Text(
            title,

            style: const TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
              color: Color(0xFF303F9F),
            ),
          ),

          const SizedBox(height: 12),

          Text(
            description,

            style: const TextStyle(
              fontSize: 17,
              height: 1.5,
              color: Colors.black87,
            ),
          ),

          const SizedBox(height: 15),

          Text(
            technology,

            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: portfolioAppBar(
        context,
        'My Projects',
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 1100,
            ),

            child: Column(
              children: [

                projectCard(
                  title: 'Deepfake Audio Detection',

                  description:
                  'A lightweight deepfake audio detection model '
                      'using Mel-Spectrogram features and a CNN. '
                      'Trained on the ASVspoof 2019 Logical Access '
                      'dataset to classify audio as bonafide or spoof. '
                      'Achieved 99.6% validation accuracy on 25,380 '
                      'audio samples.',

                  technology:
                  'Python • PyTorch • Librosa • Scikit-learn • Google Colab',
                ),

                projectCard(
                  title: 'Disaster Relief Coordination System',

                  description:
                  'A technology-driven disaster relief system '
                      'designed to coordinate emergency requests, '
                      'resources, volunteers and assistance during '
                      'disaster situations.',

                  technology:
                  'Python • AI • Multi-Agent Systems',
                ),

                projectCard(
                  title: 'Weather Forecast Application',

                  description:
                  'A weather application designed to provide '
                      'real-time weather information through a simple '
                      'and user-friendly interface.',

                  technology:
                  'Java • API Integration',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

