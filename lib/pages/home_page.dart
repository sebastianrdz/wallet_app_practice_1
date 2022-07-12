// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wallet_app_ui/util/my_button.dart';
import 'package:wallet_app_ui/util/my_card.dart';
import 'package:wallet_app_ui/util/my_list_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // page controller
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.pink,
        child: Icon(
          Icons.monetization_on,
          size: 32,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.home,
                  size: 32,
                  color: Colors.pink[200],
                ),
              ),
              SizedBox(
                width: 40,
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.settings,
                  size: 32,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // App Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'My',
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        ' Cards',
                        style: TextStyle(
                          fontSize: 26,
                        ),
                      ),
                    ],
                  ),

                  // Plus Button
                  Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          color: Colors.grey[300], shape: BoxShape.circle),
                      child: Icon(Icons.add))
                ],
              ),
            ),

            SizedBox(
              height: 25.0,
            ),

            // Cards
            Container(
              height: 200,
              child: PageView(
                scrollDirection: Axis.horizontal,
                controller: _controller,
                children: [
                  MyCard(
                    balance: 5250.20,
                    cardNumber: 12345678,
                    expiryMonth: 10,
                    expiryYear: 24,
                    color: Colors.deepPurple[400],
                  ),
                  MyCard(
                    balance: 342.23,
                    cardNumber: 12345678,
                    expiryMonth: 11,
                    expiryYear: 25,
                    color: Colors.blue[400],
                  ),
                  MyCard(
                    balance: 9210.75,
                    cardNumber: 12345678,
                    expiryMonth: 7,
                    expiryYear: 29,
                    color: Colors.green[400],
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 10.0,
            ),

            SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: ExpandingDotsEffect(
                dotHeight: 6,
                dotWidth: 10,
                activeDotColor: Colors.grey.shade800,
              ),
            ),

            // 3 Buttons -> Send + pay + bills
            SizedBox(height: 25.0),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Send button
                  MyButton(iconImagePath: Icon(Icons.send), buttonText: 'Send'),
                  MyButton(iconImagePath: Icon(Icons.money), buttonText: 'Pay'),
                  MyButton(
                      iconImagePath: Icon(Icons.document_scanner),
                      buttonText: 'Bills'),
                ],
              ),
            ),
            SizedBox(
              height: 25.0,
            ),

            // Column -> stats + transactions
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  MyListTile(
                      iconImagePath: Icon(Icons.area_chart_outlined),
                      tileTitle: 'Statistics',
                      tileSubTitle: 'Payments and Income'),
                  MyListTile(
                      iconImagePath: Icon(Icons.area_chart_outlined),
                      tileTitle: 'Transactiosn',
                      tileSubTitle: 'Transaction History'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
