import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'providers/cart_provider.dart';
import 'widgets/cart_item_card.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(cartProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cart"),
      ),

      body: state.items.isEmpty
          ? const Center(
        child: Text(
          "Your cart is empty",
        ),
      )
          : ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: state.items.length,
        itemBuilder: (context, index) {

          final item = state.items[index];

          return CartItemCard(
            item: item,

            onIncrease: () {
              ref
                  .read(cartProvider.notifier)
                  .increaseQuantity(item.id);
            },

            onDecrease: () {
              ref
                  .read(cartProvider.notifier)
                  .decreaseQuantity(item.id);
            },

            onRemove: () {
              ref
                  .read(cartProvider.notifier)
                  .removeItem(item.id);
            },
          );
        },
      ),

      bottomNavigationBar: state.items.isEmpty
          ? null
          : SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),

          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            boxShadow: const [
              BoxShadow(
                blurRadius: 8,
                color: Colors.black12,
              ),
            ],
          ),

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [

                  const Text(
                    "Total",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    "₹${state.totalPrice.toStringAsFixed(0)}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                ],
              ),

              const SizedBox(height: 16),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    "Proceed to Checkout",
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}