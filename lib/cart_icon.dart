import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onl_mini_ecommerce/cubits/cart_cubit.dart/cart_cubit.dart';
import 'package:onl_mini_ecommerce/cubits/cart_cubit.dart/cart_states.dart';
import 'package:onl_mini_ecommerce/screens/cart_screen.dart';

class CartIcon extends StatelessWidget {
  const CartIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit , CartState>(
      builder: (context, state){
        int count = 0;

        if(state is CartLoaded){
          count = state.items.length;
        }
        
        return Stack(
          children: [
            IconButton( onPressed: (){
             Navigator.push(context,
                MaterialPageRoute(
                  builder: (context)=> CartScreen()));
               },
             icon: Icon(
             Icons.shopping_cart 
             )
             ),
              count > 0 ? 
              Positioned(
                right: 4,
                top: 4,
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  constraints: BoxConstraints(
                    minHeight: 16,
                    maxWidth: 16
                  ),
                  child: Text(
                    count.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ) : 
              SizedBox(),
          ],
        );

      }
      
      
      );
  }
}