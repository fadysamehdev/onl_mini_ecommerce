import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:onl_mini_ecommerce/cart_item.dart';
import 'package:onl_mini_ecommerce/cubits/cart_cubit.dart/cart_states.dart';

class CartCubit extends Cubit<CartState>{
  final Box<CartItem> cartBox;
  CartCubit(this.cartBox) : super(CartInitial());
  Future<void> loadCart() async {
    try{
      emit(CartLoading());
      final items = cartBox.values.toList();
       emit(CartLoaded(items: items));
    }catch(e){
        emit(CartError(message: e.toString()));
    }
  }

  Future<void> addToCart(CartItem item) async {
    try{
        emit(CartLoading());
        await cartBox.add(item);
      final items = cartBox.values.toList();
       emit(CartLoaded(items: items));
    }catch(e){
        emit(CartError(message: e.toString()));
    }
  }
  Future<void> removeFromCart(int index) async{
     try{
        emit(CartLoading());
        await cartBox.deleteAt(index);
        
      final items = cartBox.values.toList();
       emit(CartLoaded(items: items));
    }catch(e){
        emit(CartError(message: e.toString()));
    }
  }
}