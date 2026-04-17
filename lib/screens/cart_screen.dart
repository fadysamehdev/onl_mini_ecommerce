import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onl_mini_ecommerce/cubits/cart_cubit.dart/cart_cubit.dart';
import 'package:onl_mini_ecommerce/cubits/cart_cubit.dart/cart_states.dart';
import 'package:onl_mini_ecommerce/screens/details_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Cart'),
        ),
        body: BlocBuilder<CartCubit,CartState>(
          builder: (context , state){
            //loading
      if(state is CartLoading){
        return Center(child: CircularProgressIndicator(),);
      } 
      //error
       if(state is CartError){
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error , color: Colors.red,size: 40,),
            Text('''
              Error
              ${state.message}
              ''',
              style: TextStyle(
                fontSize: 40
              ),
              )
          ],
        ); 
      }

      if(state is CartLoaded){
        if(state.items.isEmpty){
          return Center(child: Text('🛒 Cart Is Empty 🛒',style: TextStyle(fontSize: 30),),);
        }
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: state.items.length,
                  itemBuilder: (context,index){
                    final item = state.items[index];
                    final product = item.product;
                    return InkWell(
                      onTap: () {
                        Navigator.push(context,
                MaterialPageRoute(
                  builder: (context)=> DetailsScreen(product: product )));
              
                      },
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            leading: Image.network(
                              product.thumbnail
                            ),
                            title: Text(product.title),
                            subtitle: Text('\$${product.price}'),
                            trailing: IconButton(onPressed: (){
                              context.read<CartCubit>().removeFromCart(index);
                            },
                             icon: Icon(Icons.delete)
                             ),
                          ),
                        ),
                      ),
                    );
                  }
                  ),
              ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Sub total'),
                        Text('\$1500')
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(12)
                      ),
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.white
                    ),
                   child: Text('Checkout')),
                )
            ],
          ),
        );
      }

  return SizedBox();
          }
          )
    );
  }
}