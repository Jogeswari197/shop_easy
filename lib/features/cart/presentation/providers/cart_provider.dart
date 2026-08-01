import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../data/data_source/cart_local_data_source.dart';
import '../../data/repositories/cart_repositories_impl.dart';
import '../../domain/repositories/cart_repository.dart';
import '../models/cart_item_model.dart';
import 'cart_notifier.dart';
import 'cart_state.dart';

final cartLocalDataSourceProvider =
Provider<CartLocalDataSource>((ref) {
  return CartLocalDataSource();
});

final cartRepositoryProvider =
Provider<CartRepository>((ref) {

  return CartRepositoryImpl(
    ref.read(cartLocalDataSourceProvider),
  );

});


final cartProvider =
StateNotifierProvider<CartNotifier, CartState>(
      (ref) {

    return CartNotifier(
      ref.read(cartRepositoryProvider),
    );

  },
);