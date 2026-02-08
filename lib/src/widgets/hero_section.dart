import 'package:portfolio_website/src/common_exports.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;
    final theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 100,
        vertical: isMobile ? 60 : 80,
      ),
      width: double.infinity,
      color: theme.colorScheme.surface,
      child: Flex(
        direction: isMobile ? Axis.vertical : Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: isMobile ? 0 : 3,
            child: Column(
              crossAxisAlignment: isMobile
                  ? CrossAxisAlignment.center
                  : CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello, I'm",
                  style: GoogleFonts.poppins(
                    fontSize: isMobile ? 20 : 24,
                    fontWeight: FontWeight.w400,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                Text(
                  'VIJAYAKUMAR H',
                  style: GoogleFonts.poppins(
                    fontSize: isMobile ? 40 : 68,
                    fontWeight: FontWeight.bold,
                    color: theme.primaryColor,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Flutter Developer | 3+ Years Experience',
                  style: GoogleFonts.poppins(
                    fontSize: isMobile ? 18 : 28,
                    fontWeight: FontWeight.w400,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: 600,
                  child: Text(
                    'Flutter Developer with 3+ years of experience building and deploying high-performance cross-platform mobile applications. Strong in Flutter, Dart, Clean Architecture, REST APIs, Google Maps, and app store deployments.',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: theme.colorScheme.onSurfaceVariant,
                      height: 1.6,
                    ),
                  ),
                ),
                const SizedBox(height: 48),
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  alignment: isMobile
                      ? WrapAlignment.center
                      : WrapAlignment.start,
                  children: [
                    ElevatedButton(
                      onPressed: () =>
                          _launchURL('mailto:vijayakumarhonnegowda@gmail.com'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 22,
                        ),
                        backgroundColor: theme.primaryColor,
                        foregroundColor: theme.colorScheme.onPrimary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text('Contact Me'),
                    ),
                    OutlinedButton(
                      onPressed: () => _launchURL(
                        'https://www.linkedin.com/in/vijayakumar-h-b9611319b/',
                      ),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 22,
                        ),
                        side: BorderSide(color: theme.primaryColor, width: 2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'LinkedIn',
                        style: TextStyle(
                          color: theme.primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () =>
                          _launchURL('https://github.com/vijayakumar-h'),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 22,
                        ),
                        side: BorderSide(color: theme.primaryColor, width: 2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'GitHub',
                        style: TextStyle(
                          color: theme.primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          if (!isMobile) const SizedBox(width: 60),
          if (isMobile) const SizedBox(height: 60),

          Expanded(
            flex: isMobile ? 0 : 2,
            child: Container(
              width: 350,
              height: 350,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: theme.colorScheme.surface,
                boxShadow: [
                  BoxShadow(
                    color: theme.primaryColor.withValues(alpha: 0.1),
                    blurRadius: 40,
                    offset: const Offset(0, 20),
                  ),
                ],
                image: const DecorationImage(
                  image: AssetImage('assets/images/person.png'),
                  fit: BoxFit.fitHeight,
                ),
                border: Border.all(color: theme.colorScheme.surface, width: 8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
