import 'package:flutter/material.dart';
import 'package:food_order_delivery/provider/number_of_orders.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer<NumbersOfOrdersProvider>(
                  builder: (context, numbersOfOrders, child) {
                return Text(
                  'the total price is  \$${numbersOfOrders.totalPrice}',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                );
              }),
              SizedBox(height: 50),
              ButtonTheme(
                height: 70,
                child: RaisedButton(
                    color: Colors.green,
                    onPressed: () {},
                    child: Text(
                      'you could pay by visa card',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w500),
                    )),
              ),
              SizedBox(height: 30),
              ButtonTheme(
                height: 70,
                child: RaisedButton(
                    color: Colors.blue,
                    onPressed: () {},
                    child: Text(
                      'you could pay by PayPal',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w500),
                    )),
              ),
              SizedBox(height: 30),
              ButtonTheme(
                height: 70,
                child: RaisedButton(
                    color: Colors.orange,
                    onPressed: () {},
                    child: Text(
                      'you could pay by visa Strip',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w500),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
