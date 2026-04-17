import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onl_mini_ecommerce/cubits/product_cubit/product_state.dart';
import 'package:onl_mini_ecommerce/product_service.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductService service;
  ProductCubit(this.service) : super(ProductInitial());

  void fetchProducts() async { 
      emit(ProductLoading());
      try{
        final products = await service.getProducts();
        emit(ProductSuccess(products: products));
      }catch(e){
        emit(ProductFailure(error: e.toString()));
      }
  }
}