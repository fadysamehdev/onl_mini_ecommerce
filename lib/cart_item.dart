import 'package:hive/hive.dart';
import 'package:onl_mini_ecommerce/product_model.dart';

part 'cart_item.g.dart';

@HiveType(typeId: 2) 
class CartItem extends HiveObject {

  @HiveField(0)
  final Product product;

  @HiveField(1)
  int quantity;

  CartItem({
    required this.product,
    required this.quantity,
  });
}