import 'dart:core';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_order_delivery/model/food_product.dart';
import 'package:food_order_delivery/product_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> listOfMenu = [
    '🍔 Foot food',
    '🍅 Fruit item',
    '🥒 vegetables item'
  ];
  List<FoodProduct> listOfFood = [
    FoodProduct(
        nameOfFood: 'Egg Pasta',
        describeFood: 'spicy chicken pasta',
        calories: '🔥 78 calories',
        pathOfImage: 'images/2.png',
        price: '9.80',
        details: 'non',
        ingredients: 'non',
        time: 'non',
        stars: 'non'),
    FoodProduct(
        nameOfFood: 'chicken Dimsum',
        describeFood: 'Spicy chicken Dimsum',
        calories: '🔥 65 calories',
        pathOfImage: 'images/1.png',
        price: '6.99',
        details:
            'chicken Dimsum Recipe is the delicious evening snack during the winters and monsoons',
        ingredients: '🥩     🍅     🥕     🍆',
        time: '⏰ 20-30 min',
        stars: '⭐ 2.6'),
  ];
  int _selectedIndex = 0;
  int _selectedBNBItem = 0;
  int indNumIndex = 0;
  void bnBItem(int index) {
    setState(() => _selectedBNBItem = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarOfHomePage(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 32.0, top: 32),
              child: Text(
                'Let\'s eat \nQuality food 😋 ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32.0, top: 32, right: 32),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Color(0xFFFCFBFC),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.search,
                              size: 34,
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search food..',
                                hintStyle: TextStyle(
                                    fontSize: 14, color: Colors.grey[600]),
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Color(0xFFFFCC2E),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image.asset(
                        'images/search icon.png',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            menuListView(),
            foodListView()
          ],
        ),
      ),
      bottomNavigationBar: _bottomNavigationBar(),
      floatingActionButton: new FloatingActionButton(
        backgroundColor: Color(0xFFFFCC2E),
        onPressed: () {},
        tooltip: 'Increment',
        child: new Icon(
          Icons.shopping_cart,
          color: Colors.black,
        ),
        elevation: 5.0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _bottomNavigationBar() {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: IconButton(
              icon: Icon(
                Icons.home,
                size: 32,
                color: indNumIndex == 0 ? Color(0xFFFFCC2E) : Colors.grey[500],
              ),
              onPressed: () {
                indNumIndex = 0;
                bnBItem(indNumIndex);
              },
            ),
          ),
          Expanded(
            child: IconButton(
              icon: Icon(
                Icons.airport_shuttle,
                size: 32,
                color: indNumIndex == 1 ? Color(0xFFFFCC2E) : Colors.grey[500],
              ),
              onPressed: () {
                indNumIndex = 1;
                bnBItem(indNumIndex);
              },
            ),
          ),
          Expanded(child: new Text('')),
          Expanded(
            child: IconButton(
              icon: Icon(
                Icons.bookmark_border,
                size: 32,
                color: indNumIndex == 2 ? Color(0xFFFFCC2E) : Colors.grey[500],
              ),
              onPressed: () {
                indNumIndex = 2;
                bnBItem(indNumIndex);
              },
            ),
          ),
          Expanded(
            child: IconButton(
              icon: Icon(
                Icons.alarm,
                size: 32,
                color: indNumIndex == 3 ? Color(0xFFFFCC2E) : Colors.grey[500],
              ),
              onPressed: () {
                indNumIndex = 3;
                bnBItem(indNumIndex);
              },
            ),
          ),
        ],
      ),
    );
  }

  Container foodListView() {
    return Container(
      height: 400,
      child: ListView.builder(
        itemCount: listOfFood.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => ProductPage(listOfFood[i])),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        listOfFood[i].pathOfImage,
                        height: 200,
                        width: 200,
                      ),
                      SizedBox(height: 10),
                      Text(listOfFood[i].nameOfFood,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700)),
                      SizedBox(height: 7),
                      Text(listOfFood[i].describeFood,
                          style: TextStyle(fontSize: 20, color: Colors.grey)),
                      SizedBox(height: 7),
                      Text(listOfFood[i].calories,
                          style: TextStyle(fontSize: 20, color: Colors.red)),
                      SizedBox(height: 10),
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: '\$',
                            style: TextStyle(
                                fontSize: 24,
                                color: Color(0xFFF4D479),
                                fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: listOfFood[i].price,
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
              ),
            ),
          );
        },
      ),
    );
  }

  Widget menuListView() {
    return Padding(
      padding: const EdgeInsets.only(left: 32.0, top: 32),
      child: Container(
        height: 65,
        child: ListView.builder(
          itemCount: listOfMenu.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, i) {
            return GestureDetector(
              onTap: () {
                {
                  setState(() => _selectedIndex = i);
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFFFCC2E),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: Offset(0, 0), // changes position of shadow
                        ),
                      ],
                      color: _selectedIndex != null && _selectedIndex == i
                          ? Color(0xFFFFCC2E)
                          : Colors.white,
                      border: Border.all(color: Color(0xFFFFCC2E)),
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        listOfMenu[i],
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  AppBar _appBarOfHomePage() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      title: Text('Food delivery'),
      leading: IconButton(
          padding: const EdgeInsets.only(left: 18),
          icon: Image.asset('images/more icon.png'),
          onPressed: null),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 32, bottom: 4),
          child: Container(
            height: 40,
            width: 50,
            decoration: BoxDecoration(
                color: Color(0xFFF0C143),
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Stack(
              children: [
                Positioned(
                  bottom: 3,
                  right: 5,
                  child: GestureDetector(
                    onTap: () {
                      final authResult = FirebaseAuth.instance.signOut();
                    },
                    child: Image.asset('images/profile icon.png',
                        height: 40, width: 40),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
