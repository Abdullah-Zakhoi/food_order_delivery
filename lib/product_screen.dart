import 'package:flutter/material.dart';
import 'package:food_order_delivery/model/food_product.dart';
import 'package:flutter_icons/flutter_icons.dart';

class ProductPage extends StatefulWidget {
  ProductPage(this.itemOfFood);
  FoodProduct itemOfFood;

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int numberOfOrder = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarOfHomePage(),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                widget.itemOfFood.pathOfImage,
                height: 300,
                width: 400,
              ),
              SizedBox(height: 20),
              counterContainer(),
              SizedBox(height: 20),
              detailsParts(),
            ],
          ),
        ),
      ),
    );
  }

  Widget detailsParts() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 200,
                child: Text(widget.itemOfFood.describeFood,
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
              ),
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: '\$',
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFFF4D479),
                        fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: widget.itemOfFood.price,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w600),
                  ),
                ]),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Row(
            children: [
              Text(widget.itemOfFood.stars,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
              SizedBox(width: 30),
              Text(widget.itemOfFood.calories,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
              SizedBox(width: 30),
              Text(widget.itemOfFood.time,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            ],
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Details',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Text(
            widget.itemOfFood.details,
            style: TextStyle(
                fontSize: 16,
                color: Colors.grey[400],
                fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Ingredients',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.itemOfFood.ingredients,
              style: TextStyle(
                  fontSize: 42,
                  color: Colors.grey[500],
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ],
    );
  }

  Container counterContainer() {
    return Container(
      height: 40,
      width: 100,
      decoration: BoxDecoration(
        color: Color(0xFFF0C143),
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.remove,
              size: 28,
              color: Colors.grey[900],
            ),
            SizedBox(width: 3),
            Text(
              '1',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 24,
                color: Colors.grey[900],
              ),
            ),
            SizedBox(width: 3),
            Icon(
              Icons.add,
              size: 28,
              color: Colors.grey[900],
            ),
          ],
        ),
      ),
    );
  }

  AppBar _appBarOfHomePage() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      title: Text('Food delivery'),
      leading: Padding(
        padding: const EdgeInsets.only(
          left: 18,
        ),
        child: BackButton(
          color: Colors.grey[900],
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 32, top: 16),
          child: Container(
            height: 50,
            width: 40,

//            decoration: BoxDecoration(
//                borderRadius: BorderRadius.all(Radius.circular(5)),
//                border: Border.all(color: Colors.grey)),
            child: Stack(
              children: [
                Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xFFF0C143),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      height: 22,
                      width: 22,
                      child: Center(
                          child: Text(
                        numberOfOrder.toString(),
                        style: TextStyle(color: Colors.black),
                      )),
                    )),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.shopping_cart,
                      size: 22,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
