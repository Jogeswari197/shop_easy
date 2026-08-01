import 'package:flutter/material.dart';

import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_textstyles.dart';
import '../../../../dev_tools/sample_categories.dart';
import '../../data/models/category_model.dart';
import 'category_item.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {


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
            itemCount: SampleCategories.categories.length,
            itemBuilder: (context, index) {

              final category =
              SampleCategories.categories[index];

              return CategoryItem(
                category: category,
              );
            },
          )
        ),

      ],
    );
  }
}