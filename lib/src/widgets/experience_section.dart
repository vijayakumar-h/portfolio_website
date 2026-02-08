import 'package:portfolio_website/src/common_exports.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    final theme = Theme.of(context);

    final experiences = [
      {
        'role': 'Flutter developer',
        'company': 'Repalogic India West Pvt Ltd, Surat',
        'period': 'JUN 2024 - PRESENT',
        'description':
            'Lead developer for Get Your Offer, a location-based digital storefront application. Implemented Google Maps API with custom markers, overlays, and real-time tracking. Designed responsive UI from Figma designs using Material & Cupertino widgets. Integrated multiple REST APIs and optimized app performance across Android & iOS. Managed manual CI/CD, app signing, and store release compliance. Contributed to TYRIOS products (Inventory, eCash, WorkHub).',
      },
      {
        'role': 'Flutter developer',
        'company': 'DeepByte Technology, Bengaluru',
        'period': 'JAN 2023 - APR 2024',
        'description':
            'Developed Liebherr EMT Sales & My Guide apps for catalog access and CRM integration. Built TYRIOS eCash, a secure local voucher terminal system. Implemented TYRIOS Inventory with real-time stock tracking and backend sync. Collaborated with backend & QA teams to deliver stable production builds.',
      },
      {
        'role': 'Flutter developer (Intern)',
        'company': 'DeepByte Technology, Bengaluru',
        'period': 'JULY 2022 - DECEMBER 2022',
        'description':
            'Assisted in developing feature modules for the main product. Gained hands-on experience with Dart, State Management, and API integration.',
      },
      {
        'role': 'Education',
        'company': 'University of Mysore',
        'period': '2019 - 2021',
        'description':
            'Master of Business Administration - Finance (Dec 2021).\nBachelor of Business Management (May 2019).',
      },
    ];

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 100,
        vertical: 80,
      ),
      width: double.infinity,
      color: theme.scaffoldBackgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Experience',
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
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: experiences.length,
            separatorBuilder: (context, index) => const SizedBox(height: 24),
            itemBuilder: (context, index) {
              final exp = experiences[index];
              return Container(
                padding: const EdgeInsets.all(32),
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
                  border: Border(
                    left: BorderSide(color: theme.primaryColor, width: 4),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                exp['role']!,
                                style: GoogleFonts.poppins(
                                  fontSize: isMobile ? 20 : 24,
                                  fontWeight: FontWeight.bold,
                                  color: theme.colorScheme.onSurface,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                exp['company']!,
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: theme.primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (!isMobile)
                          Text(
                            exp['period']!,
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                      ],
                    ),
                    if (isMobile) ...[
                      const SizedBox(height: 8),
                      Text(
                        exp['period']!,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                    const SizedBox(height: 16),
                    Text(
                      exp['description']!,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: theme.colorScheme.onSurfaceVariant,
                        height: 1.6,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
