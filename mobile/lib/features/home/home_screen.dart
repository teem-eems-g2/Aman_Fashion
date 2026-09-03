import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/constants/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Exact sampled hex constants from UI_design.png
  static const Color scaffoldBg = Color(0xFFF7F1EA);
  static const Color heroCardBg = Color(0xFF232F1F);
  static const Color heroGoldBtn = Color(0xFFCBAF7E);
  static const Color categoryCircleBg = Color(0xFFF7F1EA);
  static const Color categoryBorderAndIcon = Color(0xFF181818);
  static const Color bottomNavBg = Color(0xFF101110);
  static const Color navActiveGold = Color(0xFFCBAF7E);
  static const Color navInactiveWhite = Color(0xA6FFFFFF);

  final List<Map<String, dynamic>> _categories = const [
    {
      'name': 'T-Shirts',
      'icon': Icons.checkroom_outlined,
    },
    {
      'name': 'Shirts',
      'icon': Icons.dry_cleaning_outlined,
    },
    {
      'name': 'Pants',
      'icon': Icons.straighten_outlined,
    },
    {
      'name': 'Jackets',
      'icon': Icons.layers_outlined,
    },
    {
      'name': 'Hoodies',
      'icon': Icons.accessibility_new_outlined,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBg,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            // Home Content
            SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 120),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),
                  // 1. Top Bar: Greeting + Search Icon (Black text)
                  _buildTopBar(context),
                  const SizedBox(height: 18),

                  // 2. Hero Section: Two separate stacked cards (image on top, solid card below)
                  _buildHeroSection(context),
                  const SizedBox(height: 24),

                  // 3. Categories Section: Outlined circles with sampled colors
                  _buildCategoriesSection(context),
                ],
              ),
            ),

            // 4. Floating Pill Bottom Navigation Bar with exact sampled colors & active highlight
            Positioned(
              left: 24,
              right: 24,
              bottom: 24,
              child: _buildFloatingBottomNav(context),
            ),
          ],
        ),
      ),
    );
  }

  // 1. Top Bar with pure Black text
  Widget _buildTopBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Hello, Style',
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: categoryBorderAndIcon,
                    ),
                  ),
                  const SizedBox(width: 6),
                  const Text('👋', style: TextStyle(fontSize: 18)),
                ],
              ),
              const SizedBox(height: 2),
              Text(
                'Find your perfect look',
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: AppColors.greyDark,
                ),
              ),
            ],
          ),
          // Search Icon Button
          InkWell(
            onTap: () => context.push('/search'),
            borderRadius: BorderRadius.circular(24),
            child: Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.greyLight, width: 1.2),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black.withValues(alpha: 0.04),
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: const Icon(
                Icons.search_rounded,
                color: categoryBorderAndIcon,
                size: 22,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 2. Hero Section: Two separate stacked elements
  Widget _buildHeroSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          // 2a. Top element: Plain photo image block
          Container(
            height: 240,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withValues(alpha: 0.08),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.asset(
              'assets/images/hero_model.jpg',
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
          const SizedBox(height: 12),

          // 2b. Bottom element: Solid dark-green card (sampled hex #232F1F)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
            decoration: BoxDecoration(
              color: heroCardBg,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: AppColors.forestGreenDark.withValues(alpha: 0.2),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Plain text: NO pill container or border background
                    Text(
                      'NEW COLLECTION',
                      style: GoogleFonts.poppins(
                        color: heroGoldBtn,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.5,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'SUMMER\nVIBES',
                      style: GoogleFonts.poppins(
                        color: AppColors.cream,
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        height: 1.1,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 8),
                    InkWell(
                      onTap: () => context.push('/categories'),
                      child: Text(
                        'Explore Now',
                        style: GoogleFonts.poppins(
                          color: AppColors.cream,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                // Circular gold arrow button (sampled hex #CBAF7E)
                InkWell(
                  onTap: () => context.push('/categories'),
                  borderRadius: BorderRadius.circular(22),
                  child: Container(
                    width: 44,
                    height: 44,
                    decoration: const BoxDecoration(
                      color: heroGoldBtn,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.arrow_forward_rounded,
                      size: 20,
                      color: categoryBorderAndIcon,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 3. Categories Section: Outlined circles (sampled bg #F7F1EA, border & glyph #181818)
  Widget _buildCategoriesSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Categories',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: categoryBorderAndIcon,
                ),
              ),
              InkWell(
                onTap: () => context.push('/categories'),
                child: Text(
                  'See All',
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: AppColors.greyDark,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 100,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            scrollDirection: Axis.horizontal,
            itemCount: _categories.length,
            separatorBuilder: (context, index) => const SizedBox(width: 18),
            itemBuilder: (context, index) {
              final cat = _categories[index];
              return InkWell(
                onTap: () => context.push('/categories'),
                borderRadius: BorderRadius.circular(20),
                child: Column(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: categoryCircleBg,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: categoryBorderAndIcon,
                          width: 1.5,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.black.withValues(alpha: 0.04),
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Icon(
                          cat['icon'] as IconData,
                          color: categoryBorderAndIcon,
                          size: 24,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      cat['name'] as String,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: categoryBorderAndIcon,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // 4. Floating Pill Bottom Navigation Bar: Solid BLACK (#101110), active Home highlighted (#CBAF7E) vs inactive (#FFFFFF @ 65%)
  Widget _buildFloatingBottomNav(BuildContext context) {
    return Container(
      height: 64,
      decoration: BoxDecoration(
        color: bottomNavBg,
        borderRadius: BorderRadius.circular(36),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.3),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // 1. Home (Active highlighted tab in gold #CBAF7E)
          _buildNavItem(
            icon: Icons.home_filled,
            color: navActiveGold,
            onTap: () {},
          ),
          // 2. Categories (Grid outline in inactive light white #A6FFFFFF)
          _buildNavItem(
            icon: Icons.grid_view_outlined,
            color: navInactiveWhite,
            onTap: () => context.push('/categories'),
          ),
          // 3. Frame / Rounded Square outline
          _buildNavItem(
            icon: Icons.crop_square_rounded,
            color: navInactiveWhite,
            onTap: () => context.push('/search'),
          ),
          // 4. Heart / Favorites outline
          _buildNavItem(
            icon: Icons.favorite_border_rounded,
            color: navInactiveWhite,
            onTap: () {},
          ),
          // 5. Profile outline
          _buildNavItem(
            icon: Icons.person_outline_rounded,
            color: navInactiveWhite,
            onTap: () => context.push('/profile'),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Icon(
          icon,
          size: 22,
          color: color,
        ),
      ),
    );
  }
}
