import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'providers/cart_provider.dart';

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

        itemCount: state.items.length,

        itemBuilder: (context, index) {

          final item = state.items[index];

          return ListTile(

            leading: const CircleAvatar(
              child: Icon(Icons.shopping_bag),
            ),

            title: Text(item.name),

            subtitle: Text(
              "₹${item.price}",
            ),

            trailing: Text(
              "Qty: ${item.quantity}",
            ),

          );

        },

      ),

    );
  }
}