import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:onl_mini_ecommerce/cart_item.dart';
import 'package:onl_mini_ecommerce/cubits/cart_cubit.dart/cart_cubit.dart';
import 'package:onl_mini_ecommerce/product_model.dart';
import 'package:onl_mini_ecommerce/screens/cart_screen.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;
  const DetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(onPressed: (){
            Navigator.push(context,
                MaterialPageRoute(
                  builder: (context)=> CartScreen()));
          },
           icon: Icon(Icons.shopping_cart
            )
           ),
        )
      ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Card(
              margin: EdgeInsets.only(top: 40,bottom: 20),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: CarouselSlider(
                  items: product.images.map(
                    (url){
                      return Image.network(url);
                    }
                    ).toList(),
                 options: CarouselOptions(
                  height: 200,
                  autoPlay: true,
                  enlargeCenterPage: true,
                 )
                 ),
              ),
            ),
           Card(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                   Text(
                product.title,
                style: TextStyle(fontSize: 25,
                fontWeight: FontWeight.bold
                ),
                ),
                Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                              Text(
                              '\$${product.price}',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                           RatingStars(
                            value: product.rating,
                            valueLabelVisibility: false,
                            starColor: Colors.yellow.shade700,
                            starSize: 20,
                           )
                            ],
                            ),
                ],
              ),
            ),
           ),
           SizedBox(height: 10,),
           Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                product.description,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500
                ),
                ),
            ),
           ),
          Spacer(),
           ElevatedButton(
            onPressed: (){
              context.read<CartCubit>().addToCart(CartItem(product: product, quantity: 1));
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(12),
              ),
              backgroundColor: Colors.deepOrange,
              foregroundColor: Colors.white
            ),
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
    );
  }
}