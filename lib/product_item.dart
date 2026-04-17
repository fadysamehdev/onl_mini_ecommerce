import 'package:flutter/material.dart';
import 'package:onl_mini_ecommerce/product_model.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  final Function() onTap;
  final void Function() onPressed;
  const ProductItem({super.key, required this.product,required this.onTap,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                      SizedBox(height: 10,),
                          Image.network(product.thumbnail,
                        height: 120,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            product.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14
                            ),
                            ),
                        ),
                     SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                            Text(
                            '\$${product.price}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                          Text('${product.rating} ⭐')
                          ],
                          ),
                        ),
                        SizedBox(height: 10,),
                        ElevatedButton(
                          onPressed: onPressed,
                          child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                            Icon(Icons.shopping_cart),
                             Text(' Add to Cart'),
                           ],
                         ),
                         )
                      ],
                    ),
                  ),
                ),
    );
  }
}