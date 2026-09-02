import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/splash/splash_screen.dart';
import '../../features/categories/categories_screen.dart';
import '../../features/home/search_screen.dart';
import '../../features/product/product_detail_screen.dart';
import '../../features/cart/cart_screen.dart';
import '../../features/checkout/checkout_screen.dart';
import '../../features/orders/orders_screen.dart';
import '../../features/profile/profile_screen.dart';
import '../../features/profile/settings_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      name: 'splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/home',
      name: 'home',
      builder: (context, state) => const PlaceholderHomeScreen(),
    ),
    GoRoute(
      path: '/categories',
      name: 'categories',
      builder: (context, state) => const CategoriesScreen(),
    ),
    GoRoute(
      path: '/search',
      name: 'search',
      builder: (context, state) => const SearchScreen(),
    ),
    GoRoute(
      path: '/product/:id',
      name: 'product_detail',
      builder: (context, state) {
        final id = state.pathParameters['id'] ?? 'unknown';
        return ProductDetailScreen(id: id);
      },
    ),
    GoRoute(
      path: '/cart',
      name: 'cart',
      builder: (context, state) => const CartScreen(),
    ),
    GoRoute(
      path: '/checkout',
      name: 'checkout',
      builder: (context, state) => const CheckoutScreen(),
    ),
    GoRoute(
      path: '/orders',
      name: 'orders',
      builder: (context, state) => const OrdersScreen(),
    ),
    GoRoute(
      path: '/profile',
      name: 'profile',
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: '/settings',
      name: 'settings',
      builder: (context, state) => const SettingsScreen(),
    ),
  ],
);

class PlaceholderHomeScreen extends StatelessWidget {
  const PlaceholderHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final routes = [
      {'title': 'Categories Screen', 'path': '/categories', 'icon': Icons.category_outlined},
      {'title': 'Search Screen', 'path': '/search', 'icon': Icons.search_outlined},
      {'title': 'Product Details (:id = prod-789)', 'path': '/product/prod-789', 'icon': Icons.inventory_2_outlined},
      {'title': 'Cart Screen', 'path': '/cart', 'icon': Icons.shopping_bag_outlined},
      {'title': 'Checkout Screen', 'path': '/checkout', 'icon': Icons.payment_outlined},
      {'title': 'Orders Screen', 'path': '/orders', 'icon': Icons.receipt_long_outlined},
      {'title': 'Profile Screen', 'path': '/profile', 'icon': Icons.person_outline},
      {'title': 'Settings Screen', 'path': '/settings', 'icon': Icons.settings_outlined},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('AMAN FASHION'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Go to Splash',
            onPressed: () => context.go('/splash'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'AMAN FASHION',
              style: theme.textTheme.displayMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 6),
            Text(
              'Navigation Skeleton Verification',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.secondary,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ...routes.map(
              (r) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: ElevatedButton.icon(
                  icon: Icon(r['icon'] as IconData, size: 20),
                  label: Text(r['title'] as String),
                  onPressed: () => context.push(r['path'] as String),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
