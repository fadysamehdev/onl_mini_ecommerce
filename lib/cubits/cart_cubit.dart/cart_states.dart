import 'package:onl_mini_ecommerce/cart_item.dart';

abstract class CartState {}
class CartInitial extends CartState{}
class CartLoading extends CartState{}
class CartLoaded extends CartState{
  final List<CartItem> items;

  CartLoaded({required this.items});
}
class CartError extends CartState{
  final String message;

  CartError({required this.message});
}
