import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';

import '../../dto/order_product_dto.dart';
import '../../repositories/products/products_repository.dart';
import 'home_state.dart';

class HomeController extends Cubit<HomeState> {
  HomeController({
    required ProductsRepository productsRepository,
  })  : _productsRepository = productsRepository,
        super(
          const HomeState.initial(),
        );

  final ProductsRepository _productsRepository;

  Future<void> loadProducts() async {
    emit(
      state.copyWith(status: HomePageStatus.loading),
    );
    try {
      final products = await _productsRepository.findAllProducts();
      emit(
        state.copyWith(
          status: HomePageStatus.success,
          products: products,
        ),
      );
    } catch (e, s) {
      developer.log(
        'Error to load products',
        error: e,
        stackTrace: s,
      );
      emit(
        state.copyWith(
          status: HomePageStatus.error,
          errorMessage: 'Erro ao buscar produtos',
        ),
      );
    }
  }

  void addOrUpdateBag(OrderProductDto orderProdut) {
    final shoppingBag = [...state.shoppingBag];
    final orderIndex = shoppingBag.indexWhere(
      (product) => product.product.id == orderProdut.product.id,
    );

    if (orderIndex > -1) {
      if (orderProdut.amount == 0) {
        shoppingBag.removeAt(orderIndex);
      } else {
        shoppingBag[orderIndex] = orderProdut;
      }
    } else {
      shoppingBag.add(orderProdut);
    }

    emit(
      state.copyWith(shoppingBag: shoppingBag),
    );
  }
}
