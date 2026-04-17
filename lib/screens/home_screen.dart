import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onl_mini_ecommerce/cart_icon.dart';
import 'package:onl_mini_ecommerce/cart_item.dart';
import 'package:onl_mini_ecommerce/cubits/cart_cubit.dart/cart_cubit.dart';
import 'package:onl_mini_ecommerce/cubits/product_cubit/product_cubit.dart';
import 'package:onl_mini_ecommerce/cubits/product_cubit/product_state.dart';
import 'package:onl_mini_ecommerce/product_item.dart';
import 'package:onl_mini_ecommerce/screens/details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(centerTitle: true,title: Text('Mini E-Commerce'),
      actions: [
       CartIcon()
      ],
      ),
  body: BlocBuilder<ProductCubit,ProductState>(
    builder: (context,state){
      //loading
      if(state is ProductLoading){
        return Center(child: CircularProgressIndicator(),);
      } 
      // error
      if(state is ProductFailure){
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error , color: Colors.red,size: 40,),
            Text('''
              Error
              ${state.error}
              ''',
              style: TextStyle(
                fontSize: 40
              ),
              )
          ],
        ); 
      }
      if(state is ProductSuccess){
        final products = state.products;
        return GridView.builder(
            itemCount: products.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: .7
              ),

             itemBuilder: (context,index) => ProductItem(
              product: products[index],
              onTap: () { 
                Navigator.push(context,
                MaterialPageRoute(
                  builder: (context)=> DetailsScreen(product: products[index] )
                  )
                  );
               }, onPressed: () { 
                context.read<CartCubit>().addToCart(CartItem(product: products[index], quantity: 1));
                },
               )
             
             );
         
      }
      return SizedBox();
    }
    ),
    );
  }
}