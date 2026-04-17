import 'package:onl_mini_ecommerce/product_model.dart';

abstract class ProductState {}

class ProductInitial extends ProductState {

}

class ProductLoading extends ProductState {

}

class ProductSuccess extends ProductState {
final List<Product> products;

  ProductSuccess({required this.products});

}

class ProductFailure extends ProductState {
final String error;

  ProductFailure({required this.error});
}