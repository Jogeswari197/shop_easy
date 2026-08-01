import 'package:flutter/material.dart';

import '../core/constants/app_categories.dart';
import '../features/home/data/models/category_model.dart';

class SampleCategories {
  static const categories = [

    CategoryModel(
      name: AppCategories.shoes,
      icon: Icons.shopping_bag,
    ),

    CategoryModel(
      name: AppCategories.mobiles,
      icon: Icons.phone_android,
    ),

    CategoryModel(
      name: AppCategories.laptops,
      icon: Icons.laptop,
    ),

    CategoryModel(
      name: AppCategories.audio,
      icon: Icons.headphones,
    ),

    CategoryModel(
      name: AppCategories.accessories,
      icon: Icons.watch,
    ),
  ];
}