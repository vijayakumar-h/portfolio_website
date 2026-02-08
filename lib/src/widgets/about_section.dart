import 'package:portfolio_website/src/common_exports.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    final theme = Theme.of(context);
    final List<String> aboutMeList = [
      "I'm a passionate Flutter Developer with 3+ years of experience building and deploying high-performance cross-platform mobile applications. My expertise lies in translating business requirements and Figma designs into scalable mobile solutions.",
      'I have a strong background in Clean Architecture, REST APIs, and Google Maps integration. I have successfully led development for location-based applications and contributed to various enterprise solutions.',
      'I am always eager to learn new technologies and improve my skills, currently exploring Python & FastAPI along with active LeetCode DSA practice.',
    ];

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 100,
        vertical: 80,
      ),
      width: double.infinity,
      color: theme.colorScheme.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About Me',
            style: GoogleFonts.poppins(
              fontSize: isMobile ? 32 : 48,
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onSurface,
            ),
          ),
          Container(
            height: 4,
            width: 60,
            margin: const EdgeInsets.only(top: 8, bottom: 48),
            decoration: BoxDecoration(
              color: theme.primaryColor,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Flex(
            crossAxisAlignment: CrossAxisAlignment.start,
            direction: isMobile ? Axis.vertical : Axis.horizontal,
            children: [
              Expanded(
                flex: isMobile ? 0 : 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...aboutMeList.map(
                      (text) => Text(
                        text,
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          color: theme.colorScheme.onSurfaceVariant,
                          height: 1.8,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              if (!isMobile) const SizedBox(width: 60),
              if (isMobile) const SizedBox(height: 48),
            ],
          ),
        ],
      ),
    );
  }
}
