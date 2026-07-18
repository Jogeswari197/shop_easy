import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_easy/features/product/presenation/providers/product_providers.dart';

import '../../../core/widgets/app_button.dart';

class ProductDetailsScreen extends ConsumerStatefulWidget {
  final String productId;

  const ProductDetailsScreen({
    super.key,
    required this.productId,
  });

  @override
  ConsumerState<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends ConsumerState<ProductDetailsScreen> {

  @override
  Widget build(BuildContext context) {
    final productAsync = ref.watch(
      productProvider(widget.productId),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Details"),
      ),
      body: productAsync.when(
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),

        error: (error, stackTrace) {
          return Center(
            child: Text(
              error.toString(),
            ),
          );
        },

        data: (product) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Icon(
                    Icons.image,
                    size: 100,
                  ),
                ),
                const SizedBox(height: 20),

                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      product.rating.toString(),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                Center(
                  child: Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                Row(
                  children: [

                    Text(
                      "₹${product.price}",
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(width: 12),

                    Text(
                      "${product.discount}% OFF",
                      style: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                const Text(
                  "Description",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  product.description,
                ),
                const SizedBox(height: 30),

                AppButton(
                  text: "Add to Cart",
                  onPressed: () {
                    // We'll implement this later.
                  },
                  isLoading: false,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}