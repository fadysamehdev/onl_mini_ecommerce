import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onl_mini_ecommerce/cart_item.dart';
import 'package:onl_mini_ecommerce/consts.dart';
import 'package:onl_mini_ecommerce/cubits/cart_cubit.dart/cart_cubit.dart';
import 'package:onl_mini_ecommerce/cubits/product_cubit/product_cubit.dart';
import 'package:onl_mini_ecommerce/product_model.dart';
import 'package:onl_mini_ecommerce/product_service.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:onl_mini_ecommerce/screens/splash_screen.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(ProductAdapter());
  Hive.registerAdapter(CartItemAdapter());

  final cartBox = await Hive.openBox<CartItem>(cartBoxName);

  runApp( MyApp(cartBox: cartBox,));
}

class MyApp extends StatelessWidget {
  final service = ProductService();
  final Box<CartItem> cartBox;
   MyApp({super.key, required this.cartBox});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CartCubit>(
          create: (_) => CartCubit(cartBox)..loadCart()
          ),
          BlocProvider(
            create: (_) => ProductCubit(service)..fetchProducts()
            )
      ],
       child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
       ));
  }
}
