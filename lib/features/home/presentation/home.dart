import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_easy/features/home/presentation/widgets/category_section.dart';
import 'package:shop_easy/features/home/presentation/widgets/featured_product_section.dart';
import 'package:shop_easy/features/home/presentation/widgets/home_banner.dart';
import 'package:shop_easy/features/home/presentation/widgets/home_header.dart';

import '../../../core/theme/app_spacing.dart';
import '../../../core/widgets/app_error_widget.dart';
import '../../../core/widgets/app_searchbar.dart';
import '../../../core/widgets/empty_state_widget.dart';
import '../../../core/widgets/loading_widgets.dart';
import '../../product/presenation/providers/product_providers.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsAsync = ref.watch(
      productsProvider,
    );
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeHeader(),

                const SizedBox(
                  height: AppSpacing.lg,
                ),

                const AppSearchBar(
                  hintText: "Search products...",
                ),

                const SizedBox(
                  height: AppSpacing.xl,
                ),

                 const HomeBanner(),
                const SizedBox(
                  height: AppSpacing.xl,
                ),

                 const CategorySection(),

                const SizedBox(
                  height: AppSpacing.xl,
                ),

                productsAsync.when(

                  loading: () => const LoadingWidget(),

                  error: (error, stackTrace) {
                    return AppErrorWidget(
                      message: error.toString(),
                    );
                  },

                  data: (products) {

                    if (products.isEmpty) {
                      return const EmptyStateWidget(
                        message: "No Products Found",
                      );
                    }

                    return FeaturedProductsSection(
                      products: products,
                    );

                  },

                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}