import 'dart:ui';
import 'package:portfolio_website/src/common_exports.dart';

class PortfolioNavigationBar extends StatelessWidget {
  final VoidCallback onAboutTap;
  final VoidCallback onSkillsTap;
  final VoidCallback onExperienceTap;
  final VoidCallback onProjectsTap;
  final VoidCallback onContactTap;
  final ThemeProvider themeProvider;

  const PortfolioNavigationBar({
    super.key,
    required this.onAboutTap,
    required this.onSkillsTap,
    required this.onExperienceTap,
    required this.onProjectsTap,
    required this.onContactTap,
    required this.themeProvider,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    final colorScheme = Theme.of(context).colorScheme;

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          decoration: BoxDecoration(
            color: colorScheme.surface.withValues(alpha: 0.8),
            border: Border(
              bottom: BorderSide(
                color: colorScheme.onSurface.withValues(alpha: 0.1),
                width: 0.5,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (!isMobile)
                Row(
                  children: [
                    _NavItem(
                      label: 'Home',
                      onTap: () {},
                    ), // TODO: Scroll to top
                    const SizedBox(width: 24),
                    _NavItem(label: 'About', onTap: onAboutTap),
                    const SizedBox(width: 24),
                    _NavItem(label: 'Skills', onTap: onSkillsTap),
                    const SizedBox(width: 24),
                    _NavItem(label: 'Work', onTap: onProjectsTap),
                  ],
                )
              else
                Text(
                  'V', // Minimal Logo for Mobile
                  style: GoogleFonts.firaCode(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: colorScheme.primary,
                  ),
                ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: themeProvider.toggleTheme,
                    icon: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      transitionBuilder: (child, anim) => RotationTransition(
                        turns: child.key == const ValueKey('dark')
                            ? Tween<double>(begin: 1, end: 0.75).animate(anim)
                            : Tween<double>(begin: 0.75, end: 1).animate(anim),
                        child: FadeTransition(opacity: anim, child: child),
                      ),
                      child: themeProvider.isDarkMode
                          ? Icon(
                              Icons.light_mode,
                              key: const ValueKey('light'),
                              color: colorScheme.primary,
                            )
                          : Icon(
                              Icons.dark_mode,
                              key: const ValueKey('dark'),
                              color: colorScheme.primary,
                            ),
                    ),
                  ),
                  if (!isMobile) ...[
                    const SizedBox(width: 24),
                    ElevatedButton(
                      onPressed: () {
                        launchUrl(Uri.parse('assets/assets/resume.pdf'));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow,
                        // As per image reference
                        foregroundColor: Colors.black,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      child: const Text(
                        'Download CV',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                  if (isMobile) ...[
                    const SizedBox(width: 16),
                    PopupMenuButton<String>(
                      icon: Icon(Icons.menu, color: colorScheme.primary),
                      color: colorScheme.surface,
                      onSelected: (value) {
                        switch (value) {
                          case 'about':
                            onAboutTap();
                            break;
                          case 'experience':
                            onExperienceTap();
                            break;
                          case 'projects':
                            onProjectsTap();
                            break;
                          case 'skills':
                            onSkillsTap();
                            break;
                          case 'contact':
                            onContactTap();
                            break;
                        }
                      },
                      itemBuilder: (context) => [
                        const PopupMenuItem(
                          value: 'about',
                          child: Text('About'),
                        ),
                        const PopupMenuItem(
                          value: 'experience',
                          child: Text('Experience'),
                        ),
                        const PopupMenuItem(
                          value: 'projects',
                          child: Text('Work'),
                        ),
                        const PopupMenuItem(
                          value: 'skills',
                          child: Text('Skills'),
                        ),
                        const PopupMenuItem(
                          value: 'contact',
                          child: Text('Contact'),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatefulWidget {
  final String label;
  final VoidCallback onTap;

  const _NavItem({required this.label, required this.onTap});

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: InkWell(
        onTap: widget.onTap,
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Text(
            widget.label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: _isHovered ? colorScheme.primary : colorScheme.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}
