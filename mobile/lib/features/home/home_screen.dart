import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/constants/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentNavIndex = 0;

  final List<Map<String, dynamic>> _categories = const [
    {
      'name': 'T-Shirts',
      'icon': Icons.checkroom_rounded,
    },
    {
      'name': 'Shirts',
      'icon': Icons.dry_cleaning_rounded,
    },
    {
      'name': 'Pants',
      'icon': Icons.straighten_rounded,
    },
    {
      'name': 'Jackets',
      'icon': Icons.layers_rounded,
    },
    {
      'name': 'Hoodies',
      'icon': Icons.accessibility_new_rounded,
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
                  // 1. Top Bar: Greeting + Search Icon
                  _buildTopBar(context),
                  const SizedBox(height: 20),

                  // 2. Hero Banner Matching UI_design.png
                  _buildHeroBanner(context),
                  const SizedBox(height: 28),

                  // 3. Categories Section
                  _buildCategoriesSection(context),
                ],
              ),
            ),

            // 4. Floating Pill Bottom Navigation Bar Matching UI_design.png
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
                      color: AppColors.forestGreenDark,
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
          // Search Icon Button (matching mockup, no cart icon)
          InkWell(
            onTap: () => context.push('/search'),
            borderRadius: BorderRadius.circular(24),
            child: Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.creamDark, width: 1.2),
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

  Widget _buildHeroBanner(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        height: 380,
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFF163328),
          borderRadius: BorderRadius.circular(28),
          boxShadow: [
            BoxShadow(
              color: AppColors.forestGreenDark.withValues(alpha: 0.25),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            // Right Side Model Image
            Positioned(
              top: 0,
              bottom: 0,
              right: 0,
              left: 80,
              child: Image.asset(
                'assets/images/hero_model.jpg',
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: const Color(0xFF163328),
                    child: const Center(
                      child: Icon(
                        Icons.person_rounded,
                        size: 80,
                        color: AppColors.gold,
                      ),
                    ),
                  );
                },
              ),
            ),

            // Left-to-Right Subtle Forest Gradient to blend image smoothly
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xFF163328),
                      const Color(0xFF163328).withValues(alpha: 0.85),
                      Colors.transparent,
                    ],
                    stops: const [0.0, 0.45, 0.85],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
              ),
            ),

            // Left Bottom Typography & CTA matching mockup
            Positioned(
              left: 24,
              bottom: 24,
              right: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'NEW COLLECTION',
                    style: GoogleFonts.poppins(
                      color: AppColors.gold,
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 2.0,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'SUMMER\nVIBES',
                    style: GoogleFonts.poppins(
                      color: AppColors.cream,
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      height: 1.1,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 18),
                  InkWell(
                    onTap: () => context.push('/categories'),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Explore Now',
                          style: GoogleFonts.poppins(
                            color: AppColors.cream,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          width: 34,
                          height: 34,
                          decoration: const BoxDecoration(
                            color: AppColors.gold,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.arrow_forward_rounded,
                            size: 18,
                            color: AppColors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

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
                  color: AppColors.forestGreenDark,
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
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        color: const Color(0xFF232323),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.black.withValues(alpha: 0.08),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Icon(
                          cat['icon'] as IconData,
                          color: AppColors.cream,
                          size: 26,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      cat['name'] as String,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.forestGreenDark,
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

  Widget _buildFloatingBottomNav(BuildContext context) {
    return Container(
      height: 64,
      decoration: BoxDecoration(
        color: const Color(0xFF14241C),
        borderRadius: BorderRadius.circular(36),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.35),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // 1. Home
          _buildNavItem(
            index: 0,
            icon: Icons.home_rounded,
            isSelected: _currentNavIndex == 0,
            onTap: () => setState(() => _currentNavIndex = 0),
          ),
          // 2. Categories / Grid
          _buildNavItem(
            index: 1,
            icon: Icons.grid_view_rounded,
            isSelected: _currentNavIndex == 1,
            onTap: () {
              setState(() => _currentNavIndex = 1);
              context.push('/categories');
            },
          ),
          // 3. Search
          _buildNavItem(
            index: 2,
            icon: Icons.crop_free_rounded,
            isSelected: _currentNavIndex == 2,
            onTap: () {
              setState(() => _currentNavIndex = 2);
              context.push('/search');
            },
          ),
          // 4. Favorites / Heart
          _buildNavItem(
            index: 3,
            icon: Icons.favorite_border_rounded,
            isSelected: _currentNavIndex == 3,
            onTap: () {
              setState(() => _currentNavIndex = 3);
            },
          ),
          // 5. Profile
          _buildNavItem(
            index: 4,
            icon: Icons.person_outline_rounded,
            isSelected: _currentNavIndex == 4,
            onTap: () {
              setState(() => _currentNavIndex = 4);
              context.push('/profile');
            },
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required IconData icon,
    required bool isSelected,
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
          color: isSelected ? AppColors.gold : AppColors.cream.withValues(alpha: 0.75),
        ),
      ),
    );
  }
}
