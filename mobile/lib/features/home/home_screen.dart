import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/constants/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
      backgroundColor: AppColors.cream,
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

                  // 2. Hero Section: TWO SEPARATE STACKED ELEMENTS (matching mockup)
                  _buildHeroSection(context),
                  const SizedBox(height: 24),

                  // 3. Categories Section: OUTLINED CIRCLES (matching mockup)
                  _buildCategoriesSection(context),
                ],
              ),
            ),

            // 4. Floating Pill Bottom Navigation Bar: BLACK, OUTLINED ICONS (matching mockup)
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

  // 1. Top Bar with BLACK text
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
                      color: AppColors.black,
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
                color: AppColors.black,
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
          // 2a. Top element: Plain photo/image block (no text overlay)
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

          // 2b. Bottom element: Solid dark-green card (no image, text + button only)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
            decoration: BoxDecoration(
              color: const Color(0xFF1A382C),
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
                    Text(
                      'NEW COLLECTION',
                      style: GoogleFonts.poppins(
                        color: AppColors.cream.withValues(alpha: 0.8),
                        fontSize: 10,
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
                // Circular gold arrow button
                InkWell(
                  onTap: () => context.push('/categories'),
                  borderRadius: BorderRadius.circular(22),
                  child: Container(
                    width: 44,
                    height: 44,
                    decoration: const BoxDecoration(
                      color: AppColors.gold,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.arrow_forward_rounded,
                      size: 20,
                      color: AppColors.black,
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

  // 3. Categories Section: OUTLINED circles, black borders, black text
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
                  color: AppColors.black,
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
                        color: AppColors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.black,
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
                          color: AppColors.black,
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
                        color: AppColors.black,
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

  // 4. Floating Pill Bottom Navigation Bar: Solid BLACK, uniform white outline icons
  Widget _buildFloatingBottomNav(BuildContext context) {
    return Container(
      height: 64,
      decoration: BoxDecoration(
        color: AppColors.black,
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
          // 1. Home (Outline)
          _buildNavItem(
            icon: Icons.home_outlined,
            onTap: () {},
          ),
          // 2. Categories (Grid outline)
          _buildNavItem(
            icon: Icons.grid_view_outlined,
            onTap: () => context.push('/categories'),
          ),
          // 3. Frame / Rounded Square outline (matching mockup tile 2)
          _buildNavItem(
            icon: Icons.crop_square_rounded,
            onTap: () => context.push('/search'),
          ),
          // 4. Heart / Favorites outline
          _buildNavItem(
            icon: Icons.favorite_border_rounded,
            onTap: () {},
          ),
          // 5. Profile outline
          _buildNavItem(
            icon: Icons.person_outline_rounded,
            onTap: () => context.push('/profile'),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
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
          color: AppColors.white,
        ),
      ),
    );
  }
}
