import 'package:flutter/material.dart';

import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_textstyles.dart';
import '../models/category_model.dart';
import 'category_item.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {

    const categories = [

      CategoryModel(
        title: "Shoes",
        icon: Icons.hiking,
      ),

      CategoryModel(
        title: "Mobiles",
        icon: Icons.phone_android,
      ),

      CategoryModel(
        title: "Fashion",
        icon: Icons.checkroom,
      ),

      CategoryModel(
        title: "Laptop",
        icon: Icons.laptop,
      ),

      CategoryModel(
        title: "Groceries",
        icon: Icons.local_grocery_store,
      ),

    ];

    return Column(
      crossAxisAlignment:
      CrossAxisAlignment.start,
      children: [

        Text(
          "Categories",
          style: AppTextStyles.title,
        ),

        const SizedBox(
          height: AppSpacing.md,
        ),

        SizedBox(
          height: 120,

          child: ListView.builder(
            scrollDirection: Axis.horizontal,

            itemCount: categories.length,

            itemBuilder: (context, index) {

              return CategoryItem(
                category: categories[index],
              );

            },
          ),
        ),

      ],
    );
  }
}