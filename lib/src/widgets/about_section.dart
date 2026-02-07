import 'package:portfolio_website/src/common_exports.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    final theme = Theme.of(context);

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
          // Section Title
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

          // Content
          Flex(
            direction: isMobile ? Axis.vertical : Axis.horizontal,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text Content
              Expanded(
                flex: isMobile ? 0 : 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Flutter Developer with 3+ years of experience building and deploying high-performance cross-platform mobile applications.',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: theme.colorScheme.onSurfaceVariant,
                        height: 1.8,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Strong in Flutter, Dart, Clean Architecture, REST APIs, Google Maps, and app store deployments. Proven ability to translate business requirements and Figma designs into scalable mobile solutions.',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: theme.colorScheme.onSurfaceVariant,
                        height: 1.8,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Here are a few technologies I’ve been working with recently:',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: theme.colorScheme.onSurfaceVariant,
                        height: 1.8,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 24,
                      runSpacing: 12,
                      children: [
                        _buildTechItem('Flutter', theme),
                        _buildTechItem('Dart', theme),
                        _buildTechItem('Firebase', theme),
                        _buildTechItem('Node.js', theme),
                        _buildTechItem('Figma', theme),
                      ],
                    ),
                  ],
                ),
              ),

              if (!isMobile) const SizedBox(width: 60),
              if (isMobile) const SizedBox(height: 48),

              // Image Placeholder (Optional for About)
              Expanded(
                flex: isMobile ? 0 : 2,
                child: Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: theme.primaryColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: theme.primaryColor.withValues(alpha: 0.2),
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.person_outline,
                      size: 64,
                      color: theme.primaryColor.withValues(alpha: 0.5),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTechItem(String label, ThemeData theme) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.arrow_right, color: Color(0xFF5C5C8C), size: 20),
        const SizedBox(width: 4),
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
