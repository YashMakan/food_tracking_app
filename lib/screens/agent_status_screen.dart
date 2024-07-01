import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_tracking_app/screens/order_tracking_screen.dart';
import 'package:food_tracking_app/utils/constants.dart';
import 'package:food_tracking_app/utils/models/order.dart';

class AgentStatusScreen extends StatefulWidget {
  const AgentStatusScreen({super.key});

  @override
  State<AgentStatusScreen> createState() => _AgentStatusScreenState();
}

class _AgentStatusScreenState extends State<AgentStatusScreen> {
  List<OrderModel> availableOrders = [order, order, order, order];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Row(
          children: [
            Text(
              "Finding orders nearby...",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(width: 10),
            CupertinoActivityIndicator(
              color: Colors.white,
            )
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: availableOrders.length,
        itemBuilder: (context, index) {
          final product = availableOrders[index].product;
          return ListTile(
            title: Text(
              product.name,
              style: const TextStyle(color: Colors.black),
            ),
            subtitle: Text(
              product.merchantName,
              style: const TextStyle(color: Colors.black54),
            ),
            leading: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Container(
                width: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                        fit: BoxFit.fill, image: NetworkImage(product.image))),
              ),
            ),
            trailing: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OrderTrackingScreen(
                              order: availableOrders[index],
                          isAgent: true,
                            )));
              },
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  backgroundColor: primaryColor),
              child: const Text('Accept'),
            ),
          );
        },
      ),
    );
  }
}
