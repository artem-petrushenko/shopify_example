import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopify_example/src/core/logger.dart';
import 'package:shopify_example/src/feature/product_details/data/repository/products_repository.dart';
import 'package:shopify_example/src/feature/product_details/model/product_model.dart';

part 'fetch_product_recommendations_event.dart';

part 'fetch_product_recommendations_state.dart';

part 'fetch_product_recommendations_bloc.freezed.dart';

class FetchProductRecommendationsBloc extends Bloc<
    FetchProductRecommendationsEvent, FetchProductRecommendationsState> {
  FetchProductRecommendationsBloc(
    this._id, {
    required final ProductsRepository productsRepository,
  })  : _productsRepository = productsRepository,
        super(const _Initial()) {
    on<FetchProductRecommendationsEvent>(
      (event, emit) => event.map(
        fetchProductRecommendations: (event) =>
            _onFetchProductRecommendations(event, emit),
      ),
    );
  }

  final String _id;
  final ProductsRepository _productsRepository;

  List<ProductModel> get _oldProducts => state.maybeMap(
        loading: (state) => state.oldProducts,
        success: (state) => state.products,
        failure: (state) => state.oldProducts,
        orElse: () => [],
      );

  Future<void> _onFetchProductRecommendations(
    _FetchProductRecommendations event,
    Emitter<FetchProductRecommendationsState> emit,
  ) async {
    if (state is _Loading) return;

    try {
      emit(const _Loading());
      final products = await _productsRepository.getRecommendations(id: _id);
      emit(_Success(products: products.productRecommendations));
    } on Object catch (error, stackTrace) {
      logger.error(
        'Failed to fetch product recommendations',
        error: error,
        stackTrace: stackTrace,
      );
      emit(_Failure(
        message: 'Failed to fetch product recommendations',
        oldProducts: _oldProducts,
      ));
    }
  }
}
