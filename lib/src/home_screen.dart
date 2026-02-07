import 'package:portfolio_website/src/common_exports.dart';

class HomeScreen extends StatefulWidget {
  final ThemeProvider themeProvider;

  const HomeScreen({super.key, required this.themeProvider});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AutoScrollController scrollController = AutoScrollController();
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey skillsKey = GlobalKey();
  final GlobalKey experienceKey = GlobalKey();
  final GlobalKey projectsKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: CustomScrollView(
          controller: scrollController,
          slivers: [
            // Navigation Bar
            SliverToBoxAdapter(

              child: PortfolioNavigationBar(
                onAboutTap: () => _scrollToSection(aboutKey),
                onSkillsTap: () => _scrollToSection(skillsKey),
                onExperienceTap: () => _scrollToSection(experienceKey),
                onProjectsTap: () => _scrollToSection(projectsKey),
                onContactTap: () => _scrollToSection(contactKey),
                themeProvider: widget.themeProvider,
              ),
            ),
            // Hero Section
            const SliverToBoxAdapter(child: HeroSection()),
            // About Section
            SliverToBoxAdapter(
              child: Container(key: aboutKey, child: const AboutSection()),
            ),
            // Experience Section
            SliverToBoxAdapter(
              child: Container(
                key: experienceKey,
                child: const ExperienceSection(),
              ),
            ),
            // Projects Section
            SliverToBoxAdapter(
              child: Container(
                key: projectsKey,
                child: const ProjectsSection(),
              ),
            ),
            // Skills Section
            SliverToBoxAdapter(
              child: Container(key: skillsKey, child: const SkillsSection()),
            ),
            // Contact Section
            SliverToBoxAdapter(
              child: Container(key: contactKey, child: const ContactSection()),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
