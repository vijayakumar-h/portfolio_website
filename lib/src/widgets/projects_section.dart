import 'package:portfolio_website/src/common_exports.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    final theme = Theme.of(context);

    final projects = [
      {
        'title': 'E-Commerce App',
        'description':
            'A full-featured shopping application containing cart, payment gateway integration, and order tracking. Built with Flutter and Firebase.',
        'tags': ['Flutter', 'Firebase', 'Stripe'],
        'image': 'https://via.placeholder.com/600x400',
        'link': 'https://github.com/vijay/ecommerce',
      },
      {
        'title': 'Task Manager',
        'description':
            'Productivity tool for managing daily tasks with reminders and categorization. Features local storage and cloud sync.',
        'tags': ['Flutter', 'SQLite', 'Rest API'],
        'image': 'https://via.placeholder.com/600x400',
        'link': 'https://github.com/vijay/taskmanager',
      },
      {
        'title': 'Social Media Dashboard',
        'description':
            'Analytics dashboard for tracking social media performance. Visualizes data using charts and graphs.',
        'tags': ['Flutter', 'Charts', 'Analytics'],
        'image': 'https://via.placeholder.com/600x400',
        'link': 'https://github.com/vijay/dashboard',
      },
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
          // Section Title
          Text(
            'Featured Projects',
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

          // Projects Grid
          LayoutBuilder(
            builder: (context, constraints) {
              return Wrap(
                spacing: 32,
                runSpacing: 32,
                children: projects.map((project) {
                  final width = isMobile
                      ? constraints.maxWidth
                      : (constraints.maxWidth - 32) / 2;

                  return Container(
                    width: width,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surface,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 20,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Project Image
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            color: theme.primaryColor.withValues(alpha: 0.1),
                            image: DecorationImage(
                              image: NetworkImage(project['image'] as String),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        // Content
                        Padding(
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                project['title'] as String,
                                style: GoogleFonts.poppins(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: theme.colorScheme.onSurface,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                project['description'] as String,
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  color: theme.colorScheme.onSurfaceVariant,
                                  height: 1.6,
                                ),
                              ),
                              const SizedBox(height: 24),
                              Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: (project['tags'] as List<String>)
                                    .map(
                                      (tag) => Chip(
                                        label: Text(
                                          tag,
                                          style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: theme.primaryColor,
                                          ),
                                        ),
                                        backgroundColor: theme.primaryColor
                                            .withValues(alpha: 0.05),
                                        side: BorderSide(
                                          color: theme.primaryColor.withValues(
                                            alpha: 0.2,
                                          ),
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            50,
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                              const SizedBox(height: 24),
                              OutlinedButton.icon(
                                onPressed: () =>
                                    _launchURL(project['link'] as String),
                                icon: const Icon(Icons.open_in_new, size: 18),
                                label: const Text('View Project'),
                                style: OutlinedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
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
