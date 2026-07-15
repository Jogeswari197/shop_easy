import 'package:flutter/material.dart';
import 'package:shop_easy/features/home/presentation/widgets/category_section.dart';
import 'package:shop_easy/features/home/presentation/widgets/featured_product_section.dart';
import 'package:shop_easy/features/home/presentation/widgets/home_banner.dart';
import 'package:shop_easy/features/home/presentation/widgets/home_header.dart';

import '../../../core/theme/app_spacing.dart';
import '../../../core/widgets/app_searchbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeHeader(),
            
                const SizedBox(
                  height: AppSpacing.lg,
                ),
            
                AppSearchBar(
                  hintText: "Search products...",
                ),

                const SizedBox(
                  height: AppSpacing.xl,
                ),

                 HomeBanner(),
                const SizedBox(
                  height: AppSpacing.xl,
                ),

                 CategorySection(),

                const SizedBox(
                  height: AppSpacing.xl,
                ),

                 FeaturedProductsSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}