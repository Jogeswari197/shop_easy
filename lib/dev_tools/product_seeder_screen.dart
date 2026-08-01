import 'package:flutter/material.dart';
import 'package:shop_easy/dev_tools/product_seeder.dart';

import '../core/widgets/app_button.dart';

class ProductSeederScreen extends StatefulWidget {
  const ProductSeederScreen({super.key});

  @override
  State<ProductSeederScreen> createState() =>
      _ProductSeederScreenState();
}

class _ProductSeederScreenState
    extends State<ProductSeederScreen> {
  bool isLoading = false;

  Future<void> seedProducts() async {
    setState(() {
      isLoading = true;
    });

    try {
      await ProductSeeder.seedProducts();

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Products added successfully.",
          ),
        ),
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
          ),
        ),
      );
    }

    if (!mounted) return;

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Seeder"),
      ),

      body: Center(
        child: AppButton(
          text: "Seed Products",
          isLoading: isLoading,
          onPressed: seedProducts,
        ),
      ),
    );
  }
}