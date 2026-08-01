import 'package:flutter/material.dart';

import '../models/cart_item_model.dart';

class CartItemCard extends StatelessWidget {
  final CartItemModel item;

  final VoidCallback onIncrease;
  final VoidCallback onDecrease;
  final VoidCallback onRemove;

  const CartItemCard({
    super.key,
    required this.item,
    required this.onIncrease,
    required this.onDecrease,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        vertical: 8,
      ),

      child: Padding(
        padding: const EdgeInsets.all(16),

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Container(
              width: 80,
              height: 80,

              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
              ),

              child: const Icon(
                Icons.image,
                size: 40,
              ),
            ),

            const SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [

                  Text(
                    item.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    "₹${item.price}",
                  ),

                  const SizedBox(height: 12),

                  Row(
                    children: [

                      IconButton(
                        onPressed: onDecrease,
                        icon: const Icon(
                          Icons.remove_circle_outline,
                        ),
                      ),

                      Text(
                        item.quantity.toString(),
                      ),

                      IconButton(
                        onPressed: onIncrease,
                        icon: const Icon(
                          Icons.add_circle_outline,
                        ),
                      ),

                    ],
                  ),

                  TextButton.icon(
                    onPressed: onRemove,
                    icon: const Icon(
                      Icons.delete_outline,
                      color: Colors.red,
                    ),
                    label: const Text(
                      "Remove",
                      style: TextStyle(
                        color: Colors.red,
                      ),
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
}