import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';
import '../widgets/cart_item.dart' as ci;

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Total',
                      style: TextStyle(
                        fontSize: 20,
                      )),
                  const Spacer(),
                  Consumer<Cart>(
                    builder: (ctx, cart, child) => Chip(
                      label: Text(
                        '\$${cart.totalAmount}',
                        style: TextStyle(
                          color: Theme.of(context)
                              .primaryTextTheme
                              .headline6
                              ?.color,
                        ),
                      ),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  TextButton(
                    child: const Text("ORDER NOW"),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Consumer<Cart>(
            builder: (ctx, cart, child) => Expanded(
              child: ListView.builder(
                itemBuilder: (ctx, i) {
                  CartItem? pci =
                      cart.items.values.toList()[i]; //Provider's Cart item
                  return ci.CartItem(pci.id, pci.price, pci.quantity,
                      pci.title); //Cart item widget
                },
                itemCount: cart.items.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
