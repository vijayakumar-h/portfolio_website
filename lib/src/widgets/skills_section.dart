import 'package:portfolio_website/src/common_exports.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    final theme = Theme.of(context);

    // Grouped Skills Data
    final skillCategories = [
      {
        'title': 'Core',
        'skills': ['Flutter', 'Dart', 'Firebase', 'REST APIs', 'Google Maps'],
      },
      {
        'title': 'State Management',
        'skills': ['Provider'],
      },
      {
        'title': 'Development Tools',
        'skills': [
          'Git',
          'GitHub',
          'GitLab',
          'IntelliJ Idea',
          'Android Studio',
          'Postman',
          'Swagger',
        ],
      },
      {
        'title': 'Design & Others',
        'skills': ['Material', 'Cupertino', 'Figma', 'Accessibility'],
      },
    ];

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 100,
        vertical: 80,
      ),
      width: double.infinity,
      color: theme.scaffoldBackgroundColor, // Match background
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Title
          Text(
            'Skills',
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

          // Skills Grid
          LayoutBuilder(
            builder: (context, constraints) {
              return Wrap(
                spacing: 24,
                runSpacing: 24,
                children: skillCategories.map((category) {
                  final width = isMobile
                      ? constraints.maxWidth
                      : (constraints.maxWidth - 24) / 2; // 2 columns on desktop

                  return Container(
                    width: width,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surface,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 20,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          category['title'] as String,
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: theme.primaryColor,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Wrap(
                          spacing: 12,
                          runSpacing: 12,
                          children: (category['skills'] as List<String>)
                              .map(
                                (skill) => Chip(
                                  label: Text(
                                    skill,
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      color: theme.colorScheme.onSurfaceVariant,
                                    ),
                                  ),
                                  backgroundColor: theme.primaryColor
                                      .withValues(alpha: 0.1),
                                  side: BorderSide.none,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
